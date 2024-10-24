part of 'debit_card_cubit.dart';

@immutable
sealed class DebitCardState {}

final class DebitCardInitial extends DebitCardState {}

final class DebitCardLoading extends DebitCardState {}

class DebitCardNumberUpdated extends DebitCardState {
  final bool isVisibleCardNumber;

  DebitCardNumberUpdated(this.isVisibleCardNumber);
}

class DebitCardFrozen extends DebitCardState {
  final String message;

  DebitCardFrozen(this.message);
}

class SortByFilterUpdateState extends DebitCardState {
  final String value;

  SortByFilterUpdateState({required this.value});
}

class OnlineInStoreFilterUpdateState extends DebitCardState {
  final String value;

  OnlineInStoreFilterUpdateState({required this.value});
}

class TypeFilterUpdateState extends DebitCardState {
  final String value;

  TypeFilterUpdateState({required this.value});
}

final class DebitCardError extends DebitCardState {
  final String message;

  DebitCardError(this.message);
}
