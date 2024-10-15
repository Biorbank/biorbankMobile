import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/borrow_tab_widget.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/repay_tab_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoanDetailTab extends StatefulWidget {
  const LoanDetailTab({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  State<LoanDetailTab> createState() => _LoanDetailTabState();
}

class _LoanDetailTabState extends State<LoanDetailTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: widget.selectedIndex);
    tabController.addListener(() {
      context
          .read<DefiDetailCubit>()
          .onChangeLoanTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height(15.h),
        CommonTabbar(
            selectedIndex: widget.selectedIndex,
            length: 2,
            padding:const EdgeInsets.symmetric(horizontal: 8),
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            labelTextBackgroundPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            labelColor: Theme.of(context).colorScheme.shadow,
            isShowBackgroundShadow: true,
            onTap: (index) {},
            tabController: tabController,
            tabList: const ['Borrow', 'Repay']),

          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                BorrowTabWidget(),
                RepayTabWidget(),
              ]),
          )  
      ],
    );
  }
}
