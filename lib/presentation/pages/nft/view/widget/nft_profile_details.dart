import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NftProfileDetails extends StatelessWidget {
  const NftProfileDetails(
      {super.key,
      required this.backgroundImage,
      required this.items,
      required this.nftImage,
      required this.onTapCollectOffer,
      required this.royalty,
      required this.title});
  final String backgroundImage;
  final String nftImage;
  final String title;
  final String items;
  final String royalty;
  final VoidCallback onTapCollectOffer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 248.h,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: backgroundImage,
            height: 130.h,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => const SizedBox.shrink(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(15.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.router.maybePop();
                      },
                      child: Image.asset(
                        Assets.imagesBackArrow,
                        height: 24.h,
                        width: 24.w,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            Assets.imagesStarIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                        width(20.w),
                        InkWell(
                          onTap: () {},
                          child: Transform.rotate(
                            angle: 1.6,
                            child: Image.asset(
                              Assets.imagesLogOut,
                              height: 24.h,
                              width: 24.w,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              height(60.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  width(15.w),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.transparent,
                    backgroundImage: CachedNetworkImageProvider(nftImage),
                  ),
                  width(14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstant.commonText(title,
                            fontSize: 22.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.shadow),
                        height(6.h),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
                              height: 16.h,
                              width: 16.w,
                              placeholder: (context, url) =>
                                  const SizedBox.shrink(),
                            ),
                            width(12.w),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                Assets.imagesBrowser,
                                height: 16.h,
                              ),
                            ),
                            width(12.w),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                Assets.imagesXIcon,
                                height: 16.h,
                              ),
                            ),
                            width(12.w),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                Assets.imagesInstagram,
                                height: 16.h,
                              ),
                            ),
                            width(12.w),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                Assets.imagesDiscordOutline,
                                height: 16.h,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              height(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppConstant.commonText('Items',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        width(6.w),
                        AppConstant.commonText(items,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.shadow),
                        width(15.w),
                        Row(
                          children: [
                            AppConstant.commonText('Royalty',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            width(6.w),
                            AppConstant.commonText(royalty,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.shadow),
                          ],
                        ),
                      ],
                    ),
                    width(20.w),
                    Expanded(
                      child: CommonOutlinedButton(
                          height: 35.h,
                          fontSize: 12.sp,
                          borderRadius: 16.r,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                          onTap: onTapCollectOffer,
                          title: 'Make collection offer'),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
