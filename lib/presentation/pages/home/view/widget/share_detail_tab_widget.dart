import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/home/view/widget/holding_tab_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareDetailsTabWidget extends StatefulWidget {
  const ShareDetailsTabWidget({super.key});

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeTabIndexChangeState) {
          cubit.tabIndex = state.index;
        }
        return Column(
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
            DefaultTabController(
              length: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicatorColor: AppColors.transparent,
                  onTap: (value) {},
                  tabs: [
                    Container(
                      decoration: cubit.tabIndex == 0
                          ? BoxDecoration(
                              color: AppColors.blue50,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFAAAAAA)
                                        .withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 40,
                                    offset: const Offset(2, 4),
                                  ),
                                ])
                          : null,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: AppConstant.commonText('Holding',
                          fontWeight: cubit.tabIndex == 0
                              ? FontWeight.w600
                              : FontWeight.w500),
                    ),
                    Container(
                      decoration: cubit.tabIndex == 1
                          ? BoxDecoration(
                              color: AppColors.blue50,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFAAAAAA)
                                        .withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 40,
                                    offset: const Offset(2, 4),
                                  ),
                                ])
                          : null,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: AppConstant.commonText('DeFi',
                          fontWeight: cubit.tabIndex == 1
                              ? FontWeight.w600
                              : FontWeight.w500),
                    ),
                    Container(
                      decoration: cubit.tabIndex == 2
                          ? BoxDecoration(
                              color: AppColors.blue50,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFAAAAAA)
                                        .withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 40,
                                    offset: const Offset(2, 4),
                                  ),
                                ])
                          : null,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: AppConstant.commonText('NFTs',
                          fontWeight: cubit.tabIndex == 2
                              ? FontWeight.w600
                              : FontWeight.w500),
                    ),
                  ],
                  labelColor: Theme.of(context).colorScheme.shadow,
                  unselectedLabelColor: const Color(0XFF757575),
                  padding: EdgeInsets.zero,
                  controller: tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                HoldingTabWidget(),
               
                Center(
                    child: AppConstant.commonText('DeFi',
                        color: Theme.of(context).colorScheme.shadow)),
                Center(
                    child: AppConstant.commonText('NFTs',
                        color: Theme.of(context).colorScheme.shadow)),
              ]),
            ),
          ],
        );
      },
    );
  }
}
