import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/pages/home/view/widget/common_add_account_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/price_detail_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeFiTabWidget extends StatelessWidget {
  const DeFiTabWidget({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          height(15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                AppConstant.commonText('Defi',
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                width(15.h),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                )
              ],
            ),
          ),
          height(14.h),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => height(10.h),
            itemCount: 2,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.router.push(DefiDetailRoute(index: index+1));
               // AutoTabsRouter.of(context).setActiveIndex(6);
              },
              child: PriceDetailWidget(
                title: index == 0 ? 'Staking' : 'Liquidity Providing (LP)',
                currentAmt: '\$74,200.00',
                differentAmt: index == 0 ? '+643.67' : '-643.67',
                isProfit: index == 0,
                totalDifferentInPercentage: index == 0 ? '+1.23%' : '-1.23%',
              ),
            ),
          ),
          height(15.h),
          AddAccountWidget(
            onTap: () {},
          )
        ],
      ),
    );
  }
}
