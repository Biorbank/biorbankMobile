part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}
final class ChartTimePeriodState extends HomeState {
  final String value;
  ChartTimePeriodState({required this.value});
}
final class HomeTabIndexChangeState extends HomeState {
  final int index;
  HomeTabIndexChangeState({required this.index});
}

final class TradeOptionChnageState extends HomeState {
  final String value;
  TradeOptionChnageState({required this.value});
}

