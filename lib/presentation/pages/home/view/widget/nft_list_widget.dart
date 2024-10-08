import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/Theme/app_colors.dart';
import '../../../../../utils/app_widgets.dart';

class NftListWidget extends StatelessWidget {
  final String img;
  final String title;
  final String floorPrice;
  final String listed;
  final String cost;
  final String estimated;

  const NftListWidget({
    super.key,
    required this.title,
    required this.floorPrice,
    required this.img,
    required this.listed,
    required this.cost,
    required this.estimated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
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
                height: 40.h,
                width: 40.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox.shrink(),
              ),
            ),
            title: AppConstant.commonText(title,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
            subtitle: Row(
              children: [
                AppConstant.commonText("Floor Price ",
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                AppConstant.commonText(floorPrice,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
              ],
            ),
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          AppConstant.commonText(listed,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          AppConstant.commonText("Listed",
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          AppConstant.commonText(cost,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          AppConstant.commonText("Cost",
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          AppConstant.commonText(estimated,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          AppConstant.commonText("Estimated Value",
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
