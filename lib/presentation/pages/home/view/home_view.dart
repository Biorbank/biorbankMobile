import 'package:biorbank/presentation/common/common_Search_appbar.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/home/view/widget/chart_time_period_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/chart_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/share_detail_tab_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/trade_action_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      transform: const GradientRotation(6),
                      stops: const [
                    0.3,
                    1
                  ],
                      colors: [
                    const Color(0xFF2E31B7),
                    Theme.of(context).colorScheme.primary,
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(40.h),
                        CommonSearchAppbar(
                          hintText: 'ID/USDT',
                          textController:
                              context.read<HomeCubit>().searchController,
                        ),
                        height(10.h),
                        AppConstant.commonText('\$147,044.07',
                            fontSize: 32.sp, fontWeight: FontWeight.w600),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'CA \$0.00 (0.00%)   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    fontSize: 12.sp),
                              ),
                              TextSpan(
                                text: 'past week',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  height(14.h),
                  const ChartWidget(),
                  height(14.h),
                  const ChartTimePeriodWidget(),
                  height(30.h),
                  const TradeActionWidget()
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200.h,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15),
                child:  ShareDetailsTabWidget(),
              )),
        )
      ],
    );
  }
}
