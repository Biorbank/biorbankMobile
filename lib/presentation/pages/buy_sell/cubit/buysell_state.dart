part of 'buysell_cubit.dart';

@immutable
sealed class BuysellState {}

final class BuysellInitialState extends BuysellState {}
final class RegionSelectedState extends BuysellState {
  final CurrencyModel? region;
  RegionSelectedState({required this.region});
}
final class PaymentMethodSelectedState extends BuysellState {
  final CurrencyModel? paymentMethod;
  PaymentMethodSelectedState({required this.paymentMethod});
}
