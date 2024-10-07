import 'dart:convert';

enum WalletAddressType {
  bitcoin,
  ethereum,
  litecoin,
  solana,
  injective,
  kujira,
  cosmos,
  polkadot,
  thorchain,
  hedera,
}

enum WalletType {
  multiChainWallet,
  legacyWallet,
}

class BiorBankWallet {
  final WalletAddress? btcwallet;
  final WalletAddress? ltcwallet;
  final WalletAddress? solanawallet;
  final WalletAddress? injectivewallet;
  final WalletAddress? kujirawallet;
  final WalletAddress? cosmoswallet;
  final WalletAddress? polkadotwallet;
  final WalletAddress? thorchainwallet;
  final WalletAddress ethwallet;
  final String seedPhrase; // we use the same seedPhrase for 3 wallets.
  //id is unquite identifier for the wallet , created once and never changes
  //name can be changed
  String name = "";
  WalletType walletType;
  final String id;
  double totalAmount;
  BiorBankWallet(
      {
        this.btcwallet,
        this.ltcwallet,
        this.solanawallet,
        this.injectivewallet,
        this.kujirawallet,
        this.cosmoswallet,
        this.polkadotwallet,
        this.thorchainwallet,
        required this.ethwallet,
        this.seedPhrase = "",
        required this.id,
        required this.name,
        this.totalAmount = 0.0,
        this.walletType = WalletType.multiChainWallet
      });
  Map<String, dynamic> toJson() => walletType == WalletType.multiChainWallet
      ? {
          'id': id,
          'btcwallet': btcwallet!.toJson(),
          'ltcwallet': ltcwallet!.toJson(),
          'solanawallet': solanawallet!.toJson(),
          'injectivewallet': injectivewallet!.toJson(),
          'kujirawallet': kujirawallet!.toJson(),
          'cosmoswallet': cosmoswallet!.toJson(),
          'polkadotwallet': polkadotwallet!.toJson(),
          'thorchainwallet': thorchainwallet!.toJson(),
          'ethwallet': ethwallet.toJson(),
          'seedPhrase': seedPhrase,
          'name': name,
          'type': walletType.index,
          'totalAmount': totalAmount,
        }
      : {
          'id': id,
          'ethwallet': ethwallet.toJson(),
          'name': name,
          'type': walletType.index,
          'totalAmount': totalAmount,
        };
  static BiorBankWallet fromJson(String str) {
    Map<String, dynamic> wallet = json.decode(str);

    return wallet['type'] == 0
        ? BiorBankWallet(
            id: wallet['id'],
            name: wallet['name'],
            btcwallet: WalletAddress.fromJson(wallet['btcwallet']),
            ltcwallet: WalletAddress.fromJson(wallet['ltcwallet']),
            solanawallet: WalletAddress.fromJson(wallet['solanawallet']),
            injectivewallet: WalletAddress.fromJson(wallet['injectivewallet']),
            kujirawallet: WalletAddress.fromJson(wallet['kujirawallet']),
            cosmoswallet: WalletAddress.fromJson(wallet['cosmoswallet']),
            polkadotwallet: WalletAddress.fromJson(wallet['polkadotwallet']),
            thorchainwallet: WalletAddress.fromJson(wallet['thorchainwallet']),
            ethwallet: WalletAddress.fromJson(wallet['ethwallet']),
            seedPhrase: wallet['seedPhrase'],
            walletType: WalletType.multiChainWallet,
            totalAmount: wallet['totalAmount'],
          )
        : BiorBankWallet(
            id: wallet['id'],
            name: wallet['name'],
            ethwallet: WalletAddress.fromJson(wallet['ethwallet']),
            walletType: WalletType.legacyWallet,
            totalAmount: wallet['totalAmount'],
          );
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
        case "INJ":
          return injectivewallet!.publicKey;
        case "KUJI":
          return kujirawallet!.publicKey;
        case "SOL":
          return solanawallet!.publicKey;
        case "RUNE":
          return thorchainwallet!.publicKey;
        case "ATOM":
          return cosmoswallet!.publicKey;
        case "DOT":
          return polkadotwallet!.publicKey;
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
