import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'buysell_state.dart';

class BuySellCubit extends Cubit<BuysellState> {
  BuySellCubit() : super(BuysellInitialState());

  TextEditingController religionTextController = TextEditingController();

  CurrencyModel? selectedRegion;
  Map<String,dynamic>  confirmedPaymentMethod={};
  Map<String,dynamic> paymentMethodSelected={};
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

  void onSelectRegion({required CurrencyModel? region}) {
    religionTextController.clear();
    emit(RegionSelectedState(region: region));
  }

  void onConfirmedPaymentMethod({required Map<String,dynamic> payment}) {
    emit(PaymentMethodConfirmedState(paymentMethod: payment));
  }
  void onSelectPaymentMethods({required Map<String,dynamic> payment}) {
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
}
