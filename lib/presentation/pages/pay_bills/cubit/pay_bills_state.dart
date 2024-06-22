part of 'pay_bills_cubit.dart';

@immutable
sealed class PayBillsState {}

final class PayBillsInitialState extends PayBillsState {}

final class FormattedDateState extends PayBillsState {
  final String? dateTime;
  FormattedDateState({required this.dateTime});
}
