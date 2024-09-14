// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:biorbank/utils/app_widgets.dart';

class CommonCryptoDetailTile extends StatelessWidget {
  const CommonCryptoDetailTile(
      {super.key,
      required this.context,
      required this.coinImageUrl,
      required this.coinShortName,
      required this.coinName,
      this.onTap,
      this.contentPadding,
      this.secondCoinUrl});
  final BuildContext context;
  final String coinImageUrl;
  final String coinShortName;
  final String coinName;
  final String? secondCoinUrl;
  final VoidCallback? onTap;
  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: contentPadding,
      horizontalTitleGap: 8,
      minTileHeight: 25,
      leading: SizedBox(
        width: 53.w,
        height: 50.h,
        child: Stack(
          children: [
            Image.asset(
              coinImageUrl,
              height: 40.h,
              width: 40.w,
            ),
            Visibility(
              visible: secondCoinUrl != null,
              child: Positioned(
                bottom: -1,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: secondCoinUrl ?? '',
                      height: 28.h,
                      width: 28.h,
                      placeholder: (context, url) => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      title: AppConstant.commonText(coinShortName,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: Theme.of(context).colorScheme.shadow),
      subtitle: AppConstant.commonText(coinName,
          fontSize: 14.sp,
          color: Theme.of(context).colorScheme.onSecondaryContainer),
    );
  }
}
