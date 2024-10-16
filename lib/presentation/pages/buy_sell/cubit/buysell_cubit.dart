import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'buysell_state.dart';

class BuySellCubit extends Cubit<BuysellState> {
  BuySellCubit() : super(BuysellInitialState());

  TextEditingController religionTextController = TextEditingController();

  Map<String, dynamic> confirmedPaymentMethod = {};
  Map<String, dynamic> paymentMethodSelected = {};
  List<CurrencyModel> regionList = [
    CurrencyModel(
        country: "English (UK)",
        name: 'GBP',
        url: 'https://www.worldometers.info/img/flags/uk-flag.gif'),
    CurrencyModel(
        country: 'France',
        name: 'EUR',
        url: 'https://www.worldometers.info/img/flags/fr-flag.gif'),
    CurrencyModel(
        country: 'Germany',
        name: 'EUR',
        url: 'https://www.worldometers.info/img/flags/gm-flag.gif'),
    CurrencyModel(
        country: 'Spain',
        name: 'EUR',
        url: 'https://www.worldometers.info/img/flags/sp-flag.gif'),
  ];
  CurrencyModel? selectedRegion;

  void onSelectRegion({required CurrencyModel? region}) {
    religionTextController.clear();
    emit(RegionSelectedState(region: region));
  }

  void onConfirmedPaymentMethod({required Map<String, dynamic> payment}) {
    emit(PaymentMethodConfirmedState(paymentMethod: payment));
  }

  void onSelectPaymentMethods({required Map<String, dynamic> payment}) {
    emit(SelectedPaymentMethodState(paymentMethod: payment));
  }

  List<Map<String, dynamic>> paymentMethodDataList = [
    {
      "image_url":
          "https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png",
      "payment_name": "Google Pay",
      "type": "Instant",
      "limit": "lowest buy limit",
      "sub_image1":
          "https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png",
      "sub_image2": ""
    },
    {
      "image_url":
          "https://logowik.com/content/uploads/images/credit-card2790.jpg",
      "payment_name": "Debit or Credit",
      "type": "Instant",
      "limit": "lowest buy limit",
      "sub_image1":
          "https://static-00.iconduck.com/assets.00/payment-visa-transparent-icon-2048x665-375s57fi.png",
      "sub_image2":
          "https://i.pinimg.com/736x/56/fd/48/56fd486a48ff235156b8773c238f8da9.jpg"
    },
    {
      "image_url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVKGCGamMJDM0sR4w1V3A38KBL55fLUWwdOg&s",
      "payment_name": "PayPal",
      "type": "Instant",
      "limit": "lowest buy limit",
      "sub_image1":
          "https://e7.pngegg.com/pngimages/989/772/png-clipart-logo-paypal-graphics-product-computer-icons-paypal-blue-angle-thumbnail.png",
      "sub_image2": ""
    },
  ];

  // you want to buy
  CryptoAssetRepositoryImpl? selectedCryptoCurrency;

  void onSelectCryptoCurrency({required CryptoAssetRepositoryImpl currency}) {
    selectedCryptoCurrency = currency;
    emit(CryptoCurrencySelectedState(currency: currency));
  }
}
