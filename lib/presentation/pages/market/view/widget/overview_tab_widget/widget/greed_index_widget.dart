import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/market/view/widget/circle_painter.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/overview_chart.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreedIndexWidget extends StatelessWidget {
  const GreedIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: commonWidget(
                  isCenter: true,
                  context: context,
                  title: 'Feer & Greed Index',
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 80.w,
                        height: 80.h,
                        child: CustomPaint(
                          painter: CirclePainter(
                            value: 65,
                            thumbRadius: 5,
                            strokeWidth: 7,
                            maxValue: 100,
                            color: Theme.of(context).colorScheme.onPrimary,
                            gradientColors: [
                              const Color(0xFF2E31B7),
                              const Color(0xFF1C1460)
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          height(6.h),
                          AppConstant.commonText('65',
                              fontWeight: FontWeight.w500,
                              fontSize: 24.sp,
                              color: Theme.of(context).colorScheme.shadow),
                          AppConstant.commonText('Extreme\nGreed',
                              fontWeight: FontWeight.w500,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              fontSize: 10.sp,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: commonWidget(
                    context: context,
                    title: 'Total Volume',
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppConstant.commonText('\$100B',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow),
                            width(5),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_drop_up_rounded,
                                  size: 26,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface,
                                ),
                                AppConstant.commonText('0.54%',
                                    fontSize: 12.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onInverseSurface)
                              ],
                            )
                          ],
                        ),
                        // height(10.h),
                        const SizedBox(
                          height: 80,
                          child: OverViewLineChart(),
                        ),
                      ],
                    )),
              )
            ],
          );
  }
    Widget commonWidget(
      {required BuildContext context,
      required String title,
      bool isCenter = false,
      required Widget child}) {
    return Container(
      height: 133.h,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                spreadRadius: 0,
                color: const Color(0xFF000000).withOpacity(0.12),
                offset: const Offset(0, 4))
          ]),
      child: Column(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          height(5.h),
          Row(
            children: [
              AppConstant.commonText(title,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              width(8.w),
              Image.asset(
                Assets.imagesArrowRight,
                height: 13.h,
                width: 13.w,
              )
            ],
          ),
          height(10.h),
          child
        ],
      ),
    );
  }

}