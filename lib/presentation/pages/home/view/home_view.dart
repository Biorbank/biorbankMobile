import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_balance_widget.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/home/view/widget/chart_time_period_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/chart_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/share_detail_tab_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/trade_action_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
@RoutePage()

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CommonBlueContainer(
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
                      onTapTextField: () {
                        context.router.push(const CommonSearchRoute());
                      //  Navigator.pushNamed(context, Routes.serachViewRoute);
                      },
                    ),
                    height(10.h),
                    const CommonBalanceWidget(
                      amount: '\$75,630.90',
                      currentRate: 'CA \$0.00 (0.00%)',
                      isShowBalanceWidget: false,
                    )
                  ],
                ),
              ),
              height(28.h),
              const ChartWidget(),
              height(14.h),
              const ChartTimePeriodWidget(),
              height(30.h),
              const TradeActionWidget()
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 0.7,
          builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: ShareDetailsTabWidget(
                scrollController: scrollController,
              )),
        )
      ],
    );
  }
}
