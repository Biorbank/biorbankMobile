
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
        child: AppConstant.commonText('Chat page',
            color: Theme.of(context).colorScheme.shadow));
  }
}