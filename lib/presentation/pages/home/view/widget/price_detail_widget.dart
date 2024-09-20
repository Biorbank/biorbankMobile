import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceDetailWidget extends StatelessWidget {
  const PriceDetailWidget(
      {super.key,
      required this.title,
      required this.currentAmt,
      required this.differentAmt,
      required this.totalDifferentInPercentage,
      required this.isProfit});
  final String title;
  final String currentAmt;
  final String differentAmt;
  final String totalDifferentInPercentage;
  final bool isProfit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                color: const Color(0xFFAAAAAA).withOpacity(0.15),
                offset: const Offset(2, 4))
          ]),
      child: Row(
        children: [
          Expanded(
            child: AppConstant.commonText(title,
                color: Theme.of(context).colorScheme.shadow,
                fontWeight: FontWeight.w600),
          ),
          Column(
            children: [
              AppConstant.commonText(currentAmt,
                  color: Theme.of(context).colorScheme.shadow,
                  fontWeight: FontWeight.w600),
              height(6.h),
              Row(
                children: [
                  AppConstant.commonText(differentAmt,
                      color: isProfit
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : Theme.of(context).colorScheme.error,
                      fontSize: 11.sp),
                  width(6.w),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      color:  isProfit
                          ?const Color(0xFFE5FAEE):const Color(0xFFFDEBEC),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: AppConstant.commonText(
                      totalDifferentInPercentage,
                      fontSize: 10.sp,
                      color: isProfit
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
          width(10.w),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          )
        ],
      ),
    );
  }
}
