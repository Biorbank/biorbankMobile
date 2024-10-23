import 'package:biorbank/utils/models/gift_card_response.dart';

abstract class GiftCardState {}

class CardInitial extends GiftCardState {}

class CardLoading extends GiftCardState {}

class CardLoaded extends GiftCardState {
  final GiftCardResponse cardResponse;

  CardLoaded(this.cardResponse);
}

class CardError extends GiftCardState {
  final String message;

  CardError(this.message);
}
