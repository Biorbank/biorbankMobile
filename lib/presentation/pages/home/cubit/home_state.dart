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

final class ChangeMyAccountData extends HomeState {
  final List<MyAccountModel> accountData;
  ChangeMyAccountData({required this.accountData});
}

final class ChangeMyActTokenData extends HomeState {
  final List<MyAccountTokenModel> accountData;
  ChangeMyActTokenData({required this.accountData});
}

final class TradeOptionChangeState extends HomeState {
  final ActionEnum? value;

  TradeOptionChangeState({required this.value});
}

final class MarketStatusLoadingState extends HomeState {}

final class MarketStatusChangeState extends HomeState {
  final List<Map<String, dynamic>> marketStatus;

  MarketStatusChangeState({required this.marketStatus});
}

final class OptionLoadingState extends HomeState {}

final class OptionChangeState extends HomeState {
  final List<Map<String, dynamic>> option;

  OptionChangeState({required this.option});
}

final class CollectionLoadingState extends HomeState {}

final class CollectionChangeState extends HomeState {
  final List<Map<String, dynamic>> collection;

  CollectionChangeState({required this.collection});
}

final class ChangeSelectedWallet extends HomeState {
  final int index;

  ChangeSelectedWallet({required this.index});
}
