import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StakingDetailTab extends StatelessWidget {
  const StakingDetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(20.h),
          AppConstant.commonText('Native Staking',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.shadow),
          height(10.h),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    left: 4, right: 4, top: 14, bottom: 35),
                separatorBuilder: (context, index) => height(20.h),
                itemCount: 10,
                itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                height: 44.h,
                                width: 44.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://poolbay.io/images/cards/evmos-card.png',
                                    height: 24.h,
                                    width: 24.w,
                                    placeholder: (context, url) =>
                                        const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                              width(10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstant.commonText('EVMOS',
                                        fontSize: 14.sp,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                    height(8.h),
                                    AppConstant.commonText('Evmos',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        width(12.w),
                        Row(
                          //  mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppConstant.commonText('APR',
                                fontSize: 14.sp,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface),
                            width(8.w),
                            Container(
                              height: 2.h,
                              width: 2.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface),
                            ),
                            width(8.w),
                            AppConstant.commonText('11.11%',
                                fontSize: 14.sp,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface),
                          ],
                        )
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
