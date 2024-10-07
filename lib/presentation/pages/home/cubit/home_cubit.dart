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

  List<MyAccountModel> myAccountData = [
    MyAccountModel(
      title: "Main",
      currentAmt: "\$0.00",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
      percent: 0.3,
    ),
    MyAccountModel(
      title: "Monero",
      currentAmt: "\$0.00",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
      percent: 0.2,
    ),
  ];

  List<MyAccountTokenModel> myActTokenData = [
    MyAccountTokenModel(
      img:
          "https://genomicsengland.imgix.net/logos/logos-biobank.png?auto=format%2Ccompress&fit=max&q=80&w=400&s=17728bfb82610a551ca18b2f7b8aad18",
      title: "\$BYB",
      title2: "BiorBank",
      amt: "49,162 | \$1.04",
      currentAmt: "\$12,568",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
    ),
    MyAccountTokenModel(
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png",
      title: "\$BTC",
      title2: "Bitcoin",
      amt: "49,162 | \$1.04",
      currentAmt: "\$12,568",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
    ),
    MyAccountTokenModel(
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJwbSX590v63Kjf-AHNo7HVF4k03aNmyt0Pw&s",
      title: "\$XMR",
      title2: "Monero",
      amt: "49,162 | \$1.04",
      currentAmt: "\$12,568",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
    ),
    MyAccountTokenModel(
      img: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png",
      title: "\$ETH",
      title2: "Etherium",
      amt: "49,162 | \$1.04",
      currentAmt: "\$12,568",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
    ),
    MyAccountTokenModel(
      img: "https://cdn.iconscout.com/icon/free/png-256/free-dash-2-441957.png",
      title: "\$DASH",
      title2: "DASH",
      amt: "49,162 | \$1.04",
      currentAmt: "\$12,568",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
    ),
    MyAccountTokenModel(
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLdd9WfS3QIH6smKyelNNojxodAJk9w03ZmA&s",
      title: "\$ADA",
      title2: "Cardano",
      amt: "49,162 | \$1.04",
      currentAmt: "\$12,568",
      differentAmt: "+643.67",
      totalDifferentInPercentage: "+1.23%",
      isProfit: true,
    ),
  ];
}
