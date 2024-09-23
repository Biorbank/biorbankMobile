import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env') //Path of your secret.env file
abstract class Env {
  @EnviedField(varName: 'BANKSOCIAL_API_KEY', obfuscate: true)
  static final String banksocialApiKey = _Env.banksocialApiKey;

  @EnviedField(varName: 'ETHEREUM_RPC_URL', obfuscate: true)
  static final String ethereumRpcUrl = _Env.ethereumRpcUrl;

  @EnviedField(varName: 'SEPOLIA_RPC_URL', obfuscate: true)
  static final String sepoliaRpcUrl = _Env.sepoliaRpcUrl;

  @EnviedField(varName: 'POLYGON_RPC_URL', obfuscate: true)
  static final String polygonRpcUrl = _Env.polygonRpcUrl;

  @EnviedField(varName: 'BINANCE_RPC_URL', obfuscate: true)
  static final String binanceRpcUrl = _Env.binanceRpcUrl;

  @EnviedField(varName: 'HEDERA_RPC_URL', obfuscate: true)
  static final String hederaRpcUrl = _Env.hederaRpcUrl;

  @EnviedField(varName: 'SOLANA_RPC_URL', obfuscate: true)
  static final String solanaRpcUrl = _Env.solanaRpcUrl;

  @EnviedField(varName: 'WALLETCONNECT_PROJECTID', obfuscate: true)
  static final String walletConnectProjectId = _Env.walletConnectProjectId;

  @EnviedField(varName: 'COINMARKETCAP_API_KEY', obfuscate: true)
  static final String coinmarketcapAPIKEY = _Env.coinmarketcapAPIKEY;
}
