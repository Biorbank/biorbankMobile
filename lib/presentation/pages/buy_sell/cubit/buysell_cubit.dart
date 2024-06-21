import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'buysell_state.dart';

class BuySellCubit extends Cubit<BuysellState> {
  BuySellCubit() : super(BuysellInitialState());

  TextEditingController religionTextController = TextEditingController();

  CurrencyModel? selectedRegion;
  CurrencyModel? selectedPaymentMethod;
  List<CurrencyModel> regionList = [
    CurrencyModel(
        name: 'Afghanistan',
        url: 'https://www.worldometers.info/img/flags/af-flag.gif'),
    CurrencyModel(
        name: 'Australia',
        url: 'https://www.worldometers.info/img/flags/as-flag.gif'),
    CurrencyModel(
        name: 'Argentina',
        url: 'https://www.worldometers.info/img/flags/ar-flag.gif'),
    CurrencyModel(
        name: 'China',
        url: 'https://www.worldometers.info/img/flags/ch-flag.gif'),
    CurrencyModel(
        name: 'Germany',
        url: 'https://www.worldometers.info/img/flags/gm-flag.gif'),
  ];
  List<CurrencyModel> paymentMethodList = [
    CurrencyModel(
        name: 'Debit or Credit',
        url: 'https://logowik.com/content/uploads/images/credit-card2790.jpg'),
    CurrencyModel(
        name: 'Cash by Mail',
        url:
            'https://t4.ftcdn.net/jpg/07/49/96/63/360_F_749966377_H8eVJv5rUM8soqdZ8JnSF09TXpa6YQ8D.jpg'),
  ];

  void onSelectRegion({required CurrencyModel? region}) {
    religionTextController.clear();
    emit(RegionSelectedState(region: region));
  }

  void onSelectPaymentMethod({required CurrencyModel? payment}) {
    emit(PaymentMethodSelectedState(paymentMethod: payment));
  }
}
