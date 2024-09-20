import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapDescriptionDialog extends StatelessWidget {
  const SwapDescriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(18.h),
              AppConstant.commonText(AppStrings.transactionDescription,
                  fontSize: 12.sp, color: Theme.of(context).colorScheme.shadow),
                                height(14.h),
                 Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:AppStrings.warning,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 12.sp),
              ),
              WidgetSpan(
                child: width(5.w),
              ),
              TextSpan(
                text: AppStrings.warningDescription,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 12.sp),
              ),
            ],
          ),
        ),              height(14.h),

            ]),
      ),
    );
  }
}
