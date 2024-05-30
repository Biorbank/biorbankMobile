

import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class BrowserView extends StatelessWidget {
  const BrowserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AppConstant.commonText('Browser page',
            color: Theme.of(context).colorScheme.shadow));
  }
}