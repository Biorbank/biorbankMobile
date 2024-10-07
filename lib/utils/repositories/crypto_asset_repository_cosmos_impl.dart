import 'dart:async';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/models/response_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';

import 'cosmos_provider/TendermintHTTPProvider.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:dart_bip32/dart_bip32.dart' as bip32;

class CryptoAssetRepositoryCosmoschainImpl extends CryptoAssetRepositoryImpl {
  final CryptoAssetInformation asset;
  final NetworkInformation network;
  final String denom;
  final double decimal;
  final WalletAddress _wallet;
  late CosmosSecp256K1PrivateKey _privateKey;
  late CosmosSecp256K1PublicKey _publicKey;
  late TendermintProvider _provider;
  static const String _pathForCosmosPrivateKey = "m/44'/118'/0'/0/0";
  static const String _pathForInjectivePrivateKey = "m/44'/60'/0'/0/0";
  static const String _pathForKujiraPrivateKey = "m/44'/118'/0'/0/0";



  CryptoAssetRepositoryCosmoschainImpl({
    required WalletAddress walletAddress,
    required this.asset,
    required this.network,
    required this.denom,
    required this.decimal,
  })  : _wallet = walletAddress,
        _provider = TendermintProvider(TendermintHTTPProvider(url: network.rpcUrl)),
        super(state: const CryptoAssetRepositoryState());

  @override
  Future<void> initialize() async {
    try {
      final seedBytes = bip39.mnemonicToSeed(_wallet.seedPhrase);
      final rootKey = bip32.BIP32.fromSeed(seedBytes);
      final derivedKey = rootKey.derivePath(getPrivateKeyPath(denom));
      final privateKeyBytes = derivedKey.privateKey;
      if (privateKeyBytes == null) {
        throw Exception('Derived private key is null');
      }
      final privateKey = CosmosSecp256K1PrivateKey.fromBytes(privateKeyBytes);
      final pubkey = privateKey.toPublicKey();
      _privateKey = CosmosSecp256K1PrivateKey.fromBytes(privateKeyBytes);
      _publicKey = CosmosSecp256K1PublicKey.fromBytes(derivedKey.publicKey);
      updateBalance();
    }
    catch(error) {
      LogService.logger.e('initialize $error');
    }
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
  Future<double> getBalance() async {
    try {
      final wallet = CosmosBaseAddress(_wallet.publicKey);
      final request = QueryBalanceRequest(address: wallet, denom: denom);
      final response = await _provider.request(TendermintRequestAbciQuery(request: request));

      return response.balance.amount.toDouble() / decimal;
    } catch (error) {
      LogService.logger.e('getBalance $error');
      return 0;
    }
  }

  @override
  Future<String> sendBalance(double amount, String toAddress) async {
    try {
      final message = MsgSend(
          fromAddress: _publicKey.toAddresss(hrp: asset.name.toLowerCase()),
          toAddress: CosmosBaseAddress(toAddress),
          amount: [Coin(denom: denom, amount: BigInt.from(amount * decimal))]);
      final accountInfo = await _provider.request(TendermintRequestAbciQuery(
          request: QueryAccountInfoRequest(_publicKey.toAddresss(hrp: asset.name.toLowerCase()))));
      final latestBlock = await _provider.request(TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
      final requiredFeeAmount = getGassFee(denom); // Replace this with actual required fee
      final authInfo = AuthInfo(
          signerInfos: [SignerInfo(
              publicKey: _publicKey,
              modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
              sequence: accountInfo.info.sequence)],
          fee: Fee(amount: [Coin(denom: denom, amount: BigInt.from(requiredFeeAmount))], gasLimit: BigInt.from(200000)));

      final txBody = TXBody(messages: [message]);
      final signDoc = SignDoc(
        bodyBytes: txBody.toBuffer(),
        authInfoBytes: authInfo.toBuffer(),
        chainId: latestBlock.block!.header.chainId,
        accountNumber: accountInfo.info.accountNumber,
      );

      final sign = _privateKey.sign(signDoc.toBuffer());
      final txRaw = TxRaw(bodyBytes: txBody.toBuffer(), authInfoBytes: authInfo.toBuffer(), signatures: [sign]);

      final result = await _provider.request(TendermintRequestBroadcastTxCommit(
          BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

      LogService.logger.i("Transaction successful with result: $result");
      return result.hash;
    } catch (error) {
      LogService.logger.e('sendBalance $error');
      return "";
    }
  }

  @override
  Future<FunctionResponse> sendBalanceEstimateGas(double amount, String toAddress) async {
    return FunctionResponse(message: "0.0001 ${asset.symbol}", statusCode: 1);
  }

  @override
  bool validateAddress(String value) {
    return ValidateWalletAddress.validateCosmos(value);
  }

  @override
  CryptoAssetInformation getAsset() {
    return asset;
  }

  @override
  Future<double> getBalanceForExternalAddress(String address) async {
    try {
      final fromAddress = CosmosBaseAddress(address);
      final request = QueryBalanceRequest(address: fromAddress, denom: denom);
      final response = await _provider.request(TendermintRequestAbciQuery(request: request));

      return response.balance.amount.toDouble() / decimal;
    } catch (error) {
      LogService.logger.e('getBalanceForExternalAddress $error');
      return 0;
    }
  }

  @override
  NetworkInformation getNetwork() {
    return network;
  }

  @override
  String getPublicKey() {
    return _publicKey.toHex;
  }

  @override
  Future<String> updateGasPrice() async {
    try {
      return "0.00025 ${asset.symbol}";
    } catch (e) {
      LogService.logger.e('updateGasPrice $e');
      return "";
    }
  }

  String getPrivateKeyPath(String option) {
    switch (option) {
      case 'inj':
        return _pathForInjectivePrivateKey;
      case 'uatom':
        return _pathForCosmosPrivateKey;
      case 'ukuji':
        return _pathForKujiraPrivateKey;
      default:
        return '';
    }
  }

  int getGassFee(String option) {
    switch (option) {
      case 'inj':
        return 32000000000000;
      case 'uatom':
        return 1000;
      case 'ukuji':
        return 1000;
      default:
        return 0;
    }
  }
}
