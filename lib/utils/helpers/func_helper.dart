import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:biorbank/utils/constants/constants.dart';
import 'package:biorbank/utils/helpers/helper_binance.dart';
import 'package:biorbank/utils/helpers/helper_bitcoin.dart';
import 'package:biorbank/utils/helpers/helper_ethereum.dart';
import 'package:biorbank/utils/helpers/helper_polygon.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:hex/hex.dart';

import 'package:flutter_bitcoin/flutter_bitcoin.dart';
import 'package:web3dart/web3dart.dart';

import 'package:convert/convert.dart';

String addCommas(String input) {
  List<String> list = input.split('.');
  String output = '';
  int count = 0;
  for (int i = list[0].length - 1; i >= 0; i--) {
    if (count == 3) {
      output = ',$output';
      count = 0;
    }
    output = list[0][i] + output;
    count++;
  }
  // Contains decimal
  if (list.length == 2) return '$output.${list[1]}';
  return output;
}

String convertToHideString(String address) {
  if (address.length < 6) return address;
  return "${address.substring(0, 5)}..${address.substring(address.length - 3, address.length)}";
}

bool compareContractAddress(String a, String b) {
  return a.toUpperCase() == b.toUpperCase();
}

String convertToUnit(double amount, String suffix) {
  // unit is K,M,B,T
  if (amount < 1) {
    return convertToDecimalTwo(amount, count: 8) + suffix;
  }
  if (amount < 1e3) return '${amount.toStringAsFixed(2)} $suffix';
  if (amount < 1e6) return '${(amount / 1e3).toStringAsFixed(2)}K $suffix';
  if (amount < 1e9) return '${(amount / 1e6).toStringAsFixed(2)}M $suffix';
  if (amount < 1e12) return '${(amount / 1e9).toStringAsFixed(2)}B $suffix';
  return '${(amount / 1e12).toStringAsFixed(2)}T $suffix';
}

String convertToDecimalTwo(double value, {int count = 6, int decimal = 2}) {
  if (value >= 1) return addCommas(value.toStringAsFixed(decimal));
  String str = value.toStringAsFixed(count);
  int indexofDot = str.indexOf('.');
  int i;
  for (i = indexofDot + 1; i < str.length; i++) {
    if (str[i] != '0') break;
  }
  if (i == str.length) return addCommas(value.toStringAsFixed(1));
  if (i + decimal < str.length) return addCommas(value.toStringAsFixed(i));
  return str;
}

Uint8List convertStringToUint8List(String str) {
  List<int> list = HEX.decode(str);
  Uint8List bytes = Uint8List.fromList(list);
  return bytes;
}

String convertUint8ListToString(Uint8List list) {
  return list.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
}

String serializeListToString(List<String> list) {
  List<String> encodedList =
      list.map((string) => base64Encode(utf8.encode(string))).toList();
  return encodedList.join(',');
}

List<String> deserializeStringToList(String str) {
  List<String> decodedList = str
      .split(',')
      .map((encodedString) => utf8.decode(base64Decode(encodedString)))
      .toList();
  return decodedList;
}

String getLastFourCharacters(String str) {
  if (str.length > 4) {
    return str.substring(str.length - 4);
  } else {
    // If the length of the string is less than or equal to 4,
    // just return the original string.
    return str;
  }
}

String getCardNumberInShortFormat(String str) {
  if (str.length > 8) {
    return '${str.substring(0, 4)}..${str.substring(str.length - 4)}';
  } else {
    // If the length of the string is less than or equal to 4,
    // just return the original string.
    return str;
  }
}

class ValidateWalletAddress {
  static bool validateBTC(String str) {
    return Address.validateAddress(str);
  }

