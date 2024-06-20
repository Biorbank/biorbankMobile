part of 'send_money_cubit.dart';

@immutable
sealed class SendMoneyState {}

final class SendMoneyInitial extends SendMoneyState {}
final class SendMoneyTabIndexState extends SendMoneyState{
  final int index;
  SendMoneyTabIndexState({required this.index});
}
final class SelectedAccountState extends SendMoneyState{
  final String account;
  SelectedAccountState({required this.account});
}
final class SelectedReceipentState extends SendMoneyState{
  final String account;
  SelectedReceipentState({required this.account});
}
final class StepperIndexState extends SendMoneyState{
  final int index;
  StepperIndexState({required this.index});
}
