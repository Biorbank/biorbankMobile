import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeActionWidget extends StatelessWidget {
  const TradeActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is TradeOptionChnageState) {
              cubit.selectedOption = state.value;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                cubit.tradeOptions.length,
                (index) => GestureDetector(
                  onTap: () {
                    cubit.onTapeTradeActionOption(
                        value: cubit.tradeOptions[index]['title']);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cubit.selectedOption ==
                                    cubit.tradeOptions[index]['title']
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.2)),
                        child: Image.asset(cubit.tradeOptions[index]['icon'],
                            color: cubit.selectedOption ==
                                    cubit.tradeOptions[index]['title']
                                ? Theme.of(context).colorScheme.shadow
                                : null),
                      ),
                      height(8.h),
                      AppConstant.commonText(cubit.tradeOptions[index]['title'],
                          color: Theme.of(context).colorScheme.onSurface)
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
