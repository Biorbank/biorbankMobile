import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/loan_detail_tab.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/nft_detail_tab.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/risk_detail_widget.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/staking_detail_tab.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DefiDetailScreen extends StatefulWidget {
  const DefiDetailScreen({super.key, required this.index});
  final int index;
  @override
  State<DefiDetailScreen> createState() => _DefiDetailScreenState();
}

class _DefiDetailScreenState extends State<DefiDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.index);
    tabController.addListener(() {
      context
          .read<DefiDetailCubit>()
          .onChangeTabIndex(index: tabController.index);
        
      if (tabController.index == 2&& context.read<DefiDetailCubit>().selectedLoanTabIndex==1) {
        context.read<DefiDetailCubit>().onChangeLoanTabIndex(index: 0);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((t) {
      context.read<DefiDetailCubit>().onChangeTabIndex(index: widget.index);
      context.read<DefiDetailCubit>().onChangeLoanTabIndex(index: 0);
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
    return BlocBuilder<DefiDetailCubit, DefiDetailState>(
      builder: (context, state) {
        var cubit = context.read<DefiDetailCubit>();
        if (state is DefiDetailTabIndexChange) {
          cubit.selectedTabIndex = state.index;
        } else if (state is DefiDetailLoanTabIndexChange) {
          cubit.selectedLoanTabIndex = state.index;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBlueContainer(
              height: 120.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(35.h),
                    CommonSearchAppbar(
                      hintText: 'ID/USDT',
                      onTapBellIcon: () {},
                      textController: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            Visibility(
              visible: cubit.selectedTabIndex == 2,
              child: RiskDetailsWidget(
                onTapRiskButton: () {},
              ),
            ),
            height(8.h),
            Row(
              children: [
                Expanded(
                  child: DefaultTabController(
                      length: 3,
                      child: TabBar(
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
                            AppConstant.commonText('NFT',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 0
                                    ? FontWeight.w500
                                    : null),
                            AppConstant.commonText('Staking',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 1
                                    ? FontWeight.w500
                                    : null),
                            AppConstant.commonText('Loans',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 2
                                    ? FontWeight.w500
                                    : null),
                          ])),
                ),
                GestureDetector(
                  onTap: () {},
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
              child: TabBarView(controller: tabController, children: [
                const NftDetailTab(),
                const StakingDetailTab(),
                LoanDetailTab(
                  selectedIndex: cubit.selectedLoanTabIndex,
                ),
              ]),
            )
          ],
        );
      },
    );
  }
}
