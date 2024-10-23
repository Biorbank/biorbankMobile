import 'package:biorbank/utils/models/pagination.dart';

import 'gift_card_product.dart';

class GiftCardProductResponse {
  final Pagination pagination;
  final List<GiftCardProduct> cardProducts;

  GiftCardProductResponse({
    required this.pagination,
    required this.cardProducts,
  });

  factory GiftCardProductResponse.fromJson(Map<String, dynamic> json) {
    return GiftCardProductResponse(
      pagination: Pagination.fromJson(json['pagination']),
      cardProducts: (json['card_products'] as List)
          .map((product) => GiftCardProduct.fromJson(product))
          .toList(),
    );
  }
}
