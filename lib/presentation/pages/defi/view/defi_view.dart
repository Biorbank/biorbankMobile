
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class DefiView extends StatelessWidget {
  const DefiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AppConstant.commonText('Defi page',color: Theme.of(context).colorScheme.shadow));
  }
}