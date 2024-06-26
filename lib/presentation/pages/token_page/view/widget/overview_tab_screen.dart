import 'package:biorbank/presentation/common/common_trade_action_widget.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/token_page/cubit/token_cubit.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interactive_chart/interactive_chart.dart';

import '../../../../../generated/assets.dart';
import 'mock_data/mock_data_list.dart';

class OverviewTabScreen extends StatelessWidget {
  final dynamic Function(int) onTap;
  final Function(String?) onChanged;
  final TokenCubit cubit;

  const OverviewTabScreen(
      {super.key,
      required this.cubit,
      required this.onTap,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstant.commonText("2, 508.98 USDT",
                            color: Theme.of(context).colorScheme.shadow,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                        Row(
                          children: [
                            Icon(
                              Icons.swap_vert_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                            AppConstant.commonText("\$3,376.57",
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                            width(10),
                            Icon(
                              Icons.arrow_drop_up,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                            ),
                            AppConstant.commonText("0.54%",
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      // onTap: ,
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        radius: 22,
                        child: SvgPicture.asset(
                          Assets.svgsSettingcon,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                height(16),
                Container(
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(0.5)),
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppConstant.commonText("${AppStrings.interval}: ",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      CommonDropdownWidget(
                        labelText: "1 day",
                        value: cubit.selectedValue,
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.shadow,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                        dropDownContentPadding: EdgeInsets.zero,
                        items: cubit.overviewItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
                height(32),
                SizedBox(
                  height: 200,
                  child: InteractiveChart(
                    candles: MockDataTesla.candleData,
                    style: ChartStyle(
                      volumeHeightFactor: 0,
                      timeLabelHeight: 20,
                      timeLabelStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 12),
                    ),
                  ),
                ),
                height(24),
                Row(
                  children: [
                    _buildChartResult(
                        name: AppStrings.hours24,
                        value: "0.54%",
                        foregroundColor: true,
                        context: context),
                    width(8),
                    _buildChartResult(
                        name: AppStrings.days7,
                        value: "10.08%",
                        foregroundColor: true,
                        context: context),
                    width(8),
                    _buildChartResult(
                        name: AppStrings.days30,
                        value: "3.06%",
                        foregroundColor: false,
                        context: context),
                    width(8),
                    _buildChartResult(
                        name: AppStrings.days90,
                        value: "19.54%",
                        foregroundColor: true,
                        context: context),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                spreadRadius: -2,
                blurRadius: 12,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: CommonTradeActionWidget(
            onTap: onTap,
            tradeOptionsList: cubit.tradeOptions,
            selectedOption: cubit.selectedOption,
            colorSelect: false,
          ),
        ),
      ],
    );
  }

  _buildChartResult(
      {required String name,
      required String value,
      required bool foregroundColor,
      required BuildContext context}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: Theme.of(context).colorScheme.onSecondaryFixed),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              AppConstant.commonText(
                name,
                color: Theme.of(context).colorScheme.shadow,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: foregroundColor
                        ? Theme.of(context).colorScheme.onInverseSurface
                        : Theme.of(context).colorScheme.error,
                  ),
                  AppConstant.commonText(
                    value,
                    color: foregroundColor
                        ? Theme.of(context).colorScheme.onInverseSurface
                        : Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
