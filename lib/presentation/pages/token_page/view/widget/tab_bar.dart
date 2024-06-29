import 'package:biorbank/presentation/pages/token_page/view/widget/social_tab_wdget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common_tabbar.dart';
import '../../cubit/token_cubit.dart';
import 'history_tab_screen.dart';
import 'info_tab_screen.dart';
import 'news_tab_screen.dart';
import 'overview_tab_screen.dart';

class TabBarViewScreen extends StatefulWidget {
  final TokenCubit cubit;
  final Function(dynamic) onChanged1;
  final Function(dynamic) onChanged2;
  final dynamic Function(int) onTapOverView;
  final Function(String?) onChangedOverView;
  final Function(String?) onChangedExplores;
  final Function(String?) onChangedChain;

  const TabBarViewScreen({
    super.key,
    required this.cubit,
    required this.onChanged1,
    required this.onChanged2,
    required this.onTapOverView,
    required this.onChangedOverView,
    required this.onChangedChain,
    required this.onChangedExplores,
  });

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTabbar(
          isShowBackground: true,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          labelPadding: const EdgeInsets.only(bottom: 10, top: 6, right: 30),
          isScrollable: true,
          padding: const EdgeInsets.only(left: 20),
          tabBarIndicatorSize: TabBarIndicatorSize.label,
          tabAlignment: TabAlignment.start,
          selectedIndex: widget.cubit.selectedTabIndex,
          labelFontWight: FontWeight.w500,
          length: 5,
          onTap: (index) {},
          tabController: tabController,
          tabList: const ['Overview', 'Info', 'Social', 'History', 'News'],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              OverviewTabScreen(
                cubit: widget.cubit,
                onTap: widget.onTapOverView,
                onChanged: widget.onChangedOverView,
              ),
              InfoTabScreen(
                cubit: widget.cubit,
                onChanged1: widget.onChanged1,
                onChanged2: widget.onChanged2,
              ),
              SocialTabWdget(
                onChangedChain: widget.onChangedChain,
                onChangedExplores: widget.onChangedExplores,
                tokenCubit: widget.cubit,
              ),
              const HistoryTabScreen(),
              const NewsTabScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
