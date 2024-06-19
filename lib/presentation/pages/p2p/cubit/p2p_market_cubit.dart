import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'p2p_market_state.dart';

class P2pMarketCubit extends Cubit<P2pMarketState> {
  P2pMarketCubit() : super(P2pMarketInitialState());

  CurrencyModel? selectedCurrency;
  CurrencyModel? selectedCountry;
  TextEditingController searchPaymenyMethodController = TextEditingController();
  int selectedPaymentMethodTabIndex = 0;
  int selectedPaymentMethod = 0;
  bool isOpenPaymentMethodSheet = false;
  bool isOpenLimitSheet = false;
  bool isTradingRequirement  = false;
  bool isUnderstandTradingRule  = false;
  CurrencyModel? currentPaymentMethod;
  List<XFile> images = [];

  List<CurrencyModel> currencyList = [
    CurrencyModel(
        name: 'BTC',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
    CurrencyModel(
        name: 'ETH',
        url:
            'https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png'),
  ];
  List<CurrencyModel> countryList = [
    CurrencyModel(
        name: 'USA',
        url:
            'https://www.worldatlas.com/r/w768/upload/a7/b5/78/shutterstock-157626554.jpg'),
    CurrencyModel(
        name: 'INDIA',
        url:
            'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/200px-Flag_of_India.svg.png')
  ];

  void onChangeCurrency({required CurrencyModel? currency}) {
    emit(CurrencySelectedState(currency: currency));
  }

  void onChangeCountry({required CurrencyModel? country}) {
    emit(CountrySelectedState(country: country));
  }

  void onChangePaymentMethodTabIndex({required int tabIndex}) {
    emit(PaymentMethodTabIndexState(index: tabIndex));
  }

  List<Map<String, dynamic>> paymentMethodList = [
    {"image": "", "name": "All"},
    {
      "image": "https://cdn-icons-png.flaticon.com/512/5968/5968601.png",
      "name": "Apple pay"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxA9y51BO3bnl3JOlmO-kLyg-JKtsQhIzo0F9NtDGZVNDQfBch21A4JnoN1jCXA6RrTyo&usqp=CAU",
      "name": "Cash on ATM"
    },
    {
      "image":
          "https://w7.pngwing.com/pngs/926/107/png-transparent-emblem-logo-brand-sticker-bitcoin-bitcoin-emblem-trademark-investment-thumbnail.png",
      "name": "Cryptocurrency"
    },
    {
      "image":
          "https://t4.ftcdn.net/jpg/07/49/96/63/360_F_749966377_H8eVJv5rUM8soqdZ8JnSF09TXpa6YQ8D.jpg",
      "name": "Cash by Mail"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRjpIx7JeqJG4X1nR-O0xvhd8QrPkifK_Vn4VujwPyu23IlHiLE6CBZA6H9eh9TtZKus&usqp=CAU",
      "name": "Cash deposit"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1lNl3Ml2iYwofZzgAqpNX-vcZKVoyKLexlQ&s",
      "name": "Cash on delivery"
    },
    {
      "image":
          "https://cdn6.aptoide.com/imgs/4/8/8/488d22b0c298859e3f2484340b07e7fd_icon.png",
      "name": "CashU"
    },
    {
      "image": "https://logowik.com/content/uploads/images/credit-card2790.jpg",
      "name": "Credit Card"
    },
  ];
  void onSelectPaymentMethod({required int index}) {
    emit(PaymentMethodSelectedState(index: index));
  }

  void onTapPaymentMethodButton({required bool value}) {
    emit(PaymentMethodSheetStatusState(isOpen: value));
  }

  void onTapLimitButton({required bool value}) {
    emit(LimitSheetStatus(isOpen: value));
  }

  List<String> paymentLimitList = ['100', '100', '5000', '10K', '100K', '200K'];

  List<CurrencyModel> paymentMethods = [
    CurrencyModel(
        name: 'Wise',
        url:
            'https://play-lh.googleusercontent.com/wU1A9m0ExkOTQAixWpggeLFzqeXFrR4A9GU9eDhLCO29AnAW4KzUYx1kyHPe21qPgw=w240-h480-rw'),
    CurrencyModel(
        name: "Credit Card",
        url: "https://logowik.com/content/uploads/images/credit-card2790.jpg")
  ];

    void onChangePaymentMethod({required CurrencyModel? payment}) {
    emit(PaymentMethodDropDownState(paymentMethod: payment));
  }

  void onPickImage({required XFile file}){
    emit(PickedImageState(imageFile: file));
  }
  void onChangeTradingRequirement({required bool value}){
    emit(TradingRequirementsState(value: value));
  }
  void toggleUnderstandTradingRules({required bool value}){
    emit(UnderstandTradingRuleState(value: value));
  }

  void refreshState(){
    emit(P2pMarketInitialState());
  }

}
