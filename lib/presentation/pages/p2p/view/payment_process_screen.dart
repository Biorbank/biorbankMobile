import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_description_widget.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';

@RoutePage()
class PaymentProcessScreen extends StatelessWidget {
  const PaymentProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbarWidget(
            context: context,
            onTapMessageIcon: () {},
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(20.h),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed,
                                  child: AppConstant.commonText('E',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                ),
                                width(10.w),
                                AppConstant.commonText('Elite Integrity Grp',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                                width(10.w),
                                Image.asset(
                                  Assets.imagesArrowRight,
                                  height: 20.h,
                                  width: 20.w,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 80.w,
                              height: 31.h,
                              child: CommonButton(
                                name: 'Contact',
                                fontSize: 12.sp,
                                buttonColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w400,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        height(20.h),
                        commonDescriptionWidget(
                            context: context,
                            description:
                                'The other party has passed our real-name and video identity verification.'),
                        height(10.h),
                        commonDescriptionWidget(
                            context: context,
                            description:
                                'The other party’s crypto has been deposited into a Bitget custoddial account. Your payment is secure.')
                      ],
                    ),
                  ),
                  height(25.h),
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoAFmX8ZGbr-DK60qX43s-3qtSbC5hGzsa-A&s',
                        height: 20.h,
                        width: 20.w,
                        placeholder: (context, url) => const SizedBox.shrink(),
                      ),
                      width(10.w),
                      Text.rich(TextSpan(
                          text: 'Buy',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF53AE94)),
                          children: [
                            WidgetSpan(child: width(8.w)),
                            TextSpan(
                                text: 'USDT',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.shadow))
                          ])),
                    ],
                  ),
                  height(10.h),
                  commonTile(
                      context: context,
                      title: 'Trading amount',
                      value: 'C\$ 500',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      isShowCopyButton: true,
                      onTapCopiedButton: () {}),
                  height(21.h),
                  commonTile(
                    context: context,
                    title: 'Price',
                    value: 'C\$1.36',
                  ),
                  height(21.h),
                  commonTile(
                    context: context,
                    title: 'Quantity',
                    value: '367.64705882 USDT',
                  ),
                  height(21.h),
                  commonTile(
                      context: context,
                      title: 'Payment method',
                      value: 'Wise',
                      prefixImage:
                          'https://play-lh.googleusercontent.com/wU1A9m0ExkOTQAixWpggeLFzqeXFrR4A9GU9eDhLCO29AnAW4KzUYx1kyHPe21qPgw=w240-h480-rw'),
                  height(21.h),
                  commonTile(
                    context: context,
                    title: 'Order No',
                    value: '1141749750618972161',
                  ),
                  height(21.h),
                  commonTile(
                    context: context,
                    title: 'Order time',
                    value: '2024-02-14 14:51:14',
                  ),
                  height(20.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).colorScheme.onSecondaryFixed),
                      borderRadius: BorderRadius.circular(12.r),
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppConstant.commonText('Notes',
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          height(6.h),
                          commonDescriptionWidget(
                              context: context,
                              description:
                                  'Lorem ipsum dolor sit amet, sit vulputate contentiones ut, vis ei atqui maiorum, labores habemus nusquam ea nec. Eam falli moderatius ex, eu eos odio vivendum appellantur, ius ad altera deserunt. Sed legimus electram cu, tollit aliquando appellantur vix id. Instructior contentiones qui ea, duo diceret nominati et. Veri scripta vis at. Et ius case aeterno elaboraret, vidit invidunt dissentias quo an, nam vocibus maiestatis eu. Illud malorum adipiscing cu pro, has at unum clita singulis.')
                        ],
                      ),
                    ),
                  ),
                  height(20.h),
                ],
              ),
            ),
          )),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, -4),
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryFixedVariant
                          .withOpacity(0.12))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: CommonOutlinedButton(
                          height: 50,
                          borderRadius: 16.r,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          onTap: () {
                            context.router.back();
                          },
                          title: 'Cancel')),
                  width(20.w),
                  Expanded(
                      child: SizedBox(
                    child: CommonButton(
                      name: 'Next',
                      onTap: () {
                        context.read<P2pMarketCubit>().images.clear();
                        context.router.push(const BuyRoute());
                      },
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appbarWidget(
      {required BuildContext context, required VoidCallback onTapMessageIcon}) {
    return CommonBlueContainer(
        height: 205.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(55.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.router.back();
                    },
                    child: Image.asset(
                      Assets.imagesBackArrow,
                      height: 24.h,
                      width: 24.w,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  InkWell(
                    onTap: onTapMessageIcon,
                    child: Image.asset(
                      Assets.imagesMessageQuestion,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ],
              ),
              height(18.h),
              AppConstant.commonText(
                  'The order has been generated. Proceed to payment.',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface),
              height(8.h),
              Row(
                children: [
                  AppConstant.commonText('Please pay within',
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.onSurface),
                  width(10.w),
                  SlideCountdown(
                    duration: const Duration(minutes: 15),
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.onSurface),
                    suffixIcon: Row(
                      children: [
                        AppConstant.commonText('s',
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.onSurface),
                        width(4.w),
                        AppConstant.commonText('Minutes',
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.onSurface),
                      ],
                    ),
                    separatorStyle: TextStyle(fontSize: 12.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.10)),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget commonTile(
      {required BuildContext context,
      required String title,
      required String value,
      String? prefixImage,
      double? fontSize,
      FontWeight? fontWeight,
      VoidCallback? onTapCopiedButton,
      bool isShowCopyButton = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        Row(
          children: [
            Visibility(
              visible: prefixImage != null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  imageUrl: prefixImage ?? '',
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox.shrink(),
                ),
              ),
            ),
            width(prefixImage != null ? 10.w : 0),
            AppConstant.commonText(value,
                fontSize: fontSize ?? 14.sp,
                fontWeight: fontWeight ?? FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
            width(isShowCopyButton ? 10.w : 0),
            Visibility(
              visible: isShowCopyButton,
              child: InkWell(
                onTap: onTapCopiedButton,
                child: Image.asset(
                  Assets.imagesCopyRounded,
                  height: 16.h,
                  width: 16.w,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
