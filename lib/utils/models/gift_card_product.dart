import 'merchant.dart';

class GiftCardProduct {
  final String id;
  final String name;
  final List<double> denominations;
  final double minimumValue;
  final double maximumValue;
  final double feeAmount;
  final String feeType;
  final Merchant merchant;
  final List<String> categories;
  final double discountPercentage;

  GiftCardProduct({
    required this.id,
    required this.name,
    required this.denominations,
    required this.minimumValue,
    required this.maximumValue,
    required this.feeAmount,
    required this.feeType,
    required this.merchant,
    required this.categories,
    required this.discountPercentage,
  });

  factory GiftCardProduct.fromJson(Map<String, dynamic> json) {
    return GiftCardProduct(
      id: json['id'],
      name: json['name'],
      denominations: List<double>.from(json['denominations']),
      minimumValue: json['minimum_value'].toDouble(),
      maximumValue: json['maximum_value'].toDouble(),
      feeAmount: json['fee_amount'].toDouble(),
      feeType: json['fee_type'],
      merchant: Merchant.fromJson(json['merchant']),
      categories: List<String>.from(json['categories']),
      discountPercentage: json['discount_percentage'].toDouble(),
    );
  }
}
