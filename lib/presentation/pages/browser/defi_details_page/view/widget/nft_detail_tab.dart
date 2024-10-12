import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NftDetailTab extends StatelessWidget {
  const NftDetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppConstant.commonText('Top Collections',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.shadow),
              Row(
                children: [
                  CommonDropdownWidget(
                    value: '24h',
                    textStyle:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    labelText: '',
                    items: [
                      DropdownMenuItem(
                        value: '24h',
                        child: AppConstant.commonText('24h',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                      )
                    ],
                    onChanged: (p0) {},
                  ),
                  width(10.w),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFF6F7F9)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFFEEEEEE)),
                            child: Icon(
                              Icons.grid_view_rounded,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        width(12.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.menu,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          height(12.h),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding:
                  const EdgeInsets.only(left: 4, right: 4, top: 14, bottom: 35),
              separatorBuilder: (context, index) => height(20.h),
              itemCount: 2,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  context.router.push(const NFTRoute());
                },
                child: nftDetailTile(
                    index: index,
                    context: context,
                    imageUrl:
                        'https://i.seadn.io/s/raw/files/4ee7ead8ab3941cad1e94f080ce27d56.png?auto=format&dpr=1&w=1000',
                    currenyImageUrl:
                        'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
                    price: '14.3499',
                    title: 'My Pet Hooligan',
                    priceDifference: index % 2 == 0 ? '+15.21%' : '-15.21%',
                    subTitle: 'Floor',
                    totalprice: '2.33K',
                    isProfit: index % 2 == 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nftDetailTile(
      {required int index,
      required BuildContext context,
      required String imageUrl,
      required String title,
      required String subTitle,
      required String currenyImageUrl,
      required String price,
      required String totalprice,
      required String priceDifference,
      bool isProfit = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              AppConstant.commonText('${index + 1}',
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              width(12.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: CachedNetworkImage(
                  imageUrl:
                     imageUrl,
                  height: 44.h,
                  width: 44.w,
                  placeholder: (context, url) => const SizedBox.shrink(),
                ),
              ),
              width(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstant.commonText(title,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        color: Theme.of(context).colorScheme.shadow),
                    height(8.h),
                    Row(
                      children: [
                        AppConstant.commonText(subTitle,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        width(18.w),
                        CachedNetworkImage(
                          imageUrl:
                              currenyImageUrl,
                          height: 14.h,
                          width: 14.w,
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                        ),
                        width(8.w),
                        Expanded(
                          child: AppConstant.commonText(price,
                              fontWeight: FontWeight.w500,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.shadow),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        width(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      currenyImageUrl,
                  height: 14.h,
                  width: 14.w,
                  placeholder: (context, url) => const SizedBox.shrink(),
                ),
                width(6.w),
                AppConstant.commonText(totalprice,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.shadow),
              ],
            ),
            height(8.h),
            AppConstant.commonText(priceDifference,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: isProfit
                    ? Theme.of(context).colorScheme.onInverseSurface
                    : Theme.of(context).colorScheme.error),
          ],
        )
      ],
    );
  }
}
