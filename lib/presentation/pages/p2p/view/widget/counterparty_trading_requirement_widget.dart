import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CounterpartyTradingRequirementWidget extends StatelessWidget {
  const CounterpartyTradingRequirementWidget({super.key,required this.isTradingRequirement,required this.onToggle});
final bool isTradingRequirement;
final Function(bool) onToggle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Theme.of(context).colorScheme.errorContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppConstant.commonText('Counterparty Trading Requirements',
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.shadow),
            ),
            FlutterSwitch(
              width: 48.0,
              height: 26.0,
              toggleSize: 20.0,
              inactiveColor: Theme.of(context).colorScheme.onSurface,
              toggleColor: const Color(0xFFDFE2E7),
              activeColor: AppColors.green,
              value: isTradingRequirement,
              activeToggleColor: Theme.of(context).colorScheme.onSurface,
              borderRadius: 25.0,
              padding: 4,
              showOnOff: false,
              onToggle:onToggle
            )
          ],
        ),
      ),
    );
  }
}
