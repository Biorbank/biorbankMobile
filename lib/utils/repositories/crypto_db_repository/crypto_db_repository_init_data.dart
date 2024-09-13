part of 'crypto_db_repository_impl.dart';

enum AssetType { token, coin }

class CryptoAssetInformation {
  final int networkId;
  late final AssetType type;
  final String tokenId;
  final String name;
  final String symbol;
  final int decimal;
  final int cmcId;
  final String logo;
  int hidden;
  CryptoAssetInformation(
      {required this.type,
      required this.tokenId,
      required this.name,
      required this.symbol,
      required this.decimal,
      required this.networkId,
      required this.cmcId,
      required this.logo,
      this.hidden = 0});
  Map<String, dynamic> toMap() {
    return {
      'networkId': networkId,
      'type': type == AssetType.coin ? 0 : 1,
      'tokenId': tokenId,
      'name': name,
      'symbol': symbol,
      'decimal': decimal,
      'cmcId': cmcId,
      'logo': logo,
      'hidden': hidden,
    };
  }

  toogleVisibility() {
    hidden = hidden == 0 ? 1 : 0;
  }
}

class NetworkInformation {
  final int id;
  final String rpcUrl;
  final String explorerUrl;
  //only useful for evm chains
  final int chainId;
  final String name;
  NetworkInformation({
    required this.id,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.chainId,
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rpcUrl': rpcUrl,
      'explorerUrl': explorerUrl,
      'chainId': chainId,
      'name': name,
    };
  }

  String get tokenType {
    if (name == 'Binance') {
      return 'BEP20';
    } else if (name == 'Ethereum') {
      return 'ERC20';
    } else if (name == 'Polygon') {
      return 'Polygon';
    } else {
      return 'Hedera';
    }
  }

  String get symbol {
    switch (name) {
      case 'Ethereum':
        return 'ETH';
      case 'Binance':
        return 'BNB';
      case 'Hedera':
        return 'HBAR';
      case 'Polygon':
        return 'MATIC';
      default:
        return 'BTC';
    }
  }
}

class CryptoQuote {
  final int id;
  final int cmcId;
  final double priceInUSD;
  final double volumeday;
  final double volumeChangeday;
  final double percentChangehour;
  final double percentChangeday;
  final double percentChangeweek;
  final double percentChangemonth;
  final double marketCap;
  final double dilutedMarketCap;
  const CryptoQuote({
    this.id = 1,
    this.cmcId = 1,
    this.priceInUSD = 0,
    this.volumeday = 0,
    this.volumeChangeday = 0,
    this.percentChangemonth = 0,
    this.percentChangehour = 0,
    this.percentChangeday = 0,
    this.percentChangeweek = 0,
    this.marketCap = 0,
    this.dilutedMarketCap = 0,
  });
}
