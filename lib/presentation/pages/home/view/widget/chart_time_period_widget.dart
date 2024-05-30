import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartTimePeriodWidget extends StatelessWidget {
  const ChartTimePeriodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
            if (state is ChartTimePeriodState) {
          cubit.selectedChartTimePeriod = state.value;
        }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    cubit.chartTimePeriod.length,
                    (index) => GestureDetector(
                      onTap: () {
                        cubit.onChangeChartTimePeriod(
                            value: cubit.chartTimePeriod[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: cubit.selectedChartTimePeriod ==
                                    cubit.chartTimePeriod[index]
                                ? Theme.of(context).colorScheme.onSurface
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(32)),
                        child: AppConstant.commonText(
                          cubit.chartTimePeriod[index],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: cubit.selectedChartTimePeriod ==
                                  cubit.chartTimePeriod[index]
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
          );
        },
      ),
    );
  }
}
