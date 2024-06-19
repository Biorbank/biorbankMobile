part of 'deposit_cubit.dart';

@immutable
sealed class DepositState {}

final class DepositInitial extends DepositState {}


final class DepositTabIndexState extends DepositState{
  final int index;
  DepositTabIndexState({required this.index});
}
final class NetworkSelectedState extends DepositState {
  final CurrencyModel? network;
  NetworkSelectedState({required this.network});
}
final class CoinSelectedState extends DepositState {
  final CurrencyModel? coin;
  CoinSelectedState({required this.coin});
}
final class QrCodeValueState extends DepositState {
  final String? qrValue;
  QrCodeValueState({required this.qrValue});
}
