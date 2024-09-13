import 'dart:async';
import 'dart:math';

import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';

import 'package:http/http.dart' as http;

class CustomHttpClient extends http.BaseClient {
  final String apiKey;
  final http.Client _inner;

  CustomHttpClient(this._inner, this.apiKey);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['api-key'] = apiKey;
    return _inner.send(request);
  }
}

class CryptoAssetRepositoryEvmImpl extends CryptoAssetRepositoryImpl {
  final CryptoAssetInformation asset;
  final NetworkInformation network;
  final WalletAddress _wallet;
  final Web3Client _web3client;
  ContractAbi? _erc20Abi;
  late String tokenSymbol;

  @override
  Future<double> updateBalance() async {
    double newBalance = await getBalance();
    try {
      emit(state.copyWith(
          balance: newBalance, assetState: CryptoAssetState.loaded));
    } catch (e) {
      LogService.logger.e('update balance ${e}');
    }
    return newBalance;
  }

  @override
  Future<String> updateGasPrice() async {
    EtherAmount amount = await _web3client.getGasPrice();
    String gasPrice = (amount.getInWei / BigInt.from(1e9)).toStringAsFixed(0);
    try {
      emit(state.copyWith(gasPrice: gasPrice));
    } catch (e) {
      LogService.logger.e('update gas price ${e}');
    }
    return "$gasPrice Gwei";
  }

  CryptoAssetRepositoryEvmImpl({
    required WalletAddress walletAddress,
    required this.asset,
    required this.network,
  })  : _web3client =
            Web3Client(network.rpcUrl, CustomHttpClient(http.Client(), "")),
        _wallet = walletAddress,
        super(state: const CryptoAssetRepositoryState());

  @override
  Future<void> initialize() async {
    if (network.name == 'Binance') {
      final erc20AbiString =
          await rootBundle.loadString('assets/abi/BEP-20.json');

      _erc20Abi = ContractAbi.fromJson(erc20AbiString, 'BEP20');
    } else {
      // ! We use ERC20 for all other chains
      final erc20AbiString =
          await rootBundle.loadString('assets/abi/ERC-20.json');

      _erc20Abi = ContractAbi.fromJson(erc20AbiString, 'ERC20');
    }
    updateBalance();
  }

  @override
  Future<String> sendBalance(double amount, String toAddress) async {
    try {
      Transaction transaction;
      if (asset.type == AssetType.token) {
        transaction = await _sendTokenTransaction(
            tokenId: asset.tokenId,
            to: toAddress,
            amount: _convertToBigInt(amount));
      } else {
        transaction =
            await _sendCoin(to: toAddress, amount: _convertToBigInt(amount));
      }

      final Credentials credentials = EthPrivateKey.fromHex(_wallet.privateKey);
      final response = await _web3client
          .sendTransaction(credentials, transaction, chainId: network.chainId);
      return response;
    } catch (error) {
      LogService.logger.e('sendBalance ${error}');
    }

    return "";
  }

  @override
  Future<FunctionResponse> sendBalanceEstimateGas(
      double amount, String toAddress) async {
    Transaction transaction;
    if (asset.type == AssetType.token) {
      transaction = await _sendTokenTransaction(
          tokenId: asset.tokenId,
          to: toAddress,
          amount: _convertToBigInt(amount));
    } else {
      transaction =
          await _sendCoin(to: toAddress, amount: _convertToBigInt(amount));
    }
    BigInt fee = BigInt.from(0);
    try {
      fee = await _web3client.estimateGas(
        sender: EthereumAddress.fromHex(_wallet.publicKey),
        to: transaction.to,
        value: transaction.value,
        data: transaction.data,
      );
      return FunctionResponse(
          message: (fee *
                  BigInt.parse(state.gasPrice) /
                  BigInt.from(pow(10, asset.decimal)))
              .toStringAsFixed(13),
          statusCode: 1);
    } on RPCError catch (e) {
      return FunctionResponse(statusCode: 0, message: e.message);
    }
  }

