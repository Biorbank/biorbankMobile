import '../../models/gift_card_product.dart';

abstract class GiftCardProductsState {}

class CardProductsInitial extends GiftCardProductsState {}

class CardProductsLoading extends GiftCardProductsState {}

class CardProductsLoaded extends GiftCardProductsState {
  final List<GiftCardProduct> list;

  CardProductsLoaded(this.list);
}

class CardProductsError extends GiftCardProductsState {
  final String message;

  CardProductsError(this.message);
}
