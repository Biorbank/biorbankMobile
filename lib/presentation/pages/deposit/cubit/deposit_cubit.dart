import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit() : super(DepositInitial());

  int depositTabIndex = 0;
CurrencyModel? selectedNetwork;
CurrencyModel? selectedCoin;
String? selectedQr;
  void onChangeTabIndex({required int index}) {
    emit(DepositTabIndexState(index: index));
  }

   List<CurrencyModel> networkList = [
    CurrencyModel(
        name: 'BTC',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
    CurrencyModel(
        name: 'ETH',
        url:
            'https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png'),
  ];
   List<String> qrCodeList = [
    '0z1x9c2v8b3n7m4a6s5d0f1g',
    '0z1x9c2v8dksn7m4a6s5d0f1g',
    '0z1x9c2itde3n7m4a6s5d0f1g',
  ];

  void onChangeNetwork({required CurrencyModel value}){
    emit(NetworkSelectedState(network: value));
  }
  void onChangeCoin({required CurrencyModel value}){
    emit(CoinSelectedState(coin: value));
  }
  void onChangeQRcodeValue({required String value}){
    emit(QrCodeValueState(qrValue: value));
  }
}
