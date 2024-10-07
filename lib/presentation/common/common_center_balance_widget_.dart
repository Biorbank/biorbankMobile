import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../../utils/app_widgets.dart';
import '../../utils/common_spacer.dart';

class CommonCenterBalanceWidget extends StatelessWidget {
  final String amount;
  const CommonCenterBalanceWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildArrow(context: context, icon: Assets.imagesBackArrow),
        const Spacer(),
        Column(
          children: [
            AppConstant.commonText(
              "Balance",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer,
            ),
            AppConstant.commonText(
             amount,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Row(
              children: [
                AppConstant.commonText(
                  "All Account",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                width(4),
                _buildArrow(
                  context: context,
                  icon: Assets.imagesArrowDownOutline,
                  height: 16.h,
                  width: 16.w,
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        _buildArrow(
            context: context, icon: Assets.imagesArrowRight),
      ],
    );
  }
  _buildArrow(
      {required BuildContext context,
        required String icon,
        double? height,
        double? width}) {
    return Image.asset(
      icon,
      height: height ?? 24.h,
      width: width ?? 24.w,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
