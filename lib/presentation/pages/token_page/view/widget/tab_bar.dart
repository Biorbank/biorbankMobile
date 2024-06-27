import 'package:biorbank/presentation/pages/token_page/view/widget/history_tab_screen.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/info_tab_screen.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/news_tab_screen.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/overview_tab_screen.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/social_tab_wdget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common_tabbar.dart';
import '../../cubit/token_cubit.dart';
import '../../cubit/token_state.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      context.read<TokenCubit>().onChangeTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCubit, TokenState>(
      builder: (context, state) {
        var cubit = context.read<TokenCubit>();
        if (state is TabBarIndexState) {
          cubit.selectedTabIndex = state.index;
        } else if (state is ChangeOverviewDropDown) {
          cubit.selectedValue = state.value;
        } else if (state is ChangeInfoDropDown1) {
          cubit.onChanged1Value = state.value;
        } else if (state is ChangeInfoDropDown2) {
          cubit.onChanged2Value = state.value;
        } else if (state is ExploreDropDownValueState) {
          cubit.selectedExplore = state.value;
        } else if (state is ChainDropDownValueState) {
          cubit.selectedChain = state.value;
        }
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonTabbar(
                        isShowBackground: true,
                        indicatorColor: Theme.of(context).colorScheme.onPrimary,
                        labelPadding: const EdgeInsets.only(
                            bottom: 10, top: 6, right: 30),
                        isScrollable: true,
                        padding: const EdgeInsets.only(left: 20),
                        tabBarIndicatorSize: TabBarIndicatorSize.label,
                        tabAlignment: TabAlignment.start,
                        selectedIndex: cubit.selectedTabIndex,
                        labelFontWight: FontWeight.w500,
                        length: 5,
                        onTap: (index) {},
                        tabController: tabController,
                        tabList: const [
                          'Overview',
                          'Info',
                          'Social',
                          'History',
                          'News'
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    OverviewTabScreen(
                      cubit: cubit,
                      onTap: (index) {
                        cubit.onTapeTradeActionOption(
                            value: cubit.tradeOptions[index]['type']);
                      },
                      onChanged: (value) {
                        cubit.changeOverviewDropDown(value: value ?? '');
                      },
                    ),
                    InfoTabScreen(
                      cubit: cubit,
                      onChanged1: (value) {
                        cubit.changeInfoDropDown1(value: value);
                      },
                      onChanged2: (value) {
                        cubit.changeInfoDropDown2(value: value);
                      },
                    ),
                    SocialTabWdget(
                      tokenCubit: cubit,
                      onChangedChain: (chain) {
                        cubit.changeChainDropDown(value: chain ?? '');
                      },
                      onChangedExplores: (explore) {
                        cubit.changeExploreDropDown(value: explore ?? '');
                      },
                    ),
                    const HistoryTabScreen(),
                    const NewsTabScreen(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
