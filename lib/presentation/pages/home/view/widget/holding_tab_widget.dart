import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoldingTabWidget extends StatelessWidget {
  const HoldingTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height(15.h),
        Row(
          children: [
            AppConstant.commonText('My Accounts',
                color: Theme.of(context).colorScheme.shadow,
                fontSize: 16,
                fontWeight: FontWeight.w600)
          ],
        ),
      ],
    );
  }
}
