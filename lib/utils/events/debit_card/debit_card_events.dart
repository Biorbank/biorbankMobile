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

class CreateCardEvent extends DebitCardEvent {
  final String prodId;

  CreateCardEvent(this.prodId);
}

class FreezeCardEvent extends DebitCardEvent {
  final String cardId;
  final bool freeze;

  FreezeCardEvent(this.cardId, this.freeze);
}
