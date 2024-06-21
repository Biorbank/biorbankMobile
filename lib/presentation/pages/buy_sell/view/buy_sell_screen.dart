import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/buy_sell/view/widget/buy_tab_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({super.key});

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(20.h),
            CommonTabbar(
                backgroundContainerMargin: 0,
                selectedIndex: 0,
                length: 2,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.fill,
                isScrollable: false,
                labelTextBackgroundPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                labelColor: Theme.of(context).colorScheme.shadow,
                isShowBackgroundShadow: true,
                onTap: (index) {},
                tabController: tabController,
                tabList: const ['Buy', 'Sell']),
            Expanded(child: TabBarView(
              controller: tabController,
              children: const [BuyTabWidget(), SizedBox()]))
          ],
        ),
      );
    
  }
}
