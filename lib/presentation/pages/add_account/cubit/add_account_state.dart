part of 'add_account_cubit.dart';

@immutable
sealed class AddAccountState {}

final class AddAccountInitialState extends AddAccountState {}

final class PasswordToggleState extends AddAccountState {}

final class RecoveryPhraseSelectedState extends AddAccountState {
  final String phraseData;
  RecoveryPhraseSelectedState({required this.phraseData});
}

final class FetchWordLoadingState extends AddAccountState {}

final class FetchWordSuccessState extends AddAccountState {
  final String selectedeString;
  FetchWordSuccessState({required this.selectedeString});
}
