
part of 'import_exsiting_account_cubit.dart';

@immutable
sealed class ImportExsitingAccountState {}

final class ImportExsitingAccountInitialState extends ImportExsitingAccountState {}
final class PasswordVisibilityToggleState extends ImportExsitingAccountState {}
final class TabIndexChangeState extends ImportExsitingAccountState {
  final int index;
  TabIndexChangeState({required this.index});
}
