import 'dart:convert';
import 'dart:typed_data';

import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/helpers/exceptions/wallet_manager_exception.dart';
import 'package:biorbank/utils/helpers/toast_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/service/secure_storage_service.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:defichaindart/defichaindart.dart';
import 'package:flutter/material.dart';
import 'package:hex/hex.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/credentials.dart';
import 'package:bitcoin_base/bitcoin_base.dart';


const String _pathForEthPrivateKey = "m/44'/60'/0'/0/0";
const String _pathForBtcPrivateKey = "m/44'/0'/0'/0/0";
const String _pathForLtcPrivateKey = "m/84'/2'/0'/0/0";
const String _pathForHbarPrivateKey = "m/44'/3030'/0'/0/0";

final litecoin = NetworkType(
    messagePrefix: '\x19Litecoin Signed Message:\n',  // Litecoin-specific message prefix
    bech32: 'ltc',  // Bech32 prefix for Litecoin
    bip32: Bip32Type(
        public: 0x019da462,  // BIP32 public key prefix for Litecoin
        private: 0x019d9cfe  // BIP32 private key prefix for Litecoin
    ),
    pubKeyHash: 0x30,  // Addresses start with 'L' (legacy P2PKH)
    scriptHash: 0x32,  // Addresses start with 'M' (P2SH)
    wif: 0xb0  // WIF private key prefix
);
Future<BiorBankWallet> generateLegacyWallet(Map argu) async {
  String privateKey = argu['privateKey'];
  WalletAddress ethwallet = await _generateEthWalletWithPrivateKey(privateKey);
  AppHelper.command = AppCommand.createWallet;
  String id = const Uuid().v1();
  return BiorBankWallet(
      id: id,
      name: argu['wallet_name'],
      ethwallet: ethwallet,
      walletType: WalletType.legacyWallet);
}

Future<BiorBankWallet> generateNewWallet(Map argu) async {
  try {
    String seedPhrase = argu['seed_phrase'];
    WalletAddress btcwallet = await _generateBtcWallet(seedPhrase);
    WalletAddress ltcwallet = await _generateLtcWallet(seedPhrase);
    WalletAddress ethwallet = await _generateEthWallet(seedPhrase);
    AppHelper.command = AppCommand.createWallet;
    String id = const Uuid().v1();
    return BiorBankWallet(
        id: id,
        name: argu['wallet_name'],
        btcwallet: btcwallet,
        ltcwallet: ltcwallet,
        ethwallet: ethwallet,
        seedPhrase: seedPhrase);
  } catch (error) {
    rethrow;
  }
}
/*
Future<WalletAddress> _generateHederaWallet(String seedPhrase) async {
  final Chain chain = _getChainByMnemonic(seedPhrase);
  ExtendedKey extendedKey = chain.forPath(_pathForHbarPrivateKey);
  String privateKey = extendedKey.privateKeyHex().substring(2);
  String privateKeyInString = "3030020100300706052b8104000a04220420$privateKey";
  var ec = getSecp256k1();
  PublicKey pubKey = PrivateKey.fromHex(ec, privateKey).publicKey;
  String publicKey = pubKey.toHex().substring(2);
  PrivateKey privKey = PrivateKey.fromHex(ec, privateKey);

  String compressedPublicKey =
      ((int.parse(publicKey[publicKey.length - 1], radix: 16) % 2 == 0)
              ? "02"
              : "03") +
          publicKey.substring(0, 64);
  try {
    var response = await HelperApiService.instance.dio.post(
        '/createAccountWithPublicKey',
        data: json.encode(
            <String, dynamic>{'publicKeyInString': compressedPublicKey}));
    if (response.statusCode == 200) {
      var result = response.data;
      WalletAddress newWallet = WalletAddress(
          seedPhrase: seedPhrase,
          addressType: WalletAddressType.hedera,
          privateKey: privateKey,
          accountId: result['newAccountId'],
          publicKey: compressedPublicKey);
      // TODO should we associate token with the account here?
      // if (result['isNew'] == "true" ||
      //     (await HederaHelper.isTokenAssociatedWithAccount(
      //             Constants.riviaTokenId, result['newAccountId'])) ==
      //         false) {
      //   await HederaHelper.associateTokenWithTheAccount(
      //       newWallet, Constants.riviaTokenId);
      // }
      // if (result['isNew'] == "true" ||
      //     (await HederaHelper.isTokenAssociatedWithAccount(
      //             Constants.bslHtsTokenId, result['newAccountId'])) ==
      //         false) {
      //   await HederaHelper.associateTokenWithTheAccount(
      //       newWallet, Constants.bslHtsTokenId);
      // }

      return newWallet;
    }
  } catch (error) {
    // LogService.logger.e('Creating Hedera Account', error);
    // rethrow;
  }
  throw WalletCreateHederaAccountCreationFailedException(
      "Failed to create Hedera Account");
}
*/

