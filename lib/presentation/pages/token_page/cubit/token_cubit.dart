import 'package:biorbank/presentation/pages/token_page/cubit/token_state.dart';
import 'package:biorbank/presentation/pages/token_page/model/currency_model.dart';
import 'package:biorbank/presentation/pages/token_page/model/news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/enum/home_page_action_enum.dart';
import '../view/widget/alert_btn/custom_date_time_picker/custom_time_picker_widget.dart';
import '../view/widget/alert_btn/custom_date_time_picker/custome_date_month_picker.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(InitialTokenState());

//TabBar Screen
  int selectedTabIndex = 0;

  void onChangeTabIndex({required int index}) {
    emit(TabBarIndexState(index: index));
  }

// OverView Tab Screen
  String selectedValue = "1 day";
  List<String> overviewItems = [
    "1 day",
    "7 day",
    "15 day",
  ];

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

  ActionEnum? selectedOption;

  void changeOverviewDropDown({required String value}) {
    emit(ChangeOverviewDropDown(value: value));
  }

  void onTapeTradeActionOption({required ActionEnum? value}) {
    emit(TradeOptionChnageState(value: value));
  }

// Info Tab Screen
  CurrencyModel2? onChanged1Value;
  CurrencyModel2? onChanged2Value;
  List<CurrencyModel2> items = [
    CurrencyModel2(
        name: 'ETH',
        url: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png'),
    CurrencyModel2(
        name: 'Bitcoin',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
  ];

  void changeInfoDropDown1({required CurrencyModel2 value}) {
    emit(ChangeInfoDropDown1(value: value));
  }

  void changeInfoDropDown2({required CurrencyModel2 value}) {
    emit(ChangeInfoDropDown2(value: value));
  }

// Social Tab Screen

  String selectedExplore = "Etherscan";
  List<String> exploreDataList = ['Etherscan', 'Bitscan'];

  String selectedChain = "7 more";
  List<String> chainDataList = ['7 more', '8 more'];

  void changeExploreDropDown({required String value}) {
    emit(ExploreDropDownValueState(value: value));
  }

  void changeChainDropDown({required String value}) {
    emit(ChainDropDownValueState(value: value));
  }

// Create Alert on BTC popup

  String crossingValue = "Crossing";
  List<String> crossingItems = [
    "Crossing",
    "Crossing Up",
    "Crossing Down",
    "Greater Than",
    "Less Than",
    "Entering Channel",
    "Inside Channel",
    "Outside Channel",
    "Moving Up",
    "Moving Down",
    "Moving Up %",
    "Moving Down %",
  ];

  String cadValue = "5852.26  CAD";
  List<String> cadItems = [
    "5852.26  CAD",
    "6952.26  CAD",
    "5582.26  CAD",
  ];

  int tabCreateBTCIndex = 0;

  String selectedHour = "00";
  String selectedMinute = "00";
  String selectedAmPm = 'AM';

  final FixedExtentScrollController hourController =
      FixedExtentScrollController();
  final FixedExtentScrollController minuteController =
      FixedExtentScrollController();
  final FixedExtentScrollController amPmController =
      FixedExtentScrollController();
  final TextEditingController selectTimeCtrl = TextEditingController();
  final TextEditingController selectDateCtrl = TextEditingController();

  List<String> amPm = ['AM', 'PM'];
  List<String> min = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  );

  List<String> hour = List.generate(
    13,
    (index) => index.toString().padLeft(2, '0'),
  );

  String selectedTime = DateFormat('HH:mm').format(DateTime.now());

  String selectedDate = DateFormat('MMMM d, yyyy').format(DateTime.now());

  void showTimePicker(
      {required BuildContext context,
      required TimePickerWidget timePicker}) async {
    final selectTime = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.scrim,
      constraints: BoxConstraints.loose(const Size.fromHeight(200)),
      builder: (BuildContext context) {
        return timePicker;
      },
    );

    selectTimeCtrl.text = selectedTime;
  }

  void showDatePicker(

      {required BuildContext context,
      required CustomCalendarDatePicker customCalendarDatePicker}) async {
    final selectDate = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.scrim,
      builder: (BuildContext context) {
        return customCalendarDatePicker;
      },
    );
    selectDateCtrl.text = selectedDate;
  }

  void changeCrossingDropDown({required String value}) {
    emit(ChangeCrossingDropDown(value: value));
  }

  void changeCreateBTCTabIndex({required int index}) {
    emit(TabCreateBTCIndexChangeState(index: index));
  }

  void changeCadDropDown({required String value}) {
    emit(ChangeCadDropDown(value: value));
  }

  void selectTime({required String time}) {
    emit(SelectedTimeState(time: time));
  }

