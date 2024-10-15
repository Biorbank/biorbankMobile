import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'defi_detail_state.dart';

class DefiDetailCubit extends Cubit<DefiDetailState> {
  DefiDetailCubit() : super(DefiDetailInitialState());

  int selectedTabIndex = 0;
  int selectedLoanTabIndex = 0;
  int selectedProvider = 0;

  CryptoAssetRepositoryImpl? selectedBorrowCurrency, selectedCollateralCurrency;

  void onChangeTabIndex({required int index}) {
    emit(DefiDetailTabIndexChange(index: index));
  }

  void onChangeLoanTabIndex({required int index}) {
    emit(DefiDetailLoanTabIndexChange(index: index));
  }

  void onSelectProviderState({required int index}) {
    emit(SelectedProviderState(index: index));
  }

  void onSelectBorrowCurrency({required CryptoAssetRepositoryImpl currency}) {
    selectedBorrowCurrency = currency;
    emit(BorrowCurrencySelectedState(currency: currency));
  }

  void onSelectCollateralCurrency(
      {required CryptoAssetRepositoryImpl currency}) {
    selectedCollateralCurrency = currency;
    emit(CollateralCurrencySelectedState(currency: currency));
  }
}
