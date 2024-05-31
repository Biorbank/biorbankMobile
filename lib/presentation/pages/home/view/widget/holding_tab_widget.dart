import 'package:biorbank/presentation/pages/home/view/widget/common_add_account_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/price_detail_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoldingTabWidget extends StatelessWidget {
  const HoldingTabWidget({super.key,required this.scrollController});
final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                AppConstant.commonText('My Accounts',
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
            separatorBuilder: (context, index) => height(10.h),
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PriceDetailWidget(
              title: 'Account ${index + 1}',
              currentAmt: '\$74,200.00',
              differentAmt: '+643.67',
              isProfit: true,
              totalDifferentInPercentage: '+1.23%',
            ),
          ),
          height(15.h),
          AddAccountWidget(onTap: (){},)
        ],
      ),
    );
  }
}

