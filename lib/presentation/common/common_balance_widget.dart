import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBalanceWidget extends StatelessWidget {
  const CommonBalanceWidget({super.key,required this.amount, required this.currentRate,required this.isShowBalanceWidget});
final String amount;
final String currentRate;
final bool isShowBalanceWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: isShowBalanceWidget,
          child: AppConstant.commonText('Balance',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
        height(isShowBalanceWidget?6.h:0),
        AppConstant.commonText(amount,
            fontSize: 32.sp, fontWeight: FontWeight.w600),
        height(8.h),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:currentRate,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onTertiary,
                    fontSize: 12.sp),
              ),
              WidgetSpan(
                child: width(10.w),
              ),
              TextSpan(
                text: 'past week',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 12.sp),
              ),
            ],
          ),
        )
      ],
    );
  }
}
