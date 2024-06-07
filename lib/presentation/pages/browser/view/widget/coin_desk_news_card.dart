import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinDeskNewsCard extends StatelessWidget {
  const CoinDeskNewsCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.title,
  });
final String imageUrl;
final String title;
final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Container(
            width: 240.w,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl:
                         imageUrl,
                      height: 114.h,
                      width: 224.w,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => const SizedBox.shrink(),
                    ),
                  ),
                  height(10.h),
                  AppConstant.commonText(title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  AppConstant.commonText(
                      description,
                      fontSize: 14.sp,
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
