part of 'import_existing_account_cubit.dart';

@immutable
sealed class ImportExistingAccountState {}

final class ImportExistingAccountInitialState
    extends ImportExistingAccountState {}

final class PasswordVisibilityToggleState extends ImportExistingAccountState {}

final class TabIndexChangeState extends ImportExistingAccountState {
  final int index;
  TabIndexChangeState({required this.index});
}

final class ChainChangeState extends ImportExistingAccountState {
  final int index;
  ChainChangeState({required this.index});
}
