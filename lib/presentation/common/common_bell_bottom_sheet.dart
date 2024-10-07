import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../utils/app_widgets.dart';
import '../pages/price_alert/view/price_alert_screen.dart';

class CommonBellBottomSheet extends StatelessWidget {
  const CommonBellBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Divider(
          thickness: 2,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          indent: MediaQuery.of(context).size.width * 0.43,
          endIndent: MediaQuery.of(context).size.width * 0.43,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              AppConstant.commonText("Notification",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.shadow),
              const Spacer(),
              AppConstant.commonText("Edit Alert",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary),
              width(16),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  Assets.imagesClose,
                  height: 12,
                  width: 12,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          Assets.imagesBellEmpty,
          height: 120,
          width: 120,
          fit: BoxFit.fitWidth,
        ),
        AppConstant.commonText("You have no alerts, create one",
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: CommonOutlinedButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PriceAlertScreen(),
                ),
              );
            },
            height: 45,
            title: "Create Alert",
            textColor: Theme.of(context).colorScheme.shadow,
            borderRadius: 40,
            borderColor: Theme.of(context).colorScheme.scrim,
            bgColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
        ),
        height(12),
      ],
    );
  }
}
