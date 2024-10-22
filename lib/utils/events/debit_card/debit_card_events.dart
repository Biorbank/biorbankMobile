abstract class DebitCardEvent {}

class FetchCardDetailsEvent extends DebitCardEvent {
  final String cardId;

  FetchCardDetailsEvent(this.cardId);
}

class FetchTransactionListEvent extends DebitCardEvent {
  final String cardId;
  int currentPage;
  int perPage;

  FetchTransactionListEvent(this.cardId, this.currentPage, this.perPage);
}
