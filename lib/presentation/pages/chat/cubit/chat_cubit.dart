import 'package:biorbank/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final chatController = TextEditingController();
  final moneyController = TextEditingController();
  final moneyMsgController = TextEditingController();

  ValueNotifier<bool> keyboardVisible = ValueNotifier<bool>(false);

  final List<String> numberKeys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    'delete',
  ];

  clearController() {
    moneyController.clear();
    moneyMsgController.clear();
  }

  void onKeyTap(String key) {
    if (key == 'delete') {
      final currentText = moneyController.text;
      final cursorPosition = moneyController.selection.baseOffset;

      if (cursorPosition > 0) {
        final newText =
        currentText.replaceRange(cursorPosition - 1, cursorPosition, '');

        moneyController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: cursorPosition - 1),
        );
      }
    } else {
      final currentText = moneyController.text;
      final cursorPosition = moneyController.selection.baseOffset;
      final newText =
      currentText.replaceRange(cursorPosition, cursorPosition, key);

      moneyController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPosition + 1),
      );
    }
  }

  final List<Map<String, String>> sendMoneyTypeList = [
    {
      "img": Assets.imagesBank,
      "title": "Wire Transfer",
      "subTitle": "Send a Wire Transfer",
    },
    {
      "img": Assets.imagesDebitCard,
      "title": "Bank Deposite",
      "subTitle": "Send funds to their bank account",
    },
    {
      "img": Assets.imagesCryptoAddress,
      "title": "Crypto Address",
      "subTitle": "Send crypto",
    },
  ];

  final List<Map<String, String>> chatData = [
    {
      "type": "date",
      "date": "9 Jul 2023",
    },
    {
      "isSentByMe": "false",
      "message": "Requested",
      "time": "20:07",
      "amount": "13.00",
      "status": "",
    },
    {
      "isSentByMe": "true",
      "message": "sent",
      "time": "20:07",
      "amount": "25.74",
      "status": "",
    },
    {
      "isSentByMe": "false",
      "message": "Thank You!",
      "time": "20:08",
      "amount": "",
      "status": "",
    },
  ];

  List<Map<String, String>> blockchainList = [
    {
      "img": "assets/img/cryptoicon/1.png",
      "name": "Bitcoin",
      "address": "bc1qxy2kgdygjrsqtzq2n0yrAd...0wlh",
    },
    {
      "img": "assets/img/cryptoicon/2.png",
      "name": "Litecoin",
      "address": "ltc1qxy2kgdygjrsqtzq2n0yrAd...0wlh",
    },
    {
      "img": "assets/img/cryptoicon/1027.png",
      "name": "Ethereum",
      "address": "0x32Be343B94f860124dC...102D88",
    },
    {
      "img": "assets/img/cryptoicon/1839.png",
      "name": "Binance",
      "address": "0x32Be343B94f860124dC...102D88",
    },
    {
      "img": "assets/img/cryptoicon/3794.png",
      "name": "Cosmos",
      "address": "cosmos1xy2kgdygjrsqtzq2n...0wlh",
    },
  ];
  List<Map<String, String>> blockchainListForNetwork = [
    {
      "img": "assets/img/cryptoicon/1.png",
      "name": "Bitcoin",
      "symbol": "BTC",
    },
    {
      "img": "assets/img/cryptoicon/2.png",
      "name": "Litecoin",
      "symbol": "LTC",
    },
    {
      "img": "assets/img/cryptoicon/1027.png",
      "name": "Ethereum",
      "symbol": "ETH",
    },
    {
      "img": "assets/img/cryptoicon/1839.png",
      "name": "Binance",
      "symbol": "BNB",
    },
    {
      "img": "assets/img/cryptoicon/3794.png",
      "name": "Cosmos",
      "symbol": "ATOM",
    },
  ];
}
