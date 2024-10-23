class GiftCardRequest {
  final String cardProductId;
  final String amount;

  GiftCardRequest({
    required this.cardProductId,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      "card_product_id": cardProductId,
      "amount": amount,
    };
  }
}
