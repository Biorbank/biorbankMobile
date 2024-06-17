part of 'p2p_market_cubit.dart';

@immutable
sealed class P2pMarketState {}

final class P2pMarketInitial extends P2pMarketState {}
final class CurrencySelectedState extends P2pMarketState {
  final CurrencyModel? currency;
  CurrencySelectedState({required this.currency});
}
final class CountrySelectedState extends P2pMarketState {
  final CurrencyModel? country;
  CountrySelectedState({required this.country});
}
final class PaymentMethodTabIndexState extends P2pMarketState {
  final int index;
  PaymentMethodTabIndexState({required this.index});
}
final class PaymentMethodSelectedState extends P2pMarketState {
  final int index;
  PaymentMethodSelectedState({required this.index});
}
final class PaymentMethodSheetStatusState extends P2pMarketState {
  final bool isOpen;
  PaymentMethodSheetStatusState({required this.isOpen});
}
final class LimitSheetStatus extends P2pMarketState {
  final bool isOpen;
  LimitSheetStatus({required this.isOpen});
}