  static bool validateEVM(String str) {
    try {
      EthereumAddress.fromHex(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool validateHedera(String str) {
    RegExp pattern = RegExp(r'^0\.0\.\d+$');
    if (pattern.hasMatch(str)) {
      return true;
    } else {
      return false;
    }
  }
}

double safeDoulbeParse(dynamic data) {
  if (data is int) return data.toDouble();
  if (data is double) return data;
  if (data is String) return double.parse(data);
  return 0.0;
}

String getUtf8Message(String maybeHex) {
  if (maybeHex.startsWith('0x')) {
    final List<int> decoded = hex.decode(
      maybeHex.substring(2),
    );
    return utf8.decode(decoded);
  }

  return maybeHex;
}

String signMessageWithPrivateKeyInEthereum(String message, String privateKey) {
  // Load the private key
  final Credentials credentials = EthPrivateKey.fromHex(privateKey);

  final String signature = hex.encode(
    credentials.signPersonalMessageToUint8List(
      Uint8List.fromList(
        utf8.encode(Constants.signMessageMigrateBSLBNBToHedera),
      ),
    ),
  );
  return "0x$signature";
}

// WC_CONNECTION_WIDGET
String getNameFromChainNumber(String number) {
  switch (number) {
    case "1":
      return "Ethereum";
    case "137":
      return "Polygon";
    case "56":
      return "Binance";
    default:
      return "Other";
  }
}

String getChainNameInShortFormat(String chainName) {
  List<String> fields = chainName.split(':');
  if (fields.length == 3 || fields.length == 2) {
    return getNameFromChainNumber(fields[1]);
  }
  return chainName;
}

String getTextInShortFormat(String text, {int length = 100}) {
  if (text.length < length) return text;
  return "${text.substring(0, length ~/ 2)}...${text.substring(text.length - length ~/ 2)}";
}

/*Future<List<Map<String, dynamic>>> getImportableTokenList(String search) async {
  try {
    var response = await HelperApiService.instance.dio
        .get("/getImportableTokens?searchString=$search");

    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data;
      List<dynamic> data = body['data'];
      List<Map<String, dynamic>> mapList =
          data.map((item) => item as Map<String, dynamic>).toList();
      var map;
      for (map in mapList) {
        map['id'] = map['id'].toString().toLowerCase();
      }
      return mapList;
    }
  } catch (err) {
    LogService.logger.e('Get Importable Token List', err);
  }
  return [];
}*/

double divide(BigInt a, int decimal) {
  BigInt b = BigInt.from(10).pow(decimal);
  return a / b;
}

double safeConvertToDouble(dynamic data) {
  if (data is int) return data.toDouble();
  if (data is double) return data;
  if (data is String) return double.parse(data);
  return 0.0;
}

String safeConvertToString(dynamic data) {
  return data.toString();
}

int safeConvertToInt(dynamic data) {
  try {
    if (data is int) return data;
    if (data is double) return data.toInt();
    if (data is String) return int.parse(data);
  } catch (error) {
    return 0;
  }
  return 0;
}

int convertPurchasedSymbolToCMCId(String symbol) {
  Map<String, int> assetList = {
    'BTC': 1,
    'ETH': 1027,
    'BSLETH': 10102,
    'BSLBNB': 10102,
    'HBAR': 4642,
    'RUSD': Constants.riviaTokenFakeCmcId,
  };
  if (assetList.containsKey(symbol)) return assetList[symbol]!;
  return 1;
}
/*
String convertCardTypeToString(CardType cardType) {
  switch (cardType) {
    case CardType.visa:
      return "VI";
    case CardType.americanExpress:
      return "AX";
    case CardType.discover:
      return "DC";
    case CardType.mastercard:
      return "MC";
    default:
      return "VI";
  }
} */

String convertStringToCardTypeString(String cardType) {
  switch (cardType) {
    case "VI":
      return "Visa";
    case "AX":
      return "American Express";
    case "DC":
      return "Discover";
    case "MC":
      return "MasterCard";
    default:
      return "Other";
  }
}
/*
Color convertPurchaseHistoryStatusToColor(String status) {
  switch (status) {
    case "FAILED":
      return ThemeConstants.errorColor;
    case "SUCCESS":
      return ThemeConstants.successColor;
    case "PENDING":
      return ThemeConstants.pendingColor;
    case "AUTHORIZED":
      return ThemeConstants.authorizedColor;
    case "CANCELED":
      return ThemeConstants.canceledColor;
    default:
      return Colors.black;
  }
}*/

Future<int> checkIfIsSafeTransaction(
    String address, NetworkInformation network) async {
  switch (network.name) {
    case "Ethereum":
      return (await EthereumHelper.getTransactionCountByAddress(address));
    case "Binance":
      return (await BscHelper.getTransactionCountByAddress(address));
    case "Bitcoin":
      return (await BitcoinHelper.getTransactionCountByAddress(address));
    case "Polygon":
      return (await PolygonHelper.getTransactionCountByAddress(address));
    default:
      return 0;
  }
}

bool checkIfIsInApprovedDefiList(String url) {
  if (Constants.approvedDefiSites.contains(url)) return true;
  return false;
}

String generateRandom32Bytes() {
  // Get shareCount String List by random
  Random random;
  try {
    //Generate random number in a secure way
    random = Random.secure();
  } catch (error) {
    // If random.secure doesn't work then use random instead
    random = Random(DateTime.now().millisecondsSinceEpoch);
  }
  var values = List<int>.generate(32, (index) => random.nextInt(256));
  var bytes = Uint8List.fromList(values);
  String hex = HEX.encode(bytes);
  return hex;
}
