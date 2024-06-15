import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/bar_chart.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityTabDetails extends StatelessWidget {
  const ActivityTabDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonDropdownWidget(
                labelText: '',
                borderRadius: 0,
                value: 'Sale',
                items: ['Sale']
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: AppConstant.commonText(e,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow)))
                    .toList(),
                onChanged: (value) {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstant.commonText('Last 90 Days Avg. Price',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  height(4.w),
                  AppConstant.commonText('1.4997',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary),
                ],
              )
            ],
          ),
          height(30.h),
          SizedBox(height: 190.h, child: const BarChartSample()),
          Expanded(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => height(14.h),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                              color: Theme.of(context) 
                                  .colorScheme
                                  .onSecondaryFixed)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://i.seadn.io/s/raw/files/3c2e640cc123dd02a3bcb82142cc997c.png?auto=format&dpr=1&w=1000',
                                  height: 44.h,
                                  width: 44.w,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const SizedBox.shrink(),
                                ),
                              ),
                              width(10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: AppConstant.commonText(
                                              'My Pet Hooligan',
                                              fontSize: 12.sp,
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .shadow),
                                        ),
                                        width(8.w),
                                        Row(
                                          children: [
                                            AppConstant.commonText('Sale',
                                                fontSize: 12.sp,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onInverseSurface),
                                            width(10.w),
                                            Image.asset(
                                              Assets.imagesExploreRounded,
                                              height: 12.h,
                                              width: 12.w,
                                              fit: BoxFit.cover,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    height(4.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: AppConstant.commonText(
                                              'Hooligan #7257',
                                              fontSize: 14.sp,
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .shadow),
                                        ),
                                        width(10.w),
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
                                            width(10.w),
                                            AppConstant.commonText('0.98',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .shadow),
                                          ],
                                        )
                                      ],
                                    ),

                                    /// expention tile
                                    ExpansionTile(
                                      minTileHeight: 10,
                                      dense: true,
                                      visualDensity: const VisualDensity(vertical: -4),
                                      tilePadding: EdgeInsets.zero,
                                        shape: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.transparent)),
                                        collapsedIconColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        iconColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        title: AppConstant.commonText(
                                            fontWeight: FontWeight.w500,
                                            '03/09/2024, 01:32:11',
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                            fontSize: 12.sp),
                                        children: [
                                          height(8.h),
                                          commonRowTile(
                                              context: context,
                                              title: 'Price',
                                              value: '\$3.86K'),
                                          height(10.h),
                                          commonRowTile(
                                              context: context,
                                              title: 'From',
                                              value: '0x45f59...a8e6'),
                                          height(10.h),
                                          commonRowTile(
                                              context: context,
                                              title: 'To',
                                              value: '0x1cc2...387d'),
                                          height(10.h),
                                        ])
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget commonRowTile(
      {required BuildContext context,
      required String title,
      required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: AppConstant.commonText(title,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
        width(10.w),
        Expanded(
          child: AppConstant.commonText(value,
              fontSize: 12.sp,
              textAlign: TextAlign.end,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
        ),
      ],
    );
  }
}