  @override
  Future<double> getBalance() async {
    double balanceInBigInt = await _getBalanceBigInt();
    return balanceInBigInt;
  }

  Future<double> _getBalanceBigInt() async {
    double balance;
    if (asset.type == AssetType.token) {
      balance = await _getTokenBalance(asset.tokenId);
    } else {
      balance = await _getCoinBalance();
    }
    return balance;
  }

  Future<double> _getCoinBalance() async {
    try {
      final ethAddress = EthereumAddress.fromHex(_wallet.publicKey);
      final response = await _web3client.getBalance(ethAddress);
      return divide(response.getInWei, asset.decimal);
    } catch (error) {
      return 0;
    }
  }

  Future<double> _getTokenBalance(
    String tokenId,
  ) async {
    try {
      final contract =
          DeployedContract(_erc20Abi!, EthereumAddress.fromHex(tokenId));
      final ethAddress = EthereumAddress.fromHex(_wallet.publicKey);
      final response = await _web3client.call(
        contract: contract,
        function: contract.function('balanceOf'),
        params: <dynamic>[ethAddress],
      );
      return divide(response.first, asset.decimal);
    } catch (error) {
      return 0;
    }
  }

  Future<Transaction> _sendTokenTransaction(
      {required String tokenId,
      required String to,
      required BigInt amount}) async {
    try {
      final contract =
          DeployedContract(_erc20Abi!, EthereumAddress.fromHex(tokenId));
      final ethAddress = EthereumAddress.fromHex(to);
      final tokenTransfertransaction = Transaction.callContract(
        contract: contract,
        function: contract.function('transfer'),
        parameters: <dynamic>[ethAddress, amount],
      );

      return tokenTransfertransaction;
    } catch (error) {
      LogService.logger.e('_sendTokenTransaction ${error}');
      rethrow;
    }
  }

  Future<Transaction> _sendCoin({
    required String to,
    required BigInt amount,
  }) async {
    try {
      final fromAddress = EthereumAddress.fromHex(_wallet.publicKey);
      final toAddress = EthereumAddress.fromHex(to);
      final transaction = Transaction(
        from: fromAddress,
        to: toAddress,
        value: EtherAmount.inWei(amount),
      );
      return transaction;
    } catch (error) {
      LogService.logger.e('getGasPrice ${error}');
      rethrow;
    }
  }

  void dispose() {
    _web3client.dispose();
  }

  @override
  String toString() {
    return asset.tokenId + network.rpcUrl;
  }

  //helpers

  BigInt _convertToBigInt(double amount) {
    return BigInt.from(pow(10, asset.decimal) * amount);
  }

  @override
  CryptoAssetInformation getAsset() {
    return asset;
  }

  @override
  NetworkInformation getNetwork() {
    return network;
  }

  @override
  String getPublicKey() {
    return _wallet.publicKey;
  }

  @override
  bool validateAddress(String value) {
    return ValidateWalletAddress.validateEVM(value);
  }

  @override
  Future<double> getBalanceForExternalAddress(String address) async {
    if (asset.type == AssetType.token) {
      try {
        final contract = DeployedContract(
            _erc20Abi!, EthereumAddress.fromHex(asset.tokenId));
        final ethAddress = EthereumAddress.fromHex(address);
        final response = await _web3client.call(
          contract: contract,
          function: contract.function('balanceOf'),
          params: <dynamic>[ethAddress],
        );
        return divide(response.first, asset.decimal);
      } catch (error) {
        rethrow;
      }
    } else {
      try {
        final ethAddress = EthereumAddress.fromHex(_wallet.publicKey);
        final response = await _web3client.getBalance(ethAddress);
        return divide(response.getInWei, asset.decimal);
      } catch (error) {
        rethrow;
      }
    }
  }
}
