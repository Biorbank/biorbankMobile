class GiftCardResponse {
  final String id;
  final int value;
  final String cardProductId;
  final String supportToken;
  final bool markedUsed;
  final String barcode;
  final String pin;
  final String securityCode;
  final String merchantCardWebsite;
  final String redemptionInstructions;

  GiftCardResponse({
    required this.id,
    required this.value,
    required this.cardProductId,
    required this.supportToken,
    required this.markedUsed,
    required this.barcode,
    required this.pin,
    required this.securityCode,
    required this.merchantCardWebsite,
    required this.redemptionInstructions,
  });

  factory GiftCardResponse.fromJson(Map<String, dynamic> json) {
    return GiftCardResponse(
      id: json['id'],
      value: json['value'],
      cardProductId: json['card_product_id'],
      supportToken: json['support_token'],
      markedUsed: json['marked_used'],
      barcode: json['barcode'],
      pin: json['pin'],
      securityCode: json['security_code'],
      merchantCardWebsite: json['merchant_card_website'],
      redemptionInstructions: json['redemption_instructions'],
    );
  }
}
