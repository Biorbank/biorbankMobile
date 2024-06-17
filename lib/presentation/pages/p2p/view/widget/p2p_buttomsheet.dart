import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class P2pButtomsheetWidget extends StatelessWidget {
  const P2pButtomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(25.h),
          rowTileWidget(
              context: context,
              image: Assets.imagesCard,
              title: 'Payment methods'),
          height(26.h),
          rowTileWidget(
              context: context, image: Assets.imagesPostAd, title: 'Post Ad'),
          height(26.h),
          rowTileWidget(
              context: context,
              image: Assets.imagesP2pManagement,
              title: 'P2P management'),
          height(26.h),
          rowTileWidget(
              context: context,
              image: Assets.imagesBook,
              title: 'Beginner’s guide'),
          height(26.h),
          rowTileWidget(
              context: context,
              image: Assets.imagesMerchent,
              title: 'Apply to be merchant'),
          height(26.h),
          rowTileWidget(
              context: context, image: Assets.imagesLock, title: 'Ad Pascode'),
          height(26.h),
          rowTileWidget(
              context: context,
              image: Assets.imagesHeadphone,
              title: 'Support'),
          height(26.h),
        ],
      ),
    );
  }

  Widget rowTileWidget(
      {required BuildContext context,
      required String image,
      required String title}) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 24.h,
          width: 24.w,
        ),
        width(10.w),
        AppConstant.commonText(title,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.shadow)
      ],
    );
  }
}
