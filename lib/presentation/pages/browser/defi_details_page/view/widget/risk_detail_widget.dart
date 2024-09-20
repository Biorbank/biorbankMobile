import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiskDetailsWidget extends StatelessWidget {
  const RiskDetailsWidget({
    super.key,
    required this.onTapRiskButton,
    this.margin
  });
final VoidCallback onTapRiskButton;
final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin:margin?? const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryFixed)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.imagesInfoFilled,
                height: 20.h,
                width: 20.w,
              ),
              width(10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstant.commonText(
                        'Lending feature is experimental.',
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer),
                    height(6.h),
                    GestureDetector(
                      onTap:onTapRiskButton ,
                      child: Row(
                        children: [
                          AppConstant.commonText('Understand the risks',
                              fontSize: 12.sp,
                              color:
                                  Theme.of(context).colorScheme.onPrimary),
                          width(6.w),
                          Transform.rotate(
                            angle: 1.54,
                            child: Image.asset(
                              Assets.imagesArrowUp,
                              height: 14.h,
                              width: 14.w,
                              color:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
