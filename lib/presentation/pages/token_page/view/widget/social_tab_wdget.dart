import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialTabWdget extends StatelessWidget {
  const SocialTabWdget({super.key,required this.onChangedChain,required this.onChangedExplores});
 final Function(String?) onChangedExplores;
 final Function(String?) onChangedChain;
   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(15.h),
            commonRowTile(
              context: context,
              title: 'Info',
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
                    height: 18.h,
                    width: 18.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                  ),
                  width(8.w),
                  AppConstant.commonText('0x1f0...011984',
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context).colorScheme.onPrimary),
                  width(8.w),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Assets.imagesCopy,
                      height: 18.h,
                      width: 18.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  width(8.w),
                  InkWell(
                      onTap: () {}, child: const Icon(Icons.more_horiz_outlined))
                ],
              ),
            ),
            height(20.h),
            commonRowTile(
                context: context,
                title: 'Website',
                child: AppConstant.commonText('uniswao.org',
                    color: Theme.of(context).colorScheme.shadow)),
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Explores',
                    color: Theme.of(context).colorScheme.shadow),
                CommonDropdownWidget(
                  labelText: 'Select explore',
                  height: 34.h,
                  borderRadius: 12.r,
                  backGroundColor: Theme.of(context).colorScheme.surfaceContainer,
                  items: ['Etherscan', 'Bitscan']
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: AppConstant.commonText(e,
                              color: Theme.of(context).colorScheme.shadow)))
                      .toList(),
                  onChanged: onChangedExplores,
                )
              ],
            ),
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Community',
                    color: Theme.of(context).colorScheme.shadow),
                width(10.w),
                Expanded(
                  flex: 2,
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      commonContainerWidget(
                          context: context,
                          title: 'Twitter',
                          image:
                              'https://cdn.iconscout.com/icon/free/png-256/free-twitter-x-9581782-7740647.png?f=webp&w=256'),
                      commonContainerWidget(
                          context: context,
                          title: 'Snapshot',
                          image:
                              'https://avatars.githubusercontent.com/u/72904068?s=200&v=4'),
                      commonContainerWidget(
                          context: context,
                          title: 'Discord',
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4e_xrud6-8Uwi2NJ4YRgcvYdGWJKMYrS6Ng&s'),
                    ],
                  ),
                )
              ],
            ),
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Search on',
                    color: Theme.of(context).colorScheme.shadow),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).colorScheme.errorContainer),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesSearch,
                          height: 16.h,
                          width: 16.h,
                          color:
                              Theme.of(context).colorScheme.onSecondaryContainer,
                          fit: BoxFit.cover,
                        ),
                        width(6.w),
                        AppConstant.commonText('Twitter',
                            color: Theme.of(context).colorScheme.shadow)
                      ],
                    ))
              ],
            ),
            height(20.h),
            commonRowTile(
                context: context,
                title: 'API ID',
                child: Row(
                  children: [
                    AppConstant.commonText('uniswap',
                        color: Theme.of(context).colorScheme.shadow),
                    width(10.w),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        Assets.imagesCopy,
                        height: 18.h,
                        width: 18.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
            height(20.h),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Chains',
                    color: Theme.of(context).colorScheme.shadow),
                width(12.w),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color:
                                  Theme.of(context).colorScheme.surfaceContainer),
                          child: AppConstant.commonText('Ethereum Ecosystem',
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              color: Theme.of(context).colorScheme.shadow),
                        ),
                      ),
                      width(12.w),
                      Expanded(
                        child: CommonDropdownWidget(
                          labelText: 'Select chain',
                          height: 34.h,
                          borderRadius: 12.r,
                          backGroundColor:
                              Theme.of(context).colorScheme.surfaceContainer,
                          items: ['7 more', '8 more']
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: AppConstant.commonText(e,
                                      color:
                                          Theme.of(context).colorScheme.shadow)))
                              .toList(),
                          onChanged: onChangedChain,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            height(20.h)
          ],
        ),
      ),
    );
  }

  Widget commonRowTile(
      {required BuildContext context,
      required String title,
      required Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            color: Theme.of(context).colorScheme.shadow),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).colorScheme.surfaceContainer),
            child: child)
      ],
    );
  }

  Widget commonContainerWidget(
      {required BuildContext context,
      required String image,
      required String title}) {
    return Container(
        width: 120.w,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).colorScheme.surfaceContainer),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              height: 22.h,
              width: 22.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
            width(8.w),
            Expanded(
              child: AppConstant.commonText(title,
                  color: Theme.of(context).colorScheme.shadow),
            )
          ],
        ));
  }
}
