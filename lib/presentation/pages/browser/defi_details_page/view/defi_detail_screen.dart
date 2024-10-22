import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/loan_detail_tab.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/nft_detail_tab.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/risk_detail_widget.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/staking_detail_tab.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
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
    final cubit = context.read<DefiDetailCubit>();
    int currentSelection = cubit.selectedCurrentIndex == 0
        ? widget.index
        : cubit.selectedCurrentIndex;
    if (currentSelection == 2 && cubit.selectedCurrentIndex != 2) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (cubit.selectedCurrentIndex != 2) {
          cubit.selectedCurrentIndex = 2;
          AutoTabsRouter.of(context).setActiveIndex(0);
        }
      });
    } else if (cubit.selectedCurrentIndex != 0) {
      cubit.selectedCurrentIndex = 0;
    }
    tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: currentSelection == 2 ? currentSelection : 0);
    tabController.addListener(() {
      cubit.onChangeTabIndex(index: tabController.index);

      if (tabController.index == 2 && cubit.selectedLoanTabIndex == 1) {
        cubit.onChangeLoanTabIndex(index: currentSelection == 2 ? 1 : 0);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((t) {
      cubit.onChangeTabIndex(
          index: currentSelection == 2 ? 1 : cubit.selectedTabIndex);
      cubit.onChangeLoanTabIndex(index: currentSelection == 2 ? 1 : 0);
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
                    height(45.h),
                    CommonSearchAppbar(
                      hintText: 'ID/USDT',
                      textController: TextEditingController(),
                      onTapTextField: () {
                        context.router.push(const CommonSearchRoute());
                        //  Navigator.pushNamed(context, Routes.serachViewRoute);
                      },
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
                      labelFontWight: FontWeight.w400,
                      length: 3,
                      onTap: (index) {},
                      tabController: tabController,
                      tabList: const ['NFT', 'Staking', 'Loans']),
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
                  selectedIndex:
                      widget.index == 2 ? 1 : cubit.selectedLoanTabIndex,
                ),
              ]),
            )
          ],
        );
      },
    );
  }
}
