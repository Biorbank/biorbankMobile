abstract class CardEvent {}

class FetchCardEvent extends CardEvent {
  final String endCustomerId;

  FetchCardEvent(this.endCustomerId);
}
