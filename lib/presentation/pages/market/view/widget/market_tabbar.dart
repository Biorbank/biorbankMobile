import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/coins_tab_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/overview_tab_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/filter_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/swap_tab_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketTabbar extends StatefulWidget {
  final TabController tabController;

  const MarketTabbar({super.key, required this.tabController});

  @override
  State<MarketTabbar> createState() => _MarketTabbarState();
}

class _MarketTabbarState extends State<MarketTabbar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        var cubit = context.read<MarketCubit>();
        if (state is ChangeTabBarIndexState) {
          cubit.selectedTabIndex = state.index;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonTabbar(
                    isShowBackground: true,
                    indicatorColor: Theme.of(context).colorScheme.onPrimary,
                    labelPadding:
                        const EdgeInsets.only(bottom: 10, top: 6, right: 30),
                    isScrollable: true,
                    padding: const EdgeInsets.only(left: 20),
                    tabBarIndicatorSize: TabBarIndicatorSize.label,
                    tabAlignment: TabAlignment.start,
                    selectedIndex: cubit.selectedTabIndex,
                    labelFontWight: FontWeight.w500,
                    length: 3,
                    onTap: (index) {},
                    tabController: widget.tabController,
                    tabList: const ['Coins', 'Swap', 'Overview'],
                  ),
                ),
                cubit.selectedTabIndex == 1
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            context: context,
                            builder: (context) => const OverviewFilters(),
                          );
                        },
                        child: Image.asset(
                          Assets.imagesFilter,
                          height: 20.h,
                          width: 20.w,
                        ),
                      )
                    : const SizedBox.shrink(),
                width(20.w)
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: widget.tabController,
                children: const [
                  CoinsTabWidget(),
                  SwapTabWidget(),
                  OverviewWidget(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
