class PurchaseRequest {
  final int creditPurchaseAmount;
  final String blockchain;
  final String currency;

  PurchaseRequest({
    required this.creditPurchaseAmount,
    required this.blockchain,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      "creditPurchaseAmount": creditPurchaseAmount,
      "blockchain": blockchain,
      "currency": currency,
    };
  }
}
