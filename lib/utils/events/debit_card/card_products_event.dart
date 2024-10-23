abstract class CardProductEvent {}

class FetchCardProducts extends CardProductEvent {
  int currentPage;
  int perPage;

  FetchCardProducts({this.currentPage = 1, this.perPage = 10});
}
