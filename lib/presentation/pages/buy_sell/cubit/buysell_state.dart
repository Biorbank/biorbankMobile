part of 'buysell_cubit.dart';

@immutable
sealed class BuysellState {}

final class BuysellInitialState extends BuysellState {}

final class RegionSelectedState extends BuysellState {
  final CurrencyModel? region;
  RegionSelectedState({required this.region});
}

final class PaymentMethodConfirmedState extends BuysellState {
  final Map<String, dynamic> paymentMethod;
  PaymentMethodConfirmedState({required this.paymentMethod});
}

final class SelectedPaymentMethodState extends BuysellState {
  final Map<String, dynamic> paymentMethod;
  SelectedPaymentMethodState({required this.paymentMethod});
}

final class CryptoCurrencySelectedState extends BuysellState {
  final CryptoAssetRepositoryImpl currency;
  CryptoCurrencySelectedState({required this.currency});
}
