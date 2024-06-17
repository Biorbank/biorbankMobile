import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonBlueContainer(
              height: 104.h,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        context.router.back();
                      },
                      child: Image.asset(
                        Assets.imagesBackArrow,
                        height: 26.h,
                        width: 26.w,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    AppConstant.commonText('My Orders',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface),
                    Image.asset(
                      Assets.imagesFilterLine,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ],
                ),
              )),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 18),
              separatorBuilder: (context, index) => height(10.h),
              itemCount: 6,
              itemBuilder: (context, index) => orderCard(
                  context: context,
                  orderType: index % 2 == 0 ? 0 : 1,
                  orderStatus: index % 2 == 0 ? 0 : 1,
                  currency: 'USDT'),
            ),
          )
        ],
      ),
    );
  }

  Widget orderCard(
      {required BuildContext context,
      required int orderType,
      required String currency,
      required int orderStatus}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.onPrimaryContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppConstant.commonText(orderType == 0 ? 'Buy' : 'Sell',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: orderType == 0
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.error),
                  width(8.w),
                  Container(
                    height: 8.h,
                    width: 8.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: orderType == 0
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.error),
                  ),
                  width(8.w),
                  AppConstant.commonText(currency,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 26.h,
                    width: 74.w,
                    child: CommonButton(
                      buttonColor: orderStatus == 0
                          ? const Color(0xFFE5FAEE)
                          : const Color(0xFFFDEBEC),
                      fontSize: 12.sp,
                      onTap: () {},
                      name: orderStatus == 0 ? 'Success' : 'Cancelled',
                      textColor: orderStatus == 0
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  width(8.w),
                  Image.asset(
                    Assets.imagesArrowRight,
                    height: 18.h,
                    width: 18.w,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                ],
              )
            ],
          ),
          height(12.h),
          Padding(
            padding:  EdgeInsets.only(right: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonTitleWidget(
                    context: context, title: 'Price', value: '1.36'),
                commonTitleWidget(
                    context: context,
                    title: 'Trading Amount',
                    value: 'C\$ 500'),
              ],
            ),
          ),
          height(12.h),
          Padding(
            padding:  EdgeInsets.only(right: 45.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonTitleWidget(
                    context: context, title: 'Quantity', value: '367.6470580'),
                commonTitleWidget(
                    context: context,
                    title: 'Payment Method',
                    value: 'Wise',
                    imageUrl:
                        'https://play-lh.googleusercontent.com/wU1A9m0ExkOTQAixWpggeLFzqeXFrR4A9GU9eDhLCO29AnAW4KzUYx1kyHPe21qPgw=w240-h480-rw'),
              ],
            ),
          ),
          height(10.h),
          AppConstant.commonDivider(),
          height(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonTitleWidget(
                  context: context,
                  title: 'Seller Information',
                  value: 'Elite Integration'),
              commonTitleWidget(
                context: context,
                title: 'Date',
                value: '2024/02/14 14:51:14',
              ),
            ],
          ),
          height(4.h),
        ],
      ),
    );
  }

  Widget commonTitleWidget({
    required BuildContext context,
    required String title,
    required String value,
    String? imageUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstant.commonText(title,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        height(6.h),
        Row(
          children: [
            Visibility(
                visible: imageUrl != null && imageUrl.isNotEmpty,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl ?? '',
                    height: 20.h,
                    width: 20.w,
                    placeholder: (context, url) => const SizedBox.shrink(),
                  ),
                )),
            width(imageUrl != null && imageUrl.isNotEmpty ? 8.w : 0),
            AppConstant.commonText(value,
                color: Theme.of(context).colorScheme.shadow,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ],
        ),
      ],
    );
  }
}
