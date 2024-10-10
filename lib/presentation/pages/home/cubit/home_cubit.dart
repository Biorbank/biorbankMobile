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
  TextEditingController networkController = TextEditingController();
  TextEditingController collectionController = TextEditingController();

  String selectedChartTimePeriod = '1W';
  ActionEnum? selectedOption;
  List<String> chartTimePeriod = ['1W', 'MTD', '1M', 'YTD', '1Y', 'ALL'];
  int tabIndex = 0;

  List<Map<String, dynamic>> marketStatusList = [
    {
      'name': "Listed",
      "value": false,
    },
    {
      'name': "Has Offer",
      "value": false,
    },
    {
      'name': "Not Listed",
      "value": false,
    },
  ];

  List<Map<String, dynamic>> optionsList = [
    {
      "name": 'Hide unverified NFTs',
      "value": false,
    },
    {
      "name": 'Hide Low value NFTs',
      "value": false,
    },
    {
      "name": 'Show Manually Hidden NFTs',
      "value": false,
    }
  ];

  List<Map<String, dynamic>> collectionsList = [
    {
      "img":
          "https://i.seadn.io/s/raw/files/4ee7ead8ab3941cad1e94f080ce27d56.png?auto=format&dpr=1&w=1000",
      "name": 'MyPetHooligan',
      "value": false,
    },
    {
      "img":
          "https://i.seadn.io/s/raw/files/4ee7ead8ab3941cad1e94f080ce27d56.png?auto=format&dpr=1&w=1000",
      "name": 'Bored Ape Yacht Club',
      "value": false,
    },
    {
      "img":
          "https://i.seadn.io/s/raw/files/4ee7ead8ab3941cad1e94f080ce27d56.png?auto=format&dpr=1&w=1000",
      "name": 'Unstoppable Domains - (Polygon)',
      "value": false,
    }
  ];

  resetFilter() {
    for (int i = 0; i < marketStatusList.length; i++) {
      marketStatusList[i]["value"] = false;
    }
    for (int i = 0; i < optionsList.length; i++) {
      optionsList[i]["value"] = false;
    }
    for (int i = 0; i < collectionsList.length; i++) {
      collectionsList[i]["value"] = false;
    }
  }

  void updateMarketStatusList({required int index, required bool value}) {
    emit(MarketStatusLoadingState());
    marketStatusList[index]['value'] = value;
    emit(MarketStatusChangeState(marketStatus: marketStatusList));
  }

  void updateOptionsList({required int index, required bool value}) {
    emit(OptionLoadingState());
    optionsList[index]['value'] = value;
    emit(OptionChangeState(option: List.from(optionsList)));
  }

  void updateCollectionsList({required int index, required bool value}) {
    emit(CollectionLoadingState());
    collectionsList[index]['value'] = value;
    emit(CollectionChangeState(collection: List.from(collectionsList)));
  }

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

  List<MyAccountTokenModel> myActTokenData = [
    MyAccountTokenModel(
      img:
          "https://i.imghippo.com/files/ILfFf1728424742.png",
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
    List<Map<String, dynamic>> tokenList = [
    {
      "image_url":
          "https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png",
      "name": 'Etherium',
      "short_name":"\$ETH",
      "price": '49,575',
      "usd_price": '\$1.04',
      "market_cap": '\$12,504',
      "price_difference": '643.58',
      "price_difference_percentage": '1.45',
    },
    {
     "image_url":
          "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
      "name": 'DASH',
      "short_name":"\$DASH",
      "price": '4229,575',
      "usd_price": '\$1.04',
      "market_cap": '\$12,504',
      "price_difference": '-643.58',
      "price_difference_percentage": '-1.45',
    },
    {
     "image_url":
          "https://s2.coinmarketcap.com/static/img/coins/200x200/2010.png",
      "name": 'Cardano',
      "short_name":"\$ADA",
      "price": '34,575',
      "usd_price": '\$1.04',
      "market_cap": '\$12,504',
      "price_difference": '643.58',
      "price_difference_percentage": '1.45',
    },{
      "image_url":
          "https://s2.coinmarketcap.com/static/img/coins/200x200/328.png",
      "name": 'Monero',
      "short_name":"\$XMR",
      "price": '65,575',
      "usd_price": '\$1.04',
      "market_cap": '\$12,504',
      "price_difference": '-643.58',
      "price_difference_percentage": '-1.45',
    }
  ];

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
