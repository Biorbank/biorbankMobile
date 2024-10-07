import 'dart:async';
import 'dart:convert';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:http/http.dart' as http;

import 'crypto_db_repository/crypto_db_repository_impl.dart';

class CryptoAssetRepositoryInjectiveImpl extends CryptoAssetRepositoryImpl {
  final CryptoAssetInformation asset;
  final NetworkInformation network;
  final WalletAddress _wallet;
  final String injectiveDenom = 'inj'; // INJ token denom
  final String chainId = 'injective-888'; // Adjust chain ID for testnet/mainnet

  CryptoAssetRepositoryInjectiveImpl({
    required WalletAddress walletAddress,
    required this.asset,
    required this.network,
  })  : _wallet = walletAddress,
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
    const String gasPrice = "0.000005 INJ"; // Adjust as per Injective network fees
    try {
      emit(state.copyWith(gasPrice: gasPrice));
    } catch (e) {
      LogService.logger.e('update gas price ${e}');
    }
    return gasPrice;
  }

  @override
  Future<void> initialize() async {
    // Initialization logic for Injective if needed
    updateBalance();
  }

  @override
  Future<String> sendBalance(double amount, String toAddress) async {
    try {
      final BigInt amountInMicro = BigInt.from(amount * 1e6); // Convert to micro INJ

      // Create the MsgSend protobuf message
      final msgSend = {
        "@type": "/cosmos.bank.v1beta1.MsgSend", // As per bank.proto
        "from_address": _wallet.publicKey,
        "to_address": toAddress,
        "amount": [
          {
            "denom": injectiveDenom,
            "amount": amountInMicro.toString(), // INJ amount in micro
          }
        ],
      };

      // Construct the transaction body
      final txBody = {
        "body": {
          "messages": [msgSend],
          "memo": "", // Memo can be left empty
          "timeout_height": "0", // Typically set to 0
        },
        "auth_info": {
          "signer_infos": [], // Signer info to be filled after fetching account data
          "fee": {
            "amount": [
              {
                "denom": injectiveDenom,
                "amount": "5000", // Transaction fee in micro INJ
              }
            ],
            "gas_limit": "200000",
          },
        },
        "signatures": [], // This will be filled once signed
      };

      // First, fetch the account info to get sequence number and account number
      final accountInfoResponse = await http.get(
          Uri.parse('https://testnet.sentry.lcd.injective.network/cosmos/auth/v1beta1/accounts/${_wallet.publicKey}')
      );

      if (accountInfoResponse.statusCode == 200) {
        final response = await http.post(
          Uri.parse('https://testnet.sentry.lcd.injective.network/cosmos/tx/v1beta1/txs'), // The correct LCD endpoint
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            "tx_bytes": txBody, // The transaction body that needs to be signed
            "mode": "BROADCAST_MODE_SYNC" // Broadcasting mode: sync or async
          }),
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // The response should contain a `txhash` field for the transaction hash
          return responseData['txhash'] ?? "";
        } else {
          // Log error if response is not 200
          LogService.logger.e('sendBalance Error: ${response.body}');
          return "";
        }
      } else {
        LogService.logger.e('Account Info Error: ${accountInfoResponse.body}');
        return "";
      }
    } catch (error) {
      // Log any error that occurs during the process
      LogService.logger.e('sendBalance $error');
      return "";
    }
  }



  @override
  Future<FunctionResponse> sendBalanceEstimateGas(double amount, String toAddress) async {
    // Injective has low, fixed fees. We can return a standard estimate.
    return FunctionResponse(message: "0.000005 INJ", statusCode: 1);
  }

  @override
  Future<double> getBalance() async {
    try {
      final response = await http.get(
        Uri.parse('https://testnet.sentry.lcd.injective.network/cosmos/bank/v1beta1/balances/${_wallet.publicKey}'),
      );

      if (response.statusCode == 200) {
        final balanceData = json.decode(response.body);
        final balance = balanceData['balances']
            .firstWhere((coin) => coin['denom'] == 'inj', orElse: () => {"amount": "0"});
        return double.parse(balance['amount']) / 1e18; // Convert to correct INJ denomination
      } else {
        LogService.logger.e('getBalance Error: ${response.body}');
        return 0;
      }
    } catch (error) {
      LogService.logger.e('getBalance $error');
      return 0;
    }
  }

  @override
  Future<double> getBalanceForExternalAddress(String address) async {
    try {
      final response = await http.get(
        Uri.parse('https://sentry.tm.injective.network:443/bank/balances/$address'),
      );

      if (response.statusCode == 200) {
        final balanceData = json.decode(response.body);
        final balance = balanceData['result']
            .firstWhere((coin) => coin['denom'] == injectiveDenom, orElse: () => {"amount": "0"});
        return double.parse(balance['amount']) / 1e6; // Convert micro INJ to INJ
      } else {
        LogService.logger.e('getBalanceForExternalAddress Error: ${response.body}');
        return 0;
      }
    } catch (error) {
      LogService.logger.e('getBalanceForExternalAddress $error');
      return 0;
    }
  }

  void dispose() {
    // Cleanup logic if necessary
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
    return ValidateWalletAddress.validateBech32(value);
  }
}
