import 'package:biorbank/presentation/pages/market/view/widget/circle_painter.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketDetailsWidget extends StatelessWidget {
  const MarketDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 4),
                color: const Color(0xFF000000).withOpacity(0.12))
          ]),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppConstant.commonText('Market Cap',
                      fontSize: 12.sp, maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(6.h),
                  AppConstant.commonText('\$1.00T',
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  height(6.h),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5FAEE),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: AppConstant.commonText(
                      '+1.23%',
                      fontSize: 10.sp, maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.onSecondaryFixed,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppConstant.commonText('Volume',
                      fontSize: 12.sp,
                       maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(6.h),
                  AppConstant.commonText('\$1.00B',
                      fontSize: 16.sp,
                       maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  height(6.h),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5FAEE),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: AppConstant.commonText(
                      '+1.23%', maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      fontSize: 10.sp,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.onSecondaryFixed,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppConstant.commonText('Dominance',
                      fontSize: 12.sp, maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(6.h),
                  AppConstant.commonText('10.00%',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  height(6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                          height: 16.h,
                          width: 16.w,
                          placeholder: (context, url) =>
                              const SizedBox.shrink()),
                      width(8.w),
                      AppConstant.commonText('BTC',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ],
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.onSecondaryFixed,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppConstant.commonText('Dominance',
                      fontSize: 12.sp, maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer),
                  height(6.h),
                  Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 43.w,
                      height: 43.h,
                      child: CustomPaint(
                        painter: CirclePainter(
              value: 65,
              maxValue: 100,
              color: Theme.of(context).colorScheme.onPrimary,
              gradientColors: [
                const Color(0xFF2E31B7),
                const Color(0xFF1C1460)
              ],
                        ),
                      ),
                    ),
                    AppConstant.commonText('65',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.shadow)
                  ],
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


