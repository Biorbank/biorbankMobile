class CardProduct {
  final String id;
  final String name;
  final double minimumValue;
  final double maximumValue;
  final double feeAmount;
  final String feeType;
  final List<String> categories;

  CardProduct({
    required this.id,
    required this.name,
    required this.minimumValue,
    required this.maximumValue,
    required this.feeAmount,
    required this.feeType,
    required this.categories,
  });

  factory CardProduct.fromJson(Map<String, dynamic> json) {
    return CardProduct(
      id: json['id'],
      name: json['name'],
      minimumValue: json['minimum_value'],
      maximumValue: json['maximum_value'],
      feeAmount: json['fee_amount'],
      feeType: json['fee_type'],
      categories: List<String>.from(json['categories']),
    );
  }
}
