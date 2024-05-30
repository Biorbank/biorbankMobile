import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AppConstant.commonText('Market page',
            color: Theme.of(context).colorScheme.shadow));
  }
}
