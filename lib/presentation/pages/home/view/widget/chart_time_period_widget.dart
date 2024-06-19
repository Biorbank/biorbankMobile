import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartTimePeriodWidget extends StatelessWidget {
  const ChartTimePeriodWidget({super.key,required this.onTap,required this.chartTimePeriod,required this.selectedChartTimePeriod});
final Function(int) onTap;
final List<String> chartTimePeriod;
final   String? selectedChartTimePeriod;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    chartTimePeriod.length,
                    (index) => GestureDetector(
                      onTap: () {
                       onTap(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: selectedChartTimePeriod ==
                                    chartTimePeriod[index]
                                ? Theme.of(context).colorScheme.onSurface
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(32)),
                        child: AppConstant.commonText(
                          chartTimePeriod[index],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: selectedChartTimePeriod ==
                                  chartTimePeriod[index]
                              ? Theme.of(context).colorScheme.shadow
                              : Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              width(14.w),
              Image.asset(
                Assets.imagesScanOutline,
                height: 20.h,
                width: 20.w,
              ),
            ],
          )
       
    );
  }
}
