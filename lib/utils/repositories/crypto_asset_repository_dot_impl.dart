import 'dart:async';
import 'dart:typed_data';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:polkadart/polkadart.dart';
import 'package:polkadart/apis/apis.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';
import 'dart:convert'; // For utf8 encoding
import 'package:convert/convert.dart';
import 'package:polkawallet_sdk/polkawallet_sdk.dart';

import 'crypto_db_repository/crypto_db_repository_impl.dart';

class CryptoAssetRepositoryPolkadotImpl extends CryptoAssetRepositoryImpl {
  final CryptoAssetInformation asset;
  final NetworkInformation network;
  final WalletAddress _wallet;
  late Provider _provider;
  late StateApi _stateApi;
  late AuthorApi _authorApi;
  late ChainApi _chainApi;
  late SystemApi _systemApi;
  late KeyPair _keyPair;

  CryptoAssetRepositoryPolkadotImpl({
    required WalletAddress walletAddress,
    required this.asset,
    required this.network,
  })  : _wallet = walletAddress,
        _provider = Provider.fromUri(Uri.parse(network.rpcUrl)), // Use the correct RPC URL
        super(state: const CryptoAssetRepositoryState()) {
    _stateApi = StateApi(_provider);
    _authorApi = AuthorApi(_provider);
    _chainApi = ChainApi(_provider);
    _systemApi = SystemApi(_provider);

  }

  @override
  Future<void> initialize() async {
    final keyring = Keyring();
    _keyPair = await keyring.fromMnemonic(_wallet.seedPhrase);
    await updateBalance();
  }

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
    try {
      final gasPrice = "0.0000000001 DOT";
      emit(state.copyWith(gasPrice: gasPrice));
      return gasPrice;
    } catch (e) {
      LogService.logger.e('update gas price ${e}');
      return "0.0000000001 DOT";
    }
  }

  @override
  Future<String> sendBalance(double amount, String toAddress) async {
    try {
      // final BigInt transferAmount = BigInt.from(amount * 1e12); // Convert to base units (planck)
      //
      // // Create the transaction to transfer balance
      // final transaction = Tx.transfer(
      //   destination: toAddress,
      //   value: transferAmount,
      // );
      //
      // // Encode the transaction to Uint8List
      // final extrinsic = Uint8List.fromList(transaction.toBytes());
      //
      // // Submit the extrinsic and watch the transaction
      // final submit = await _authorApi.submitAndWatchExtrinsic(
      //   extrinsic,
      //       (data) => LogService.logger.i('Transaction status: ${data.type} - ${data.value}'),
      // );
      //
      // LogService.logger.i("Transaction successful with hash: $submit");
      // return submit;
      return "";
    } catch (error) {
      LogService.logger.e('sendBalance $error');
      return "";
    }
  }

  @override
  Future<FunctionResponse> sendBalanceEstimateGas(double amount, String toAddress) async {
    // Polkadot's transaction fees are minimal for transfers, and there are no gas estimations in the usual sense
    return FunctionResponse(message: "0.0000000001 DOT", statusCode: 1);
  }

  @override
  Future<double> getBalance() async {
    // try {
    //   // Create a StorageKey using the public key for the wallet
    //   final storageKey = StorageKey.from([
    //     'System',
    //     'Account',
    //     hex.encode(addressToBytes(address)) // Convert address to bytes
    //   ]);    final latestBlockHash = _chainApi.getBlockHash();
    //   _stateApi.call("method", bytes)
    //
    //   // Get the latest block hash using rpcCall with empty bytes
    //
    //   // Query the storage for the balance
    //   final changeSets = await _stateApi.queryStorage(
    //     [storageKey], // Pass the list of storage keys
    //     latestBlockHash,
    //   );
    //
    //   // Access the free balance; adjust according to the actual structure of changeSets
    //   final balanceData = changeSets[0].data; // Assuming the first change set contains your account
    //   final freeBalance = balanceData['free'] as BigInt; // Adjust according to your data structure
    //   return freeBalance.toDouble() / 1e12; // Convert from planck to DOT
    // } catch (error) {
    //   LogService.logger.e('getBalance $error');
    //   return 0;
    // }
    return 0;
  }


  @override
  Future<double> getBalanceForExternalAddress(String address) async {
    // try {
    //   // Create a StorageKey for the external address
    //   final storageKey = StorageKey('System', 'Account', address);
    //
    //   // Get the latest block hash
    //   final latestBlockHash = await _stateApi.r(); // Assuming you have this method
    //
    //   // Query the storage for the balance of the external address
    //   final changeSets = await _stateApi.queryStorage(
    //     [storageKey], // Pass the list of storage keys
    //     latestBlockHash,
    //   );
    //
    //   // Access the free balance; adjust according to the actual structure of changeSets
    //   final balanceData = changeSets[0].data; // Assuming the first change set contains your account
    //   final freeBalance = balanceData['free'] as BigInt; // Adjust according to your data structure
    //   return freeBalance.toDouble() / 1e12; // Convert from planck to DOT
    // } catch (error) {
    //   LogService.logger.e('getBalanceForExternalAddress $error');
    //   return 0;
    // }
    return 0;
  }

  @override
  String getPublicKey() {
    return _wallet.publicKey;
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
  bool validateAddress(String value) {
    return ValidateWalletAddress.validatePolkadot(value);
  }

  @override
  void dispose() {
    // Dispose resources if necessary
  }

  @override
  String toString() {
    return asset.tokenId + network.rpcUrl;
  }
}
