// Events
abstract class GiftCardProductsEvent {}

class FetchGiftCardProducts extends GiftCardProductsEvent {
  final int page;
  int perPage;

  FetchGiftCardProducts(this.page, this.perPage);
}