// News Tab Screen

  List<NewsModel> newsData = [
    NewsModel(
      name:
          "Bitcoin Falls After U.S. Sends \$240M Worth of Silk Road-Related BTC to Coinbase",
      userName: "By Andrew Hayward",
      description:
          "XRP price attempted a recovery wave above the \$0.4720 level like Bitcoin and Ethereum. However, the bears were active near the \$0.480 resistance zone. A high was formed at \$0.4797 and the price started a fresh decline. \n \n There was a move below the \$0.4750 and \$0.4720 levels. The price declined below the 50% Fib retracement level of the upward move from the \$0.4619 swing low to the \$0.4797 high. There is also a major bearish trend line forming with resistance at \$0.4720 on the hourly chart of the XRP/USD pair.\n\n The price is now trading below \$0.4750 and the 100-hourly Simple Moving Average. However, it is finding bids near the 61.8% Fib retracement level of the upward move from the \$0.4619 swing low to the \$0.4797 high.",
      newsType: "The Block",
      date: "Feb 28, 2024",
      seenTime: "3 hours ago",
      img:
          "https://cnews24.ru/uploads/803/8033656ec41b45c93b3daf61d41a5d6543be779b.png",
      userImg:
          "https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg",
    ),
    NewsModel(
      name:
          "Bitcoin Whales Accumulate \$436M Worth BTC in a Day Amid Intense FUD: ITB",
      userName: "By Andrew Hayward",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially. \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially.",
      newsType: "The Block",
      date: "Feb 28, 2024",
      seenTime: "3 hours ago",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp8eovu_5cyKjEfjheMa5WjsheSx3406C0gg&s",
      userImg:
          "https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg",
    ),
    NewsModel(
      name:
          "Polkadot Price Analysis: Where Is DOT Heading Next After Losing the \$6 Level?",
      userName: "By Andrew Hayward",
      description:
          "The Securities and Exchange Commission could approve applications for spot Ethereum ETH -0.62% ETFs as soon as July 4, according to Reuters, which cited anonymous sources.\n\n The SEC 'could approve exchange traded funds tied to the spot price of ether as soon as July 4, as talks between asset managers and regulators enter the final stages, industry executives and other participants told Reuters,' according to the report published Wednesday. \n\n On Tuesday, Gary Gensler, acting SEC chair, said the process for launching spot Ethereum ETFs was “going smoothly.” That same day, VanEck also filed a Form 8-A for its Ethereum ETF, appearing to indicate that the instrument could soon be trading on an exchange.",
      newsType: "The Block",
      date: "Feb 28, 2024",
      seenTime: "3 hours ago",
      img:
          "https://imgs.search.brave.com/x0krQi61ZJ6Q69UCCtiYOd3Vo5AtqshDED9Go_sTGto/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jcnlw/dG8ubmV3cy9hcHAv/dXBsb2Fkcy8yMDI0/LzA0L2NyeXB0by1u/ZXdzLU1pQ0FzLUlt/cGFjdC1vbi10aGUt/RnV0dXJlLW9mLXRo/ZS1DcnlwdG8tTGFu/ZHNjYXBlLW9wdGlv/bjA1LTg4MHg1MjUu/d2VicA",
      userImg:
          "https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg",
    ),
    NewsModel(
      name:
          "Pepe Soars 9% Daily, Bitcoin Price Eyes \$62K After Recent Crash (Market Watch)",
      userName: "By Andrew Hayward",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially. \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially.",
      newsType: "The Block",
      date: "Feb 28, 2024",
      seenTime: "3 hours ago",
      img:
          "https://www.tbstat.com/wp/uploads/2024/05/20240523_Ethereum_News_5-1200x675.jpg?isSafari=false&isMobile=false",
      userImg:
          "https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg",
    ),
    NewsModel(
      name:
          "Ethereum Foundation’s Mailing List Leaked: Vulnerability in SendPulse Flagged",
      userName: "By Andrew Hayward",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially. \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially.",
      newsType: "The Block",
      date: "Feb 28, 2024",
      seenTime: "3 hours ago",
      img:
          "https://imgs.search.brave.com/cTirT-3Y7tXoRxf4F7JQ6VBgnRsEwk2nVqWtSvHvunA/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA1LzAwLzc1Lzg3/LzM2MF9GXzUwMDc1/ODc0OF82Q0VOZDZz/S2hPckRKVHlSQkdh/VzNERHg2RDJYdHlP/MC5qcGc",
      userImg:
          "https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg",
    ),
  ];
}
