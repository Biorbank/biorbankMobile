import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/coins_tab_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/overview_tab_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/filter_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/swap_tab_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketTabbar extends StatefulWidget {
  const MarketTabbar({super.key});

  @override
  State<MarketTabbar> createState() => _MarketTabbarState();
}

class _MarketTabbarState extends State<MarketTabbar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      context.read<MarketCubit>().onChangeTabIndex(index: tabController.index);
    });
    super.initState();
  }

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
                  child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                          indicatorColor:
                              Theme.of(context).colorScheme.onPrimary,
                          dividerHeight: 0,
                          onTap: (value) {},
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          labelPadding: const EdgeInsets.only(
                              bottom: 10, top: 6, right: 30),
                          controller: tabController,
                          isScrollable: true,
                          padding: const EdgeInsets.only(left: 20),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabAlignment: TabAlignment.start,
                          tabs: [
                            AppConstant.commonText('Overview',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 0
                                    ? FontWeight.w500
                                    : null),
                            AppConstant.commonText('Coins',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 1
                                    ? FontWeight.w500
                                    : null),
                            AppConstant.commonText('Swap',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 2
                                    ? FontWeight.w500
                                    : null),
                          ])),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      context: context,
                      builder: (context) => const OverviewFilters(),
                    );
                  },
                  child: Image.asset(
                    Assets.imagesFilter,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
                width(20.w)
              ],
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: const [
                OverviewWidget(),
                CoinsTabWidget(),
                SwapTabWidget()
              ]),
            )
          ],
        );
      },
    );
  }
}
