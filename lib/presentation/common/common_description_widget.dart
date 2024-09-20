import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonDescriptionWidget({required BuildContext context,required String description,double?fontSize}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: AppConstant.commonText('•',
            fontSize: 16.sp,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
      width(10.w),
      Expanded(
        child: AppConstant.commonText(
            description,
            fontSize: fontSize,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      )
    ],
  );
}
