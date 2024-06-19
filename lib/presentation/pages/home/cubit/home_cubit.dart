import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/deposit/view/deposit_view.dart';
import 'package:biorbank/presentation/pages/send/view/send_currency_view.dart';
import 'package:biorbank/utils/enum/home_page_action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  TextEditingController searchController = TextEditingController();

  String selectedChartTimePeriod = '1W';
  ActionEnum? selectedOption;
  List<String> chartTimePeriod = ['1W', 'MTD', '1M', 'YTD', '1Y', 'ALL'];
  int tabIndex = 0;
  void onChangeChartTimePeriod({required String value}) {
    emit(ChartTimePeriodState(value: value));
  }

  List<Map<String, dynamic>> tradeOptions = [
    {'icon': Assets.imagesSwapArrow, 'title': 'Swap','type':ActionEnum.swap},
    {'icon': Assets.imagesArrowDown, 'title': 'Deposit','type':ActionEnum.deposit},
    {'icon': Assets.imagesArrowUp, 'title': 'Send','type':ActionEnum.send},
    {'icon': Assets.imagesBitcoinRefresh, 'title': 'Buy/Sell','type':ActionEnum.buyORsell},
    {'icon': Assets.imagesWallet, 'title': 'Pay Bills','type':ActionEnum.payBills},
  ];
  void changeTabIndex({required int value}) {
    emit(HomeTabIndexChangeState(index: value));
  }
  void onTapeTradeActionOption({required ActionEnum? value}) {
    emit(TradeOptionChnageState(value: value));
  }

  Widget getActionScreen({required ActionEnum? value }){
    switch (value) {
      case ActionEnum.swap:
        return const SizedBox.shrink();
      case ActionEnum.deposit:
        return const DepositView();
      case ActionEnum.send:
        return const SendCurrencyView();
      case ActionEnum.buyORsell:
        return const SizedBox.shrink();
      case ActionEnum.payBills:
        return const SizedBox.shrink();
      default:
      return const SizedBox.shrink();
    }
  }
}