Future<WalletAddress> _generateBtcWallet(String seedPhrase) async {
  final Chain chain = _getChainByMnemonic(seedPhrase);
  ExtendedKey extendedKey = chain.forPath(_pathForBtcPrivateKey);

  //removing first 2 zeros from the private string
  String privateKey = extendedKey.privateKeyHex().substring(2);
  List<int> list = HEX.decode(privateKey);
  Uint8List bytes = Uint8List.fromList(list);

  final keyPair = ECPair.fromPrivateKey(bytes);
  final String address =
      P2WPKH(data: PaymentData(pubkey: keyPair.publicKey)).data!.address ?? "";
  // return [privateKey, address];
  return WalletAddress(
      privateKey: privateKey,
      publicKey: address,
      addressType: WalletAddressType.bitcoin,
      seedPhrase: seedPhrase);
}


Future<WalletAddress> _generateLtcWallet(String seedPhrase) async {
  final Chain chain = _getChainByMnemonic(seedPhrase);
  ExtendedKey extendedKey = chain.forPath(_pathForLtcPrivateKey);

  String privateKey = extendedKey.privateKeyHex().substring(2);
  List<int> list = HEX.decode(privateKey);
  Uint8List bytes = Uint8List.fromList(list);

  final keyPair = ECPair.fromPrivateKey(bytes, network: litecoin);
  final String address = P2WPKH(
    data: PaymentData(pubkey: keyPair.publicKey),
    network: litecoin,
  ).data!.address ?? "";

  return WalletAddress(
      privateKey: privateKey,
      publicKey: address,
      addressType: WalletAddressType.litecoin,
      seedPhrase: seedPhrase);
}


Future<WalletAddress> _generateEthWallet(String seedPhrase) async {
  final Chain chain = _getChainByMnemonic(seedPhrase);
  ExtendedKey extendedKey = chain.forPath(_pathForEthPrivateKey);
  String privateKey = extendedKey.privateKeyHex().substring(2);
  Credentials credentials = EthPrivateKey.fromHex(extendedKey.privateKeyHex());

  EthereumAddress address = credentials.address;
  return WalletAddress(
      privateKey: privateKey,
      publicKey: address.toString(),
      addressType: WalletAddressType.ethereum,
      seedPhrase: seedPhrase);
}

Future<WalletAddress> _generateEthWalletWithPrivateKey(
    String privateKey) async {
  Credentials credentials = EthPrivateKey.fromHex(privateKey);

  EthereumAddress address = credentials.address;
  return WalletAddress(
      privateKey: privateKey,
      publicKey: address.toString(),
      addressType: WalletAddressType.ethereum,
      seedPhrase: "");
}

Chain _getChainByMnemonic(String mnemonic) {
  final String seed = bip39.mnemonicToSeedHex(mnemonic);

  return Chain.seed(seed);
}

class WalletStoreService {
  // This prefix can be used for migration
  // For version 2.1, if the db structure of wallet is changed it will become walletBox_2.1
  // TODO change in the future
  final PrefixSecureStorageManager _prefs =
      PrefixSecureStorageManager('walletBox_v2');
  List<BiorBankWallet> wallets = [];
  late ValueNotifier<int> index = ValueNotifier(-1);
  late bool migratedFromOldWallet;
  WalletStoreService._() {
    index.addListener(_onWalletChanged);
  }
  static Future<WalletStoreService> create() async {
    WalletStoreService service = WalletStoreService._();
    await service.init();
    return service;
  }

