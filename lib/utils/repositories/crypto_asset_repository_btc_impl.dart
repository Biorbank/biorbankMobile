import 'dart:convert';
import 'dart:typed_data';

import 'package:biorbank/utils/constants/constants.dart';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bitcoin/flutter_bitcoin.dart';

class CryptoAssetRepositoryBtcImpl extends CryptoAssetRepositoryImpl {
  final CryptoAssetInformation asset;
  final NetworkInformation network;
  final WalletAddress _wallet;
  CryptoAssetRepositoryBtcImpl({
    required WalletAddress walletAddress,
    required this.asset,
    required this.network,
  })  : _wallet = walletAddress,
        super(state: const CryptoAssetRepositoryState());

  @override
  Future<void> initialize() async {
    updateBalance();
  }

  @override
  CryptoAssetInformation getAsset() {
    return asset;
  }

  @override
  Future<double> getBalance() async {
    try {
      var response = await Constants.commonApiCall(
          'https://blockchain.info/balance?active=${_wallet.publicKey}');
      if (response.statusCode == 200) {
        var result = response.data;
        return divide(BigInt.from(result[_wallet.publicKey]['final_balance']),
            asset.decimal);
      }
      return 0;
    } catch (error) {
      LogService.logger.e('getBalance ${error}');
    }
    return 0;
  }

  Future<String> getGasPrice() async {
    /*try {
      var response = await TppApiService.instance.dio
          .get("/api.blockcypher.com/v1/btc/main");

      if (response.statusCode == 200) {
        var result = response.data;
        //convert satoshi to btcf
        int balanceInBigInt = result['high_fee_per_kb'];

        balanceInBigInt = balanceInBigInt ~/ 1024;

        return balanceInBigInt.toString();
      }
    } catch (error) {
      LogService.logger.e('getGasPrice', error);
    }*/
    return "0";
  }

  @override
  NetworkInformation getNetwork() {
    return network;
  }

  Uint8List derEncodeSignature(Uint8List sig) {
    if (sig.length != 64) {
      throw ArgumentError('Invalid signature length');
    }

    var r = sig.sublist(0, 32);
    var s = sig.sublist(32, 64);

    // Ensure r and s are positive
    if (r[0] & 0x80 != 0) r = Uint8List.fromList([0x00, ...r]);
    if (s[0] & 0x80 != 0) s = Uint8List.fromList([0x00, ...s]);

    var sequence = [0x30];
    var totalLength =
        r.length + s.length + 4; // Two extra bytes for each of the lengths
    sequence.add(totalLength);
    sequence.add(0x02);
    sequence.add(r.length);
    sequence.addAll(r);
    sequence.add(0x02);
    sequence.add(s.length);
    sequence.addAll(s);

    return Uint8List.fromList(sequence);
  }

  @override
  Future<String> sendBalance(double amount, String toAddress) async {
    /*try {
      final keyPair =
          ECPair.fromPrivateKey(convertStringToUint8List(_wallet.privateKey));
      Map<String, dynamic> txSkelekton =
          await getTxSkelekton((_wallet.publicKey), toAddress, amount);
      List<dynamic> toSignA = txSkelekton['tosign'];
      List<String> signature = [];
      List<String> pubKeysA = [];
      for (var element in toSignA) {
        Uint8List signatureList =
            keyPair.sign(convertStringToUint8List(element));

        String signatureDER =
            convertUint8ListToString(derEncodeSignature(signatureList));
        // SIG Hash Type
        signature.add("${signatureDER}01");
        pubKeysA.add(convertUint8ListToString(keyPair.publicKey));
      }
      txSkelekton['signatures'] = signature;
      txSkelekton['pubkeys'] = pubKeysA;

      // Broadcasting new transaction
      var response = await TppApiService.instance.dio.post(
          "/api.blockcypher.com/v1/btc/main/txs/send",
          data: jsonEncode(txSkelekton));

      // Success
      if (response.statusCode == 201) {
        var result = response.data;
        return result['tx']['hash'];
      }
    } catch (error) {
      LogService.logger.e('sendBalance', error);
    }*/
    return "";
  }

  @override
  Future<FunctionResponse> sendBalanceEstimateGas(
      double amount, String toAddress) async {
    try {
      Map<String, dynamic> txSkelekton =
          await getTxSkelekton((_wallet.publicKey), toAddress, amount);
      if (txSkelekton.isNotEmpty) {
        // String fees = txSkelekton['tx']['fees'];
        return FunctionResponse(
            message: (safeConvertToDouble(txSkelekton['tx']['fees']) / 1e8)
                .toString(),
            statusCode: 1);
      }
    } catch (error) {
      LogService.logger.e('sendBalanceEstimateGas ${error}');
    }
    return FunctionResponse(message: "", statusCode: 0);
  }

  @override
  Future<double> updateBalance() async {
    double newBalance = await getBalance();
    if (isClosed == false) {
      emit(state.copyWith(
          balance: newBalance, assetState: CryptoAssetState.loaded));
    }
    return newBalance;
  }

  @override
  Future<String> updateGasPrice() async {
    String gasPrice = await getGasPrice();
    String result = "$gasPrice SAT";
    emit(state.copyWith(gasPrice: gasPrice));
    return result;
  }

  @override
  String getPublicKey() {
    return _wallet.publicKey;
  }

  @override
  bool validateAddress(String value) {
    return ValidateWalletAddress.validateBTC(value);
  }

  Future<Map<String, dynamic>> getTxSkelekton(
      String sender, String receiver, double amount) async {
    /*try {
      var response = await TppApiService.instance.dio
          .post("/api.blockcypher.com/v1/btc/main/txs/new",
              data: jsonEncode(<String, dynamic>{
                'inputs': [
                  {
                    "addresses": [sender]
                  }
                ],
                'outputs': [
                  {
                    "addresses": [receiver],
                    "value": (amount * 1e8).toInt()
                  }
                ]
              }));
      if (response.statusCode == 201) {
        var result = response.data;
        return result;
      }
    } catch (error) {
      LogService.logger.e('getTxSkelekton', error);
    }*/

    return {};
  }

  @override
  Future<double> getBalanceForExternalAddress(String address) async {
    /*try {
      var response = await TppApiService.instance.dio
          .get("/api.blockcypher.com/v1/btc/main/addrs/$address");

      if (response.statusCode == 200) {
        var result = response.data;
        //convert satoshi to btc
        return divide(BigInt.from(result['balance']), asset.decimal);
      }
      return 0;
    } catch (err) {
      rethrow;
    }*/
    return 0;
  }
}
