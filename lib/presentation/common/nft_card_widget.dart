 import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget nftCardWidget(
      {required BuildContext context,
      required String imageUrl,
      required String title}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryFixed)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 145.h,
              width: 145.w,
              fit: BoxFit.cover,
            ),
          ),
          height(12.h),
          AppConstant.commonText(title,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow)
        ],
      ),
    );
  }