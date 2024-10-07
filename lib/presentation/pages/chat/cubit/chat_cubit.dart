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

  clearController(){
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
}
