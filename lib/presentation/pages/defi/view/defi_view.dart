import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_balance_widget.dart';
import 'package:biorbank/presentation/pages/defi/view/widget/defi_details_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefiView extends StatelessWidget {
  const DefiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 244.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  transform: const GradientRotation(6),
                  stops: const [
                0.3,
                1
              ],
                  colors: [
                const Color(0xFF2E31B7),
                Theme.of(context).colorScheme.primary,
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                height(40.h),
                CommonSearchAppbar(
                  hintText: 'ID/USDT',
                  textController: TextEditingController(),
                ),
                height(10.h),
                const CommonBalanceWidget(
                  amount: '\$75,630.90',
                  currentRate: 'CA \$0.00 (0.00%)',
                  isShowBalanceWidget: true,
                )
              ],
            ),
          ),
        ),
        height(20.h),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => height(10.h),
            itemCount: 3,
            itemBuilder: (context, index) => const DeFiDetailsWidget(),
          ),
        )
      ],
    );
  }
}
