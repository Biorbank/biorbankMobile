part of 'market_cubit.dart';

@immutable
sealed class MarketState {}

final class MarketInitialState extends MarketState {}

final class ChangeTabBarIndexState extends MarketState {
  final int index;
  ChangeTabBarIndexState({required this.index});
}

final class OnChnageFilterState extends MarketState {
  final String filter;
  OnChnageFilterState({required this.filter});
}

final class OnChangeTimeState extends MarketState {
  final String time;
  OnChangeTimeState({required this.time});
}

final class ChangeCoinsTabBarIndexState extends MarketState {
  final int index;
  ChangeCoinsTabBarIndexState({required this.index});
}

final class CurrncySelectedState extends MarketState {
  final CurrencyModel? currency;
  CurrncySelectedState({required this.currency});
}
final class ReceiveCurrncySelectedState extends MarketState {
  final CurrencyModel? currency;
  ReceiveCurrncySelectedState({required this.currency});
}
final class RangeSliderState extends MarketState {
  final SfRangeValues ? value;
  RangeSliderState({required this.value, CurrencyModel? currency});
}

class CurrencyModel {
  final String url;
  final String name;
  CurrencyModel({required this.name, required this.url});
}
