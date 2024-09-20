import 'dart:async';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:http/http.dart' as http;
import 'package:solana/solana.dart';


import 'crypto_db_repository/crypto_db_repository_impl.dart';

class CryptoAssetRepositorySolanaImpl extends CryptoAssetRepositoryImpl {
  final CryptoAssetInformation asset;
  final NetworkInformation network;
  final WalletAddress _wallet;
  late RpcClient _rpcClient;
  late Ed25519HDKeyPair _keyPair;


  CryptoAssetRepositorySolanaImpl({
    required WalletAddress walletAddress,
    required this.asset,
    required this.network,
  })  : _wallet = walletAddress,
        _rpcClient = RpcClient('https://api.devnet.solana.com'),
        super(state: const CryptoAssetRepositoryState());


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
      emit(state.copyWith(gasPrice: "0.000005 SOL"));
    } catch (e) {
      LogService.logger.e('update gas price ${e}');
    }
    return "0.000005 SOL";
  }

  @override
  Future<void> initialize() async {
    _keyPair = await Ed25519HDKeyPair.fromMnemonic(_wallet.seedPhrase);
    updateBalance();
  }

  @override
  Future<String> sendBalance(double amount, String toAddress) async {
    try {
      final int lamports = (amount * 1e9).toInt();

      // Convert the sender and recipient addresses to the appropriate public key type
      final fundingAccount = Ed25519HDPublicKey.fromBase58(_wallet.publicKey);
      final recipientAccount = Ed25519HDPublicKey.fromBase58(toAddress);

      // Create the transfer instruction
      final instruction = SystemInstruction.transfer(
        fundingAccount: fundingAccount,
        recipientAccount: recipientAccount,
        lamports: lamports,
      );

      // Create a transaction message
      final message = Message(instructions: [instruction]);

      // Send the transaction using the wallet's key pair for signing
      final signature = await _rpcClient.signAndSendTransaction(
        message,
        [await _keyPair],
      );

      LogService.logger.i("Transaction successful with signature: $signature");
      return signature;
    } catch (error) {
      LogService.logger.e('sendBalance $error');
      return "";
    }
  }


  @override
  Future<FunctionResponse> sendBalanceEstimateGas(
      double amount, String toAddress) async {
    // Solana transaction fees are very low and fixed, so there's no gas estimation in Solana.
    return FunctionResponse(message: "0.000005 SOL", statusCode: 1);
  }

  @override
  Future<double> getBalance() async {
    try {
      final balance = await _rpcClient.getBalance(_wallet.publicKey);
      return balance.value / 1e9; // Convert from lamports to SOL
    } catch (error) {
      LogService.logger.e('getBalance $error');
      return 0;
    }
  }


  @override
  Future<double> getBalanceForExternalAddress(String address) async {
    try {
      final balance = await _rpcClient.getBalance(address);
      return balance.value / 1e9; // Convert from lamports to SOL
    } catch (error) {
      LogService.logger.e('getBalanceForExternalAddress $error');
      return 0;
    }
  }

  void dispose() {
  }

  @override
  String toString() {
    return asset.tokenId + network.rpcUrl;
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
    return ValidateWalletAddress.validateSolana(value);
  }
}
