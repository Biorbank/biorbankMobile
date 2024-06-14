import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NftVolumeDetails extends StatelessWidget {
  const NftVolumeDetails(
      {super.key,
      required this.bestOffer,
      required this.floorPrice,
      required this.listed,
      required this.totalOwner,
      required this.totalVolume,
      required this.uniqueOwners});
  final String totalVolume;
  final String floorPrice;
  final String bestOffer;
  final String totalOwner;
  final String listed;
  final String uniqueOwners;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.onSurface,
          boxShadow: [
            BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(2, 4),
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.15))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                commonTile(
                    context: context, title: 'Total Volume', value: totalVolume),
                commonTile(
                    context: context, title: 'Floor Price', value: floorPrice),
                commonTile(
                    context: context, title: ' Best offer', value: bestOffer),
              ],
            ),
            height(15.h),
            AppConstant.commonDivider(
                color: Theme.of(context).colorScheme.onSecondaryFixed),
            height(15.h),
            Row(
              children: [
                commonTile(
                    isVisibleImage: false,
                    context: context,
                    title: 'Owners',
                    value: totalOwner),
                commonTile(
                    isVisibleImage: false,
                    context: context,
                    title: 'Listed',
                    value: listed),
                commonTile(
                    isVisibleImage: false,
                    context: context,
                    title: 'Unique owners',
                    value: uniqueOwners),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget commonTile({
    required BuildContext context,
    required String title,
    required String value,
    bool isVisibleImage = true,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.commonText(title,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
          height(6.h),
          Row(
            children: [
              Visibility(
                visible: isVisibleImage,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
                  height: 16.h,
                  width: 16.w,
                  placeholder: (context, url) => const SizedBox.shrink(),
                ),
              ),
              width(isVisibleImage ? 8.w : 0),
              Expanded(
                child: AppConstant.commonText(value,
                    fontSize: 16.sp,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
