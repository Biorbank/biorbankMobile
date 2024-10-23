import '../../models/CardProduct.dart';

abstract class CardProductState {}

class CardProductInitial extends CardProductState {}

class CardProductLoading extends CardProductState {}

class CardProductLoaded extends CardProductState {
  final List<CardProduct> cardProducts;

  CardProductLoaded(this.cardProducts);
}

class CardProductError extends CardProductState {
  final String message;

  CardProductError(this.message);
}
