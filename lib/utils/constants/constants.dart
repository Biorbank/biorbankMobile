import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@immutable
class Constants {
  // DeRec Payment Product Id
  // static String deRecEssentialMonthly = "A1003";
  // static String deRecEssentialYearly = "A1004";
  // static String deRecFounderMonthly = "1001";
  // static String deRecFounderYearly = "3002";

  static String androidSecuraFoundersProductId = "1001";
  static String appleSecuraFoundersProductIdMonthly = "3001";
  static String appleSecuraFoundersProductIdYearly = "3002";
  //Purchase Crypto

  static List<String> purchaseAssetName = [
    'BTC',
    'ETH',
    'BSLETH',
    'BSLBNB',
    'HBAR',
    'RUSD',
  ];
  static List<int> purchaseAssetImage = [
    1,
    1027,
    10102,
    10102,
    4642,
    riviaTokenFakeCmcId
  ];
  // Other Messages
  static const String hbarStakingInsufficientBalanceMessage =
      "Purchase HBAR to Stake";
  // Migration Sign Message
  static const signMessageMigrateBSLBNBToHedera =
      "I approve the 1:1 BSL token migration from the Binance network to the Hedera network";
  // Auth Workflow

  static const authenticatedSuccessMessage = "Logged In Successfully";
  // Hedera Token Settings
  static const riviaTokenFakeCmcId = 1320271;
  static const riviaTokenId = "0.0.1320271";
  static const bslHtsTokenFakeCmcId = 3926636;
  static const bslHtsTokenId = "0.0.3926636";
  // Application Settings
  static const isDeRecEnabled = false;
  static const isDebugMode = false;

  //Session timeout value
  static const sessionTimeoutForAppLostFocus = Duration(seconds: 120);
  static const sessionTimeoutForUserInactivity = Duration(seconds: 300);
  //Blockchain RPC URLs
  static const String binanceApiUrl = "https://api.bscscan.com";
  static const String ethereumApiUrl = "https://api.etherscan.io";
  static const String polygonApiUrl = "https://api.polygonscan.com";
  static const String hederaApiUrl =
      "https://mainnet-public.mirrornode.hedera.com";
  static const String bitcoinApiUrl = "https://api.blockcypher.com";

  static const List<String> approvedDefiSites = [
    'https://www.saucerswap.finance',
    'https://exchange.banksocial.io',
    'https://vote.banksocial.io',
    'https://uniswap.org',
    'https://app.uniswap.org',
    'https://www.saucerswap.finance',
    'https://pancakeswap.finance',
  ];
  static Future<Response> commonApiCall(url) async {
    try {
      Dio dio = Dio();

      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      final response = await dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
