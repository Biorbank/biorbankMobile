import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column p2pCardWidget({required BuildContext context,
required String title,
required String orders,
required String cs,
required String status,
required String quantity,
required String limit,
required VoidCallback onTapBuy
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 30.w,
                child: Stack(
                  children: [
                    Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onPrimary),
                      child: Center(
                        child: AppConstant.commonText('F',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    Positioned(
                      bottom: 2.5.h,
                      right: 3.w,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.onSurface),
                        child: Container(
                          height: 4.h,
                          width: 4.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              width(8.w),
              AppConstant.commonText(title,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.shadow)
            ],
          ),
          Row(
            children: [
              AppConstant.commonText(orders,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer)
            ],
          )
        ],
      ),
      height(12.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(
              text: 'cs',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.shadow),
              children: [
                TextSpan(
                    text: cs,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow))
              ])),
          AppConstant.commonText(status,
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onSecondaryContainer)
        ],
      ),
      height(6.h),
      AppConstant.commonText('Quantity : $quantity',
          fontSize: 12.sp,
          color: Theme.of(context).colorScheme.onSecondaryContainer),
      height(6.h),
      AppConstant.commonText('Limit : $limit',
          fontSize: 12.sp,
          color: Theme.of(context).colorScheme.onSecondaryContainer),
      height(10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: CachedNetworkImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYXuK2UbHTHM865f4E_lsWnqysgdXrpHg62g&s',
              height: 18.h,
              width: 18.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 35.h,
            width: 77.w,
            child: CommonButton(
              borderRadius: 16.r,
              name: 'Buy',
              onTap: () {},
              buttonColor: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
      )
    ],
  );
}
