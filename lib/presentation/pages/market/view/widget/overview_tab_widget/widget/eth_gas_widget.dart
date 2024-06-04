import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/common_shadow_container.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ETHgasWidget extends StatelessWidget {
  const ETHgasWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
    
      child: Column(
        children: [
          Row(
            children: [
              AppConstant.commonText('ETH Gas',
                  fontSize: 12.sp,
                  color:
                      Theme.of(context).colorScheme.onSecondaryContainer),
              width(8.w),
              Image.asset(
                Assets.imagesInfo,
                height: 13.h,
                width: 13.w,
              )
            ],
          ),
          height(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstant.commonText('Slow',
                      fontSize: 12.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(4.h),
                  AppConstant.commonText('130 Gwei',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstant.commonText('Standard',
                      fontSize: 12.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(4.h),
                  AppConstant.commonText('130 Gwei',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstant.commonText('Fast',
                      fontSize: 12.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(4.h),
                  AppConstant.commonText('130 Gwei',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

