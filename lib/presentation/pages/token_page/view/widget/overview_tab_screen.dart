import 'package:biorbank/presentation/common/common_trade_action_widget.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/token_page/cubit/token_cubit.dart';
import 'package:biorbank/presentation/pages/token_page/cubit/token_state.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/assets.dart';

class OverviewTabScreen extends StatelessWidget {
  const OverviewTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      "1 day",
      "7 day",
      "15 day",
    ];
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
                            color: AppColors.black,
                            fontSize: 20.h,
                            fontWeight: FontWeight.w500),
                        Row(
                          children: [
                            Icon(
                              Icons.swap_vert_outlined,
                              color: AppColors.grey,
                            ),
                            AppConstant.commonText("\$3,376.57",
                                color: AppColors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            width(10),
                            Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.green,
                            ),
                            AppConstant.commonText("0.54%",
                                color: AppColors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      // onTap: ,
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey100,
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
                    border: Border.all(color: AppColors.grey.withOpacity(0.5)),
                    color: AppColors.blue20,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppConstant.commonText("${AppStrings.interval}: ",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey),
                      CommonDropdownWidget(
                        labelText: "1 day",
                        value: "1 day",
                        textStyle: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        dropDownContentPadding: EdgeInsets.zero,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (p0) {},
                      )
                    ],
                  ),
                ),
                height(32),
                Container(
                  height: 200,
                  color: Theme.of(context).colorScheme.primary,
                ),
                height(24),
                Row(
                  children: [
                    _buildChartResult(
                        name: AppStrings.hours24,
                        value: "0.54%",
                        foregroundColor: true),
                    width(8),
                    _buildChartResult(
                        name: AppStrings.days7,
                        value: "10.08%",
                        foregroundColor: true),
                    width(8),
                    _buildChartResult(
                        name: AppStrings.days30,
                        value: "3.06%",
                        foregroundColor: false),
                    width(8),
                    _buildChartResult(
                        name: AppStrings.days90,
                        value: "19.54%",
                        foregroundColor: true),
                  ],
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<TokenCubit, TokenState>(
          builder: (context, state) {
            final cubit = context.read<TokenCubit>();
            if (state is TradeOptionChnageState) {
              cubit.selectedOption = state.value;
            }
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.blue50,
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                    spreadRadius: -2,
                    blurRadius: 12,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: CommonTradeActionWidget(
                onTap: (index) {
                  cubit.onTapeTradeActionOption(
                      value: cubit.tradeOptions[index]['type']);
                },
                tradeOptionsList: cubit.tradeOptions,
                selectedOption: cubit.selectedOption,
                colorSelect: false,
              ),
            );
          },
        ),
      ],
    );
  }

  _buildChartResult(
      {required String name,
      required String value,
      required bool foregroundColor}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey100),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              AppConstant.commonText(
                name,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   Assets.imagesArrowDropDown,
                  //   color: foregroundColor ? AppColors.green : AppColors.red,
                  //   height: 14,
                  //   width: 14,
                  // ),
                  Icon(
                    Icons.arrow_drop_up,
                    color: foregroundColor ? AppColors.green : AppColors.red,
                  ),
                  AppConstant.commonText(
                    value,
                    color: foregroundColor ? AppColors.green : AppColors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
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
