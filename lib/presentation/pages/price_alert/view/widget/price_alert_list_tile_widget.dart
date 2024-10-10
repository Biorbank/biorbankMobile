import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/Theme/app_colors.dart';
import '../../../../../utils/app_widgets.dart';
import '../../../../common/common_outlined_button.dart';

class PriceAlertListTileWidget extends StatelessWidget {
  final String img;
  final String title;
  final String titleType;
  final String subTitle;
  final String type;
  final String amount;
  final VoidCallback onTap;

  const PriceAlertListTileWidget({
    super.key,
    required this.img,
    required this.title,
    required this.titleType,
    required this.subTitle,
    required this.type,
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        children: [
          ExpansionTile(
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.transparent)),
            collapsedIconColor: Theme.of(context).colorScheme.shadow,
            iconColor: Theme.of(context).colorScheme.shadow,
            childrenPadding: const EdgeInsets.only(bottom: 12),
            tilePadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: CachedNetworkImage(
                imageUrl: img,
                height: 45.h,
                width: 45.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox.shrink(),
              ),
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.shadow,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                  TextSpan(text: " $titleType"),
                ],
              ),
            ),
            subtitle: AppConstant.commonText(
              subTitle,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  AppConstant.commonText(type,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.shadow),
                  width(5),
                  AppConstant.commonText("< $amount",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.shadow),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(0.1),
                    ),
                    child: AppConstant.commonText("Once",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.shadow),
                  ),
                  width(13),
                  Image.asset(
                    Assets.imagesEdit,
                    height: 20,
                    width: 20,
                  ),
                  width(3),
                  Icon(
                    Icons.delete_outline_outlined,
                    size: 20,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ],
              ),
              height(8),
              CommonOutlinedButton(
                onTap: onTap,
                title: "+ Add new $titleType alert",
                borderColor: Theme.of(context).colorScheme.scrim,
                fontSize: 12,
                textColor: Theme.of(context).colorScheme.shadow,
                bgColor:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.05),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
