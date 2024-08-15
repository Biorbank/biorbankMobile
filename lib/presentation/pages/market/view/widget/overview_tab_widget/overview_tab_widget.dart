import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/eth_gas_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/greed_index_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/options_volality_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/overview_tab_widget/widget/overview_chart.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';

import 'widget/common_shadow_container.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                        height: 16.h,
                        width: 16.w,
                        placeholder: (context, url) => const SizedBox.shrink()),
                    width(10.w),
                    AppConstant.commonText('BTC Halving',
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                  ],
                ),
                SlideCountdownSeparated(
                  separatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  duration: const Duration(hours: 2),
                )
              ],
            ),
          ),
          height(14.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstant.commonText('Crypto Market Cap',
                        fontSize: 12.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    AppConstant.commonText('3.46T',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 26,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                AppConstant.commonText('0.54%',
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onInverseSurface),
              ],
            ),
          ),
          height(30.h),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 32),
            child: SizedBox(
                height: 147.h,
                child: const OverViewLineChart(
                  isShowBottomSideData: true,
                  isShowDot: true,
                  isShowRightSideData: true,
                )),
          ),
          height(10.h),

          /// geed index and volue
          const GreedIndexWidget(),
          height(20.h),
          CommonShadowContainer(
            child: Column(
              children: [
                height(5.h),
                Row(
                  children: [
                    AppConstant.commonText('Market Dominance',
                        fontSize: 12.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    width(8.w),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 13.h,
                      width: 13.w,
                    )
                  ],
                ),
                height(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: commonRowWidget(
                          context: context,
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                          title: '50.00%'),
                    ),
                    Expanded(
                      child: commonRowWidget(
                          context: context,
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                          title: '25.00%'),
                    ),
                    Expanded(
                      child: commonRowWidget(
                          context: context,
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                          title: '25.00%'),
                    ),
                  ],
                )
              ],
            ),
          ),
          height(14.h),

          /// ETH gas widget
          const ETHgasWidget(),
          height(14.h),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, 4))
                ]),
            child: Column(
              children: [
                height(5.h),
                Row(
                  children: [
                    AppConstant.commonText('Open interest',
                        fontSize: 12.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    width(8.w),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 13.h,
                      width: 13.w,
                    )
                  ],
                ),
                height(10.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstant.commonText('Perpetuals',
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        height(4.h),
                        AppConstant.commonText('\$100.00B',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                      ],
                    ),
                    width(30.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstant.commonText('Futures',
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        height(4.h),
                        AppConstant.commonText('\$10.00B',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          height(14.h),

          /// options volality
          const OptionsVolalityWidget(),
          height(40.h)
        ],
      ),
    );
  }

  Row commonRowWidget(
      {required BuildContext context,
      required String imageUrl,
      required String title}) {
    return Row(
      children: [
        CachedNetworkImage(
            imageUrl: imageUrl,
            height: 16.h,
            width: 16.w,
            placeholder: (context, url) => const SizedBox.shrink()),
        width(8.w),
        Expanded(
          child: AppConstant.commonText(title,
              fontWeight: FontWeight.w500,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.shadow),
        )
      ],
    );
  }
}
