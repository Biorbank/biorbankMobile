class Merchant {
  final String id;
  final String name;
  final String description;
  final String redemptionInstructions;
  final String primaryTextColor;
  final String primaryBrandColor;

  Merchant({
    required this.id,
    required this.name,
    required this.description,
    required this.redemptionInstructions,
    required this.primaryTextColor,
    required this.primaryBrandColor,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      redemptionInstructions: json['redemption_instructions'],
      primaryTextColor: json['primary_text_color'],
      primaryBrandColor: json['primary_brand_color'],
    );
  }
}
