import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_balance_widget.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/home/view/widget/chart_time_period_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/chart_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/share_detail_tab_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/common_trade_action_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().onTapeTradeActionOption(value: null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        if (state is TradeOptionChnageState) {
          cubit.selectedOption = state.value;
        } else if (state is ChartTimePeriodState) {
          cubit.selectedChartTimePeriod = state.value;
        }
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            Visibility(
                              visible: cubit.selectedOption == null,
                              child: BlocBuilder<CryptoDBRepositoryImpl,
                                  CryptoDBRepositoryState>(
                                builder: (context, state) {
                                  return CommonBalanceWidget(
                                    amount: '\$ ${state.totalPrice}',
                                    currentRate: 'CA \$0.00 (0.00%)',
                                    isShowBalanceWidget: false,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cubit.selectedOption == null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height(28.h),
                            ChartWidget(
                              timePeriod: cubit.selectedChartTimePeriod,
                            ),
                            height(14.h),
                            ChartTimePeriodWidget(
                              onTap: (index) {
                                cubit.onChangeChartTimePeriod(
                                    value: cubit.chartTimePeriod[index]);
                              },
                              chartTimePeriod: cubit.chartTimePeriod,
                              selectedChartTimePeriod:
                                  cubit.selectedChartTimePeriod,
                            ),
                          ],
                        ),
                      ),
                      height(cubit.selectedOption == null ? 30.h : 12.h),
                      CommonTradeActionWidget(
                        colorSelect: true,
                        onTap: (index) {
                          cubit.onTapeTradeActionOption(
                              value: cubit.tradeOptions[index]['type']);
                        },
                        tradeOptionsList: cubit.tradeOptions,
                        selectedOption: cubit.selectedOption,
                      ),
                      height(cubit.selectedOption == null ? 40.h : 12.h),
                    ],
                  ),
                ),
                Expanded(
                    child: cubit.getActionScreen(value: cubit.selectedOption))
              ],
            ),
            Visibility(
              visible: cubit.selectedOption == null,
              child: DraggableScrollableSheet(
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
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
