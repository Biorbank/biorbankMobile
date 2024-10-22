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
  final String logo;

  NetworkInformation({
    required this.id,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.chainId,
    required this.name,
    required this.logo,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rpcUrl': rpcUrl,
      'explorerUrl': explorerUrl,
      'chainId': chainId,
      'name': name,
      'logo': logo,
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

class TotalAmountHistory {
  final DateTime createdAt;
  final double totalAmount;

  TotalAmountHistory({
    DateTime? createdAt,
    this.totalAmount = 0.0,
  }) : createdAt = createdAt ?? DateTime.now();
}
class PayWitMoonCard {
  final String id;
  final double balance;
  final double availableBalance;
  final String expiration;
  final String displayExpiration;
  final bool terminated;
  final String cardProductId;
  final String pan;
  final String cvv;
  final String supportToken;
  final bool frozen;

  PayWitMoonCard({
    this.id = "",
    this.balance = 0.0,
    this.availableBalance = 0.0,
    this.expiration = "",
    this.displayExpiration = "",
    this.terminated = false,
    this.cardProductId = "",
    this.pan = "",
    this.cvv = "",
    this.supportToken = "",
    this.frozen = false,
  });

  factory PayWitMoonCard.fromJson(Map<String, dynamic> json) {
    return PayWitMoonCard(
      id: json['id'] ?? "",
      pan: json['pan'] ?? "",
      cvv: json['cvv'] ?? "",
      cardProductId: json['card_product_id'] ?? "",
      expiration: json['expiration'] ?? "",
      displayExpiration: json['display_expiration'] ?? "",
      balance: (json['balance'] ?? 0.0).toDouble(),
      availableBalance: (json['available_balance'] ?? 0.0).toDouble(),
      supportToken: json['support_token'] ?? "",
      terminated: json['terminated'] ?? false,
      frozen: json['frozen'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pan': pan,
      'cvv': cvv,
      'card_product_id': cardProductId,
      'expiration': expiration,
      'display_expiration': displayExpiration,
      'balance': balance,
      'available_balance': availableBalance,
      'support_token': supportToken,
      'terminated': terminated,
      'frozen': frozen,
    };
  }
}

class PayWithMoonTransaction {
  final String transactionId;
  final String transactionStatus;
  final DateTime datetime;
  final String merchant;
  final double amount;
  final String ledgerCurrency;
  final double amountFeesInLedgerCurrency;
  final double amountInTransactionCurrency;
  final String transactionCurrency;
  final double amountFeesInTransactionCurrency;
  final List<PayWithMoonFee> fees;

  PayWithMoonTransaction({
    required this.transactionId,
    required this.transactionStatus,
    required this.datetime,
    required this.merchant,
    required this.amount,
    required this.ledgerCurrency,
    required this.amountFeesInLedgerCurrency,
    required this.amountInTransactionCurrency,
    required this.transactionCurrency,
    required this.amountFeesInTransactionCurrency,
    required this.fees,
  });

  factory PayWithMoonTransaction.fromJson(Map<String, dynamic> json) {
    var feeList = json['data']['fees'] as List;
    List<PayWithMoonFee> fees = feeList.map((i) => PayWithMoonFee.fromJson(i)).toList();

    return PayWithMoonTransaction(
      transactionId: json['data']['transactionId'],
      transactionStatus: json['data']['transactionStatus'],
      datetime: DateTime.parse(json['data']['datetime']),
      merchant: json['data']['merchant'],
      amount: json['data']['amount'].toDouble(),
      ledgerCurrency: json['data']['ledgerCurrency'],
      amountFeesInLedgerCurrency: json['data']['amountFeesInLedgerCurrency'].toDouble(),
      amountInTransactionCurrency: json['data']['amountInTransactionCurrency'].toDouble(),
      transactionCurrency: json['data']['transactionCurrency'],
      amountFeesInTransactionCurrency: json['data']['amountFeesInTransactionCurrency'].toDouble(),
      fees: fees,
    );
  }
}

class PayWithMoonFee {
  final String type;
  final double amount;
  final double feeAmountInTransactionCurrency;
  final String feeDescription;

  PayWithMoonFee({
    required this.type,
    required this.amount,
    required this.feeAmountInTransactionCurrency,
    required this.feeDescription,
  });

  factory PayWithMoonFee.fromJson(Map<String, dynamic> json) {
    return PayWithMoonFee(
      type: json['type'],
      amount: json['amount'].toDouble(),
      feeAmountInTransactionCurrency: json['feeAmountInTransactionCurrency'].toDouble(),
      feeDescription: json['feeDescription'],
    );
  }
}


