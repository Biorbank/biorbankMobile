import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/pages/defi/view/defi_view.dart';
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
            itemCount: 3,
            itemBuilder: (context, index) {
              String title;
              String currentAmt;
              String differentAmt;
              bool isProfit;
              bool isCollateral;
              String totalDifferentInPercentage;

              // Define values for each index
              if (index == 0) {
                title = 'Staking';
                currentAmt = '\$25,384.00';
                differentAmt = '+643.67';
                isProfit = true;
                totalDifferentInPercentage = '+1.23%';
                isCollateral = false;
              } else if (index == 1) {
                title = 'Loans';
                currentAmt = 'Collateral : \$1,200';
                differentAmt = 'Debit : \$400';
                isProfit = false;
                totalDifferentInPercentage = '';
                isCollateral = true;
              } else {
                title = 'Liquidity Providing (LP)';
                currentAmt = '\$34,030.00';
                differentAmt = '-643.67';
                isProfit = false;
                totalDifferentInPercentage = '-1.23%';
                isCollateral = false;
              }
              return GestureDetector(
                onTap: () {
                  switch(index) {
                    case 0:
                      context.router.push(StackingRoute());
                      break;
                    case 1:
                      context.router.push(DefiDetailRoute(index: index + 1));
                      break;
                    case 2:
                      context.router.push(DefiRoute());
                      break;
                  }
                  // AutoTabsRouter.of(context).setActiveIndex(6);
                },
                child: PriceDetailWidget(
                  title: title,
                  currentAmt: currentAmt,
                  differentAmt: differentAmt,
                  isProfit: isProfit,
                  totalDifferentInPercentage: totalDifferentInPercentage,
                  isCollateral: isCollateral,
                ),
              );
            }
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
