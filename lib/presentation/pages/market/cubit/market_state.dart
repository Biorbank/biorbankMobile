part of 'market_cubit.dart';

@immutable
sealed class MarketState {}

final class MarketInitialState extends MarketState {}

final class ChangeTabBarIndexState extends MarketState {
  final int index;
  ChangeTabBarIndexState({required this.index});
}

final class OnChangeFilterState extends MarketState {
  final String filter;
  OnChangeFilterState({required this.filter});
}

final class OnChangeTimeState extends MarketState {
  final String time;
  OnChangeTimeState({required this.time});
}

final class ChangeCoinsTabBarIndexState extends MarketState {
  final int index;
  ChangeCoinsTabBarIndexState({required this.index});
}

final class PayWithCurrencySelectedState extends MarketState {
  final CryptoAssetRepositoryImpl currency;
  PayWithCurrencySelectedState({required this.currency});
}

final class ReceiveCurrencySelectedState extends MarketState {
  final CryptoAssetRepositoryImpl currency;
  ReceiveCurrencySelectedState({required this.currency});
}

final class RangeSliderState extends MarketState {
  final SfRangeValues? value;
  RangeSliderState({required this.value, CurrencyModel? currency});
}

class CurrencyModel {
  final String url;
  final String name;
  CurrencyModel({required this.name, required this.url});
}

final class ChangeSelectedCryptoTabState extends MarketState {
  final int index;
  ChangeSelectedCryptoTabState({required this.index});
}

final class TransactionStatusState extends MarketState {
  final int id;
  TransactionStatusState({required this.id});
}

final class SwapApprovalState extends MarketState {
  final bool isApproval;
  SwapApprovalState({required this.isApproval});
}
