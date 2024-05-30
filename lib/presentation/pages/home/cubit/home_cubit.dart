import 'package:biorbank/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  TextEditingController searchController = TextEditingController();

  String selectedChartTimePeriod = '1W';
  String selectedOption = '';
  List<String> chartTimePeriod = ['1W', 'MTD', '1M', 'YTD', '1Y', 'ALL'];
  int tabIndex = 0;
  void onChangeChartTimePeriod({required String value}) {
    emit(ChartTimePeriodState(value: value));
  }

  List<Map<String, dynamic>> tradeOptions = [
    {'icon': Assets.imagesSwapArrow, 'title': 'Swap'},
    {'icon': Assets.imagesArrowDown, 'title': 'Deposit'},
    {'icon': Assets.imagesArrowUp, 'title': 'Send'},
    {'icon': Assets.imagesBitcoinRefresh, 'title': 'Buy/Sell'},
    {'icon': Assets.imagesWallet, 'title': 'Pay Bills  '},
  ];
  void changeTabIndex({required int value}) {
    emit(HomeTabIndexChangeState(index: value));
  }
  void onTapeTradeActionOption({required String value}) {
    emit(TradeOptionChnageState(value: value));
  }
}
