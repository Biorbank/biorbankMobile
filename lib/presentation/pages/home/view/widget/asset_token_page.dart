import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_widgets.dart';
import '../../../../../utils/routers/auto_app_router.dart';

class AssetsTokenView extends StatelessWidget {
  const AssetsTokenView({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(10.h),
            Center(
              child: Container(
                height: 4.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: 'Tokens',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).colorScheme.shadow,
                        fontWeight: FontWeight.w600),
                    children: [
                      const WidgetSpan(
                          child: SizedBox(
                        width: 6,
                      )),
                      TextSpan(
                          text: '(8)',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Theme.of(context).colorScheme.shadow)),
                    ])),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        Assets.imagesPlusCircle,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        Assets.imagesFilter,
                        height: 21.h,
                        width: 21.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
                itemCount: cubit.tokenList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = cubit.tokenList[index];
                  return GestureDetector(
                    onTap: (){
                       context.router.push(const TokenRoute());
                    },
                    child: tokenCard(
                        context: context,
                        coinName: data['name'],
                        coinShortName: data['short_name'],
                        differentPercentage: data['price_difference_percentage'],
                        imageUrl: data['image_url'] ?? '',
                        isProfit: num.parse(data['price_difference']).isNegative&&num.parse(data['price_difference_percentage']).isNegative,
                        priceDifference: data['price_difference'],
                        totalPrice: data['price'],
                        usdPrice: data['usd_price'],
                        price: data['market_cap']),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget tokenCard(
      {required String differentPercentage,
      required bool isProfit,
      required String imageUrl,
      required String coinName,
      required String coinShortName,
      required String price,
      required String priceDifference,
      required String totalPrice,
      required String usdPrice,
      required BuildContext context}) {
    return Row(
      children: [
        CachedNetworkImage(
            imageUrl: imageUrl,
            height: 44.h,
            width: 44.w,
            placeholder: (context, url) => const SizedBox.shrink()),
        width(15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: coinShortName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                children: [
                  WidgetSpan(
                      child: SizedBox(
                    width: 8.w,
                  )),
                  TextSpan(
                    text: coinName,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.shadow),
                  )
                ])),
            IntrinsicHeight(
              child: Row(
                children: [
                  AppConstant.commonText(totalPrice,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                  SizedBox(
                    width: 3.w,
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                    endIndent: 2,
                    indent: 2,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  AppConstant.commonText(usdPrice,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppConstant.commonText(price,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
            height(8.h),
            Row(
              children: [
                AppConstant.commonText(priceDifference,
                    color: isProfit
                        ? Theme.of(context).colorScheme.onInverseSurface
                        : Theme.of(context).colorScheme.error,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: isProfit
                        ? const Color(0xFFE5FAEE)
                        : const Color(0xFFFDEBEC),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: AppConstant.commonText(
                    '$differentPercentage%',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: isProfit
                        ? Theme.of(context).colorScheme.onInverseSurface
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
