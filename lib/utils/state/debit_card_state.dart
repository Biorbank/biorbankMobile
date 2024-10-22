import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';

abstract class DebitCardState {}

class DebitCardInitial extends DebitCardState {}

class DebitCardLoading extends DebitCardState {}

class DebitCardLoaded extends DebitCardState {
  final PayWitMoonCard card;
  final List<PayWithMoonTransaction> transactions;

  DebitCardLoaded(this.card, this.transactions);
}

class DebitCardError extends DebitCardState {
  final String message;

  DebitCardError(this.message);
}
