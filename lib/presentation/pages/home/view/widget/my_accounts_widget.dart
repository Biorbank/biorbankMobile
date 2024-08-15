import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/home/view/widget/asset_page_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../utils/common_spacer.dart';
import '../../../../common/common_blue_container.dart';
import '../../cubit/home_cubit.dart';

class MyAccountsWidget extends StatelessWidget {
  const MyAccountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return Column(
      children: [
        CommonBlueContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(40.h),
                CommonSearchAppbar(
                  hintText: 'ID/USDT',
                ),
                height(10.h),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              height(10.h),
              Row(
                children: [
                  AppConstant.commonText(
                    "My Accounts",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                ],
              ),
              height(10.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssetPageWidget(),
                    ),
                  );
                },
                child: _buildContainer(
                  context: context,
                  child: _buildContainerData(
                    context: context,
                    percent: cubit.percent,
                    title: "All Accounts",
                    currentAmt: "USD \$53,186.00",
                    differentAmt: "+643.67",
                    totalDifferentInPercentage: "+1.23%",
                    isProfit: true,
                  ),
                ),
              ),
              height(26),
              _buildContainer(
                context: context,
                child: Column(
                  children: [
                    _buildContainerData(
                      context: context,
                      percent: cubit.myAccountData[0].percent ?? 0.0,
                      title: cubit.myAccountData[0].title ?? "",
                      currentAmt: cubit.myAccountData[0].currentAmt ?? "",
                      differentAmt: cubit.myAccountData[0].differentAmt ?? "",
                      totalDifferentInPercentage:
                          cubit.myAccountData[0].totalDifferentInPercentage ??
                              "",
                      isProfit: cubit.myAccountData[0].isProfit ?? false,
                      arrowWidget: Row(
                        children: [
                          width(10),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AppConstant.commonDivider(
                        color: Theme.of(context).colorScheme.onSecondaryFixed,
                      ),
                    ),
                    _buildContainerData(
                      context: context,
                      percent: cubit.myAccountData[1].percent ?? 0.0,
                      title: cubit.myAccountData[1].title ?? "",
                      currentAmt: cubit.myAccountData[1].currentAmt ?? "",
                      differentAmt: cubit.myAccountData[1].differentAmt ?? "",
                      totalDifferentInPercentage:
                          cubit.myAccountData[1].totalDifferentInPercentage ??
                              "",
                      isProfit: cubit.myAccountData[1].isProfit ?? false,
                      arrowWidget: Row(
                        children: [
                          width(10),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildContainerData({
    required BuildContext context,
    required double percent,
    required String title,
    required String currentAmt,
    required String differentAmt,
    required String totalDifferentInPercentage,
    required bool isProfit,
    Widget? arrowWidget,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstant.commonText(title,
                  color: Theme.of(context).colorScheme.shadow,
                  fontWeight: FontWeight.w600),
              height(14),
              LinearPercentIndicator(
                backgroundColor: Theme.of(context).colorScheme.onSecondaryFixed,
                percent: percent,
                barRadius: const Radius.circular(4),
                alignment: MainAxisAlignment.start,
                progressColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
        width(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                    color: isProfit
                        ? const Color(0xFFE5FAEE)
                        : const Color(0xFFFDEBEC),
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
        arrowWidget ?? const SizedBox.shrink(),
      ],
    );
  }

  _buildContainer({required BuildContext context, required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.12),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
