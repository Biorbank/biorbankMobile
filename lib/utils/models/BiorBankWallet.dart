import 'dart:convert';

enum WalletAddressType {
  bitcoin,
  ethereum,
  litecoin,
  hedera,
}

enum WalletType {
  multiChainWallet,
  legacyWallet,
}

class BiorBankWallet {
  final WalletAddress? btcwallet;
  final WalletAddress? ltcwallet;
  final WalletAddress ethwallet;
  final String seedPhrase; // we use the same seedPhrase for 3 wallets.
  //id is unquite identifier for the wallet , created once and never changes
  //name can be changed
  String name = "";
  WalletType walletType;
  final String id;
  BiorBankWallet(
      {
        this.btcwallet,
        this.ltcwallet,
        required this.ethwallet,
        this.seedPhrase = "",
        required this.id,
        required this.name,
        this.walletType = WalletType.multiChainWallet
      });
  Map<String, dynamic> toJson() => walletType == WalletType.multiChainWallet
      ? {
          'id': id,
          'btcwallet': btcwallet!.toJson(),
          'ltcwallet': ltcwallet!.toJson(),
          'ethwallet': ethwallet.toJson(),
          'seedPhrase': seedPhrase,
          'name': name,
          'type': walletType.index,
        }
      : {
          'id': id,
          'ethwallet': ethwallet.toJson(),
          'name': name,
          'type': walletType.index,
        };
  static BiorBankWallet fromJson(String str) {
    Map<String, dynamic> wallet = json.decode(str);

    return wallet['type'] == 0
        ? BiorBankWallet(
            id: wallet['id'],
            name: wallet['name'],
            btcwallet: WalletAddress.fromJson(wallet['btcwallet']),
            ltcwallet: WalletAddress.fromJson(wallet['ltcwallet']),
            ethwallet: WalletAddress.fromJson(wallet['ethwallet']),
            seedPhrase: wallet['seedPhrase'],
            walletType: WalletType.multiChainWallet)
        : BiorBankWallet(
            id: wallet['id'],
            name: wallet['name'],
            ethwallet: WalletAddress.fromJson(wallet['ethwallet']),
            walletType: WalletType.legacyWallet);
  }

  String getName() {
    return name;
  }

  String changeName(String newName) {
    name = newName;
    return name;
  }

  bool get isLegacyWallet {
    return walletType == WalletType.legacyWallet;
  }

  //TODO should be removed
  String getWalletAddressByAsset(String asset) {
    try {
      switch (asset) {
        case "BTC":
          return btcwallet!.publicKey;
        case "LTC":
          return ltcwallet!.publicKey;
        case "ETH":
          return ethwallet.publicKey;
        case "BSLETH":
          return ethwallet.publicKey;
        case "BSLBNB":
          return ethwallet.publicKey;
      }
    } catch (error) {}
    return "";
  }
}

class WalletAddress {
  const WalletAddress(
      {this.privateKey = "",
      this.publicKey = "",
      this.accountId = "",
      this.seedPhrase = "",
      this.addressType = WalletAddressType.bitcoin});

  final String privateKey;
  final String publicKey;
  //only used in hedera wallets
  final String accountId;
  final String seedPhrase;
  final WalletAddressType addressType;
  Map<String, dynamic> toJson() => {
        'privateKey': privateKey,
        'publicKey': publicKey,
        'seedPhrase': seedPhrase,
        'accountId': accountId,
        'addressType': addressType.index,
      };
  static WalletAddress fromJson(Map<String, dynamic> wallet) {
    return WalletAddress(
      privateKey: wallet['privateKey'],
      publicKey: wallet['publicKey'],
      seedPhrase: wallet['seedPhrase'],
      accountId: wallet['accountId'],
      addressType: WalletAddressType.values[wallet['addressType']],
    );
  }

  String get receiveAddress =>
      (addressType == WalletAddressType.hedera ? accountId : publicKey);

  String getSeedPhrase() {
    return seedPhrase;
  }
}
