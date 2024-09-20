part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitialState extends CreateAccountState {}
final class PasswordToggleState extends CreateAccountState {}

final class RecoveryPhraseSelectedState extends CreateAccountState {
    final String phraseData;
RecoveryPhraseSelectedState({required this.phraseData});
}

final class FetchWordLoadingState extends CreateAccountState {}

final class FetchWordSuccessState extends CreateAccountState {
  final String selectedeString;
  FetchWordSuccessState({required this.selectedeString});
}
