import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/widget/currency_convert_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/widget/range_slider_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/widget/swap_setting_dialog.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/widget/unlock_token_dialog.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapTabWidget extends StatefulWidget {
  const SwapTabWidget({super.key});

  @override
  State<SwapTabWidget> createState() => _SwapTabWidgetState();
}

class _SwapTabWidgetState extends State<SwapTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(22.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppConstant.commonText('Calculate in:',
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        width(10.w),
                        GestureDetector(
                          onTap: () {
                            // context
                            //     .read<MarketCubit>()
                            //     .onChangeSelectedCryptoTabIndex(index: 0);
                            // showModalBottomSheet(
                            //   isScrollControlled: true,
                            //   shape: const RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.only(
                            //           topLeft: Radius.circular(12),
                            //           topRight: Radius.circular(12))),
                            //   backgroundColor:
                            //       Theme.of(context).colorScheme.onSurface,
                            //   context: context,
                            //   builder: (context) => const SelectCryptoWidget(),
                            // );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                            child: Row(
                              children: [
                                Image.asset(
                                  Assets.imagesSwapArrow,
                                  height: 12.h,
                                  width: 12.w,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                width(8.w),
                                AppConstant.commonText('Crypto',
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const SwapSettingDialog(),
                          );
                        },
                        child: Image.asset(
                          Assets.imagesFilter,
                          height: 20.h,
                          width: 20.w,
                        ))
                  ],
                ),
              ),
              height(14.h),
              const CurrencyConvertWidget(),
              height(10.h),
              const RangeSliderWidget(),
              height(25.h),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.inversePrimary),
                  child: AppConstant.commonText(
                      'You must first unlock your tokens',
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w500),
                ),
              ),
              height(20.h),
              CommonButton(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                name: 'Unlock Token',
                onTap: () {
                  context
                      .read<MarketCubit>()
                      .onChangeTransactionStatus(index: 0);
                  showDialog(
                    context: context,
                    builder: (context) => const UnlockTokenDialog(),
                  );
                },
                textColor: Theme.of(context).colorScheme.onSurface,
              ),
              height(20.h),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 40,
                            offset: const Offset(2, 4),
                            spreadRadius: 0,
                            color: const Color(0xFFAAAAAA).withOpacity(0.15))
                      ]),
                  child: ExpansionTile(
                    childrenPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.transparent)),
                    collapsedIconColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    iconColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppConstant.commonText('Provider:',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            width(8.w),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                              height: 20.h,
                              width: 20.w,
                              placeholder: (context, url) =>
                                  const SizedBox.shrink(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  Assets.imagesGasStation,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                width(8.w),
                                AppConstant.commonText('\$56.67',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                              ],
                            ),
                            width(13.w),
                            Image.asset(
                              Assets.imagesTimer,
                              height: 20.h,
                              width: 20.w,
                            ),
                            width(6.w),
                            AppConstant.commonText('82:36',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                          ],
                        )
                      ],
                    ),
                    children: [
                      AppConstant.commonDivider(),
                      height(10.h),
                      commonRowWidget(
                          contex: context, title: 'Fee', value: '\$0'),
                      height(15.h),
                      commonRowWidget(
                          contex: context, title: 'Status', value: 'Pending'),
                      height(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText('Receip tx',
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppConstant.commonText('0x32...ef61d',
                                  color: Theme.of(context).colorScheme.shadow,
                                  fontWeight: FontWeight.w500),
                              width(6.w),
                              Image.asset(
                                Assets.imagesCopyRounded,
                                height: 16.h,
                                width: 16.w,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              width(6.w),
                              Image.asset(
                                Assets.imagesExploreRounded,
                                height: 14.h,
                                width: 14.w,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ],
                          )
                        ],
                      ),
                      height(15.h),
                      commonRowWidget(
                          contex: context, title: 'Slippage', value: '0.00%'),
                      height(15.h),
                      AppConstant.commonDivider(),
                      height(20.h),
                      commonRowWidget(
                          contex: context, title: 'Est. Time', value: '82:36'),
                      height(15.h),
                      commonRowWidget(
                          contex: context,
                          title: 'Type of Tx',
                          value: 'Cross - chain'),
                      height(15.h),
                    ],
                  )),
              height(60.h),
            ],
          ),
        ));
  }

  Widget commonRowWidget(
      {required BuildContext contex,
      required String title,
      required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        AppConstant.commonText(value,
            color: Theme.of(context).colorScheme.shadow,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