  void _onWalletChanged() {
    if (!(index.value >= 0)) {
      //do nothing if there is no wallet
      return;
    }
    //When the app starts, it will trigger _onWalletChanged but there is no instance of Web3WalletService, it will fail to remove pairing.
    // TODO change in the future
    try {
      // Web3WalletService.registerWalletConnectService();
    } catch (error) {
      // LogService.logger.e('Wallet Change Event', error);
    }
  }

  Future<void> init() async {
    int count = (await _prefs.getInt("walletCount"));
    migratedFromOldWallet =
        (await _prefs.getBool('migratedFromOldWallet')) ?? false;

    // Loads current wallet index
    if (count <= 0) {
      // index = ValueNotifier(-1);
      return;
    } else {
      index.value = (await _prefs.getInt("walletIndex"));
    }
    //loads existing wallets from device
    List<String> existingWalletsInString =
        (await _prefs.getStringList("wallets"));

    wallets =
        existingWalletsInString.map((e) => BiorBankWallet.fromJson(e)).toList();
  }

  Future<void> setIsMigrated() async {
    await _prefs.setBool("migratedFromOldWallet", true);
  }

  Future<bool> _isAlreadyExist(BiorBankWallet newWallet) async {
    return wallets.indexWhere(
            (element) => element.seedPhrase == newWallet.seedPhrase) >=
        0;
  }

  Future<void> storeWallet(BiorBankWallet newWallet) async {
    // if ((await _isAlreadyExist(newWallet)) == true) {
    //   throw WalletCreateAlreadyExistException("Wallet already exists");
    // }
    List<BiorBankWallet> newWallets = List.from(wallets)..add(newWallet);
    List<String> newWalletsInString =
        newWallets.map((e) => json.encode(e.toJson())).toList();
    await _prefs.setStringList("wallets", newWalletsInString);
    await _prefs.setInt("walletCount", newWallets.length);
    await _prefs.setInt("walletIndex", newWallets.length - 1);
    wallets = newWallets;
    index.value = wallets.length - 1;
  }

  Future<void> removeWallet(int Index) async {
    wallets.removeAt(Index);
    List<String> newWalletsInString =
        wallets.map((e) => json.encode(e.toJson())).toList();
    await _prefs.setStringList("wallets", newWalletsInString);
    await _prefs.setInt("walletCount", wallets.length);
    if (Index == index.value) {
      if (wallets.isNotEmpty) {
        index.value = 0;
        await changeWallet(0);
      } else {
        index.value = -1;
        await _prefs.setInt("walletIndex", index.value);
      }
    } else if (Index < index.value) {
      index.value = index.value - 1;
    } else {
      // Do nothing
    }
  }

  bool walletNameAlreadyExists(String name) {
    return wallets.where((element) => element.getName() == name).isEmpty;
  }

  bool validateName(String name) {
    // name should only contains alphabets, numbers and underscore
    return RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(name);
  }

  Future<bool> updateWallet(int index, String newName) async {
    if (!walletNameAlreadyExists(newName)) {
      errorToast('Wallet Name Already Exists');
      return false;
    }
    if (!validateName(newName)) {
      errorToast('Wallet Name Invalid');
      return false;
    }
    wallets.elementAt(index).changeName(newName);

    List<String> newWalletsInString =
        wallets.map((e) => json.encode(e.toJson())).toList();
    await _prefs.setStringList("wallets", newWalletsInString);
    return true;
  }

  String currentWalletName() {
    return wallets.elementAt(index.value).name;
  }

  static String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  Future<bool> changeWallet(int newIndex) async {
    if (newIndex < 0 || newIndex >= wallets.length) {
      throw Exception("Invalid wallet index");
    }
    index.value = newIndex;

    await _prefs.setInt("walletIndex", index.value);
    return true;
  }

  // This is used when users creates a new wallet
  String get availableWalletName {
    int index = 0;
    for (var element in wallets) {
      try {
        if (element.name.startsWith("Wallet ")) {
          int walletIndex = int.parse(element.name.substring(7));
          if (walletIndex >= index) index = walletIndex;
        }
        // ignore: empty_catches
      } catch (e) {}
    }
    return "Wallet ${index + 1}";
  }

  int get currentIndex => index.value;
  int get walletCount => wallets.length;
  BiorBankWallet get currentWallet => wallets.elementAt(currentIndex);

  bool get isWalletExist => wallets.isNotEmpty;
}
