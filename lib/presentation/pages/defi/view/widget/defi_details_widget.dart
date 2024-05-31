import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeFiDetailsWidget extends StatelessWidget {
  const DeFiDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F5FA),
          borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        shape: OutlineInputBorder(borderSide: BorderSide(color: AppColors.transparent)),
          collapsedIconColor: Theme.of(context).colorScheme.shadow,
          iconColor: Theme.of(context).colorScheme.shadow,
          leading: CachedNetworkImage(
            imageUrl:
                'https://e7.pngegg.com/pngimages/292/77/png-clipart-drop-water-droplets-blue-drop-thumbnail.png',
            height: 35.h,
            width: 35.w,
            placeholder: (context, url) => const SizedBox(),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstant.commonText('Liquidity Pools',
                        fontSize: 16.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                    AppConstant.commonText('7 Position',
                        fontSize: 12.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer),
                  ],
                ),
              ),
              width(10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppConstant.commonText('\$9,871.82',
                        fontSize: 16.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppConstant.commonText('\$0.11',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        width(6.w),
                        Image.asset(
                          Assets.imagesGift,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          children: List.generate(
            4,
            (index) => Column(
              children: [
                Visibility(
                  visible: index == 0,
                  child: Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    color: Theme.of(context)
                        .colorScheme
                        .secondaryContainer,
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                          height: 32.h,
                          width: 32.w,
                          placeholder: (context, url) =>
                              const SizedBox(),
                        ),
                        Positioned(
                          bottom: 9,
                          right: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface,
                            ),
                            padding:const EdgeInsets.all(1),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                              height: 18.h,
                              width: 18.w,
                              placeholder: (context, url) =>
                                  const SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset(
                        Assets.imagesEmptyWallet,
                        height: 16.h,
                        width: 16.w,
                      ),
                      width(10.w),
                      AppConstant.commonText('Uniswap',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ],
                  ),
                  title: AppConstant.commonText('USDT/USDC',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  trailing: AppConstant.commonText('\$1,016,208.83',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.shadow),
                )
              ],
            ),
          ).toList()),
    );
  }
}
