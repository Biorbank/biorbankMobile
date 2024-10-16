import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/home/view/widget/defi_tab_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/holding_tab_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/nfts_tab_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareDetailsTabWidget extends StatefulWidget {
  const ShareDetailsTabWidget({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<ShareDetailsTabWidget> createState() => _ShareDetailsTabWidgetState();
}

class _ShareDetailsTabWidgetState extends State<ShareDetailsTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      context.read<HomeCubit>().changeTabIndex(value: tabController.index);
    });
    WidgetsBinding.instance.addPostFrameCallback((t) {
      context.read<HomeCubit>().changeTabIndex(value: 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          controller: widget.scrollController,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height(10.h),
                Center(
                  child: Container(
                    height: 4.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
                height(20.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = context.read<HomeCubit>();
                    if (state is HomeTabIndexChangeState) {
                      cubit.tabIndex = state.index;
                    }
                    return CommonTabbar(
                      selectedIndex: cubit.tabIndex,
                      length: 3,
                      onTap: (index) {},
                      tabController: tabController,
                      tabList: const ['Holding', 'DeFi', 'NFTs'],
                      labelColor: Theme.of(context).colorScheme.shadow,
                      padding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      tabAlignment: TabAlignment.center,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      isShowBackgroundShadow: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            HoldingTabWidget(
              scrollController: widget.scrollController,
            ),
            DeFiTabWidget(scrollController: widget.scrollController),
            NFTsTabWidget(scrollController: widget.scrollController)
          ]),
        ),
      ],
    );
  }
}
