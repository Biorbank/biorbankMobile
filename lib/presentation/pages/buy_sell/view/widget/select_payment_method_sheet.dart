import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPaymentMethodSheet extends StatelessWidget {
  const SelectPaymentMethodSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Select payment method',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                )
              ],
            ),
            height(20.h),
            ListView.separated(
              separatorBuilder: (context, index) => height(15.h),
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => paymentCard(context: context),
            ),
            height(14.h),
            CommonButton(
              name: 'Confirm',
              onTap: () {},
            ),
            height(14.h),
          ],
        ),
      ),
    );
  }

  Widget paymentCard({required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
              color: Theme.of(context).colorScheme.onPrimaryContainer)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png',
                    height: 24.h,
                    width: 24.w,
                    placeholder: (context, url) => const SizedBox.shrink(),
                  ),
                  width(8.w),
                  AppConstant.commonText('Google Pay',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              CachedNetworkImage(
                imageUrl:
                    'https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png',
                height: 20.h,
                width: 20.w,
                placeholder: (context, url) => const SizedBox.shrink(),
              ),
            ],
          ),
          height(8.h),
          Row(
            children: [
              Image.asset(
                Assets.imagesClock,
                height: 18.h,
                width: 18.w,
              ),
              width(6.w),
              AppConstant.commonText('Instant',
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              width(6.w),
              AppConstant.commonText('•',
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              width(6.w),
              Text.rich(TextSpan(
                  text: '\$',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.onPrimary),
                  children: [
                    WidgetSpan(child: width(4.w)),
                    TextSpan(
                        text: '\$',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer)),
                    WidgetSpan(child: width(4.w)),
                    TextSpan(
                        text: '\$',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer)),
                  ])),
              width(8.w),
              AppConstant.commonText('lowest buy limit',
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            ],
          )
        ],
      ),
    );
  }
}
