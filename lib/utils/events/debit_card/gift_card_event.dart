import 'package:biorbank/utils/models/gift_card_request.dart';

abstract class GiftCardEvent {}

class CreateGiftCard extends GiftCardEvent {
  final GiftCardRequest request;

  CreateGiftCard(this.request);
}
