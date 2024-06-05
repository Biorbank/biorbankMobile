import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewFilters extends StatelessWidget {
  const OverviewFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<MarketCubit, MarketState>(
                builder: (context, state) {
                  var cubit = context.read<MarketCubit>();
                  if (state is OnChnageFilterState) {
                    cubit.selectedFilter = state.filter;
                  } else if (state is OnChangeTimeState) {
                    cubit.selectedTime = state.time;
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText('Filter',
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          )
                        ],
                      ),
                      height(12.h),
                      AppConstant.commonText('Network',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow),
                      height(6.h),
                      Wrap(
                        spacing: 8,
                        children: cubit.filterDataList
                            .map((e) => ChoiceChip(
                                selected: cubit.selectedFilter == e,
                                showCheckmark: false,
                                onSelected: (value) {
                                  cubit.onChangeFilter(value: e);
                                },
                                selectedColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                disabledColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                backgroundColor: cubit.selectedFilter == e
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                label: AppConstant.commonText(e,
                                    color: cubit.selectedFilter == e
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                    fontWeight: FontWeight.w500)))
                            .toList(),
                      ),
                      height(6.h),
                      AppConstant.commonText('Time',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow),
                      height(6.h),
                      Wrap(
                        spacing: 8,
                        children: cubit.timeDataList
                            .map((e) => ChoiceChip(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 28),
                                selected: cubit.selectedTime == e,
                                showCheckmark: false,
                                onSelected: (value) {
                                  cubit.onSelectTime(value: e);
                                },
                                selectedColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                disabledColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                backgroundColor: cubit.selectedTime == e
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                label: AppConstant.commonText(e,
                                    color: cubit.selectedTime == e
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                    fontWeight: FontWeight.w500)))
                            .toList(),
                      ),
                      height(10.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20,bottom: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(0, -4),
                    color: const Color(0xFF000000).withOpacity(0.12))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: CommonOutlinedButton(
                        height: 50,
                        borderColor: Theme.of(context).colorScheme.onPrimary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                        onTap: () {},
                        title: 'Reset')),
                width(20.w),
                Expanded(
                    child: SizedBox(
                      child: CommonButton(
                                        name: 'Confirm',
                                        onTap: () {},
                                      ),
                    ))
              ],
            ),
          ),
        ),
        
      ]),
    );
  }
}
