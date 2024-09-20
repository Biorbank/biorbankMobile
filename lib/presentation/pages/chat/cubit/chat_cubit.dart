
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());


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