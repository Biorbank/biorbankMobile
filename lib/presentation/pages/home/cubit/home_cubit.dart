import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/buy_sell/view/buy_sell_screen.dart';
import 'package:biorbank/presentation/pages/deposit/view/deposit_view.dart';
import 'package:biorbank/presentation/pages/pay_bills/view/pay_bills_view.dart';
import 'package:biorbank/presentation/pages/send/view/send_currency_view.dart';
import 'package:biorbank/utils/enum/home_page_action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/my_account_model.dart';
import '../model/my_account_token_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  TextEditingController searchController = TextEditingController();

  String selectedChartTimePeriod = '1W';
  ActionEnum? selectedOption;
  List<String> chartTimePeriod = ['1W', 'MTD', '1M', 'YTD', '1Y', 'ALL'];
  int tabIndex = 0;

  void onChangeChartTimePeriod({required String value}) {
    selectedChartTimePeriod = value;
    emit(ChartTimePeriodState(value: value));
  }

  List<Map<String, dynamic>> tradeOptions = [
    {'icon': Assets.imagesSwapArrow, 'title': 'Swap', 'type': ActionEnum.swap},
    {
      'icon': Assets.imagesArrowDown,
      'title': 'Deposit',
      'type': ActionEnum.deposit
    },
    {'icon': Assets.imagesArrowUp, 'title': 'Send', 'type': ActionEnum.send},
    {
      'icon': Assets.imagesBitcoinRefresh,
      'title': 'Buy/Sell',
      'type': ActionEnum.buyORsell
    },
    {
      'icon': Assets.imagesWallet,
      'title': 'Pay Bills',
      'type': ActionEnum.payBills
    },
  ];

  void changeTabIndex({required int value}) {
    emit(HomeTabIndexChangeState(index: value));
  }

  void onTapeTradeActionOption({required ActionEnum? value}) {
    emit(TradeOptionChnageState(value: value));
  }

  Widget getActionScreen({required ActionEnum? value}) {
    switch (value) {
      case ActionEnum.swap:
        return const SizedBox.shrink();
      case ActionEnum.deposit:
        return const DepositView();
      case ActionEnum.send:
        return const SendCurrencyView();
      case ActionEnum.buyORsell:
        return const BuySellScreen();
      case ActionEnum.payBills:
        return const PayBillsView();
      default:
        return const SizedBox.shrink();
    }
  }

  final double percent = 0.7;

  List<MyAccountModel> myAccountData = [];
  MyAccountModel totalAccountData = MyAccountModel(
    title: "All Accounts",
    isProfit: true,
    percent: 0.2,
  );

  void onChangeMyAccountData({required List<MyAccountModel> value}) {
    myAccountData.clear();
    myAccountData.addAll(value);
    List<MyAccountModel> tempAccountModels = [
      MyAccountModel(
        title: "All Accounts",
      )
    ];
    tempAccountModels.addAll(value);
    totalAccountData = tempAccountModels.reduce(
      (acc, e) {
        // Calculate sum of amounts and percentages
        double totalCurrentAmt = acc.currentAmt + e.currentAmt;
        double totalDifferentAmt = acc.differentAmt + e.differentAmt;
        double totalPercent = acc.percent + e.percent;

        // Calculate average percentage
        double averagePercent = totalPercent / tempAccountModels.length;

        return MyAccountModel(
          title: "All Accounts",
          currentAmt: totalCurrentAmt,
          differentAmt: totalDifferentAmt,
          totalDifferentInPercentage:
              acc.totalDifferentInPercentage + e.totalDifferentInPercentage,
          isProfit: totalDifferentAmt >= 0, // Logic for profit
          percent: averagePercent, // Use average percent
        );
      },
    );
    emit(ChangeMyAccountData(accountData: value));
  }

  List<MyAccountTokenModel> myActTokenData = [];

  void onChangeMyActTokenData({required List<MyAccountTokenModel> value}) {
    myActTokenData.clear();
    myActTokenData.addAll(value);
    emit(ChangeMyActTokenData(accountData: value));
  }
}
