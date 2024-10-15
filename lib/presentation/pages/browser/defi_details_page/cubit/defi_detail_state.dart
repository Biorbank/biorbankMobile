part of 'defi_detail_cubit.dart';

@immutable
sealed class DefiDetailState {}

final class DefiDetailInitialState extends DefiDetailState {}

final class DefiDetailTabIndexChange extends DefiDetailState {
  final int index;
  DefiDetailTabIndexChange({required this.index});
}

final class DefiDetailLoanTabIndexChange extends DefiDetailState {
  final int index;
  DefiDetailLoanTabIndexChange({required this.index});
}

final class SelectedProviderState extends DefiDetailState {
  final int index;
  SelectedProviderState({required this.index});
}

final class BorrowCurrencySelectedState extends DefiDetailState {
  final CryptoAssetRepositoryImpl currency;
  BorrowCurrencySelectedState({required this.currency});
}

final class CollateralCurrencySelectedState extends DefiDetailState {
  final CryptoAssetRepositoryImpl currency;
  CollateralCurrencySelectedState({required this.currency});
}
