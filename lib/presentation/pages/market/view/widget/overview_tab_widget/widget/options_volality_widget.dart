import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsVolalityWidget extends StatelessWidget {
  const OptionsVolalityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, 4))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(5.h),
                Row(
                  children: [
                    AppConstant.commonText('BTC options volality',
                        fontSize: 12.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer),
                    width(8.w),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 13.h,
                      width: 13.w,
                    )
                  ],
                ),
                height(4.h),
                AppConstant.commonText('75.76',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
              ],
            ),
          ),
        ),
        width(15.w),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color:Theme.of(context).colorScheme.shadow.withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, 4))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(5.h),
                Row(
                  children: [
                    AppConstant.commonText('ETH options volality',
                        fontSize: 12.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer),
                    width(8.w),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 13.h,
                      width: 13.w,
                    )
                  ],
                ),
                height(4.h),
                AppConstant.commonText('88.76',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
