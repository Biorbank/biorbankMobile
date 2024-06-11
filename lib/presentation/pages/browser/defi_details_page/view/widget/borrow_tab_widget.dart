import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/loan_confirmation_dialog.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorrowTabWidget extends StatelessWidget {
  const BorrowTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            height(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('How much do you want to borrow',
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.outline),
                AppConstant.commonText('Balance : 12.756',
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.outline),
              ],
            ),
            height(15.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF9FAFB)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonTextfield(
                        title: '',
                        verticalPading: 0,
                        inputType: TextInputType.number,
                        focusBorderColor: AppColors.transparent,
                        fillColor: const Color(0xFFF9FAFB),
                      ),
                    ),
                    CommonDropdownWidget(
                      labelText: '',
                      //  value: cubit.selectedCurrency,
                      borderRadius: 8,
                      height: 40.h,
                      items: [
                        CurrencyModel(
                            name: 'BTC',
                            url:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
                        CurrencyModel(
                            name: 'ETH',
                            url:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU'),
                      ]
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: e.url,
                                    height: 16.h,
                                    width: 16.w,
                                    placeholder: (context, url) =>
                                        const SizedBox.shrink(),
                                  ),
                                  width(8.w),
                                  AppConstant.commonText(e.name,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ],
                              )))
                          .toList(),
                      backGroundColor: Theme.of(context).colorScheme.onSurface,
                      onChanged: (value) {
                        //cubit.onSelectCurrency(currency: value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            Center(
              child: Container(
                height: 32.h,
                width: 32.w,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimary,
                    ])),
                child: Transform.rotate(
                    angle: 1.57,
                    child: Image.asset(
                      Assets.imagesSwapArrow,
                      height: 16.h,
                      width: 16.h,
                    )),
              ),
            ),
            height(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Collateral needed:',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.outline),
                Text.rich(TextSpan(
                    text: 'Balance : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.outline),
                    children: [
                      TextSpan(
                          text: '12.778',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.outline))
                    ]))
              ],
            ),
            height(10.h),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF9FAFB)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('0',
                      color: Theme.of(context).colorScheme.outline),
                  CommonDropdownWidget(
                    labelText: '',
                    //  value: cubit.selectedReceiveCurrency,
                    borderRadius: 8,
                    height: 40.h,
                    items: [
                      CurrencyModel(
                          name: 'BTC',
                          url:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
                      CurrencyModel(
                          name: 'ETH',
                          url:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU'),
                    ]
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: e.url,
                                  height: 16.h,
                                  width: 16.w,
                                  placeholder: (context, url) =>
                                      const SizedBox.shrink(),
                                ),
                                width(8.w),
                                AppConstant.commonText(e.name,
                                    color: Theme.of(context).colorScheme.shadow,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            )))
                        .toList(),
                    backGroundColor: Theme.of(context).colorScheme.onSurface,
                    onChanged: (value) {
                      // cubit.onSelectReceiveCurrency(currency: value);
                    },
                  ),
                ],
              ),
            ),
            height(14.h),
            CommonButton(
              name: 'Insufficient funds',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const LoanConfirmationDialog(),
                );
              },
            ),
            height(20.h),
            Row(
              children: [
                AppConstant.commonText('Estiated price optimization',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                width(6.w),
                Image.asset(Assets.imagesInfo,
                    height: 16.h,
                    width: 16.w,
                    color: Theme.of(context).colorScheme.onSecondaryContainer)
              ],
            ),
            height(10.h),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: priceOptimizationWidget(
                      context: context,
                      image: Assets.imagesDollarPrice,
                      price: '2110.43 USDC',
                      isSelected: true,
                      profit: '(+\$-0.0111)',
                      time: ''),
                )),
                width(10.w),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: priceOptimizationWidget(
                      context: context,
                      image: Assets.imagesDollarPrice,
                      price: '2110.43 USDC',
                      profit: '',
                      time: '01m 48s'),
                )),
              ],
            ),
            height(30.h),
            rowWidget(
                context: context,
                title: 'Expected debt',
                price: '2139.2812',
                isShowInfo: false),
            height(15.h),
            rowWidget(
                context: context,
                title: 'Borrow fee',
                price: '30.25756705',
                isShowInfo: true,
                textColor: Theme.of(context).colorScheme.onPrimary),
            height(15.h),
            rowWidget(
                context: context,
                title: 'Minimum Loan Term',
                price: '30 days',
                isShowInfo: true),
            height(50.h)
          ],
        ),
      ),
    );
  }

  Widget rowWidget(
      {required BuildContext context,
      required String title,
      required String price,
      bool isShowInfo = false,
      Color? textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        Row(
          children: [
            AppConstant.commonText(price,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: textColor ?? Theme.of(context).colorScheme.shadow),
            width(isShowInfo ? 6.w : 0),
            Visibility(
              visible: isShowInfo,
              child: Image.asset(
                Assets.imagesInfo,
                height: 16.h,
                width: 16.w,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget priceOptimizationWidget(
      {required BuildContext context,
      required String image,
      required String time,
      required String price,
      required String profit,
      bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.onSurface,
          border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context)
                      .colorScheme
                      .onSecondaryContainer
                      .withOpacity(0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(Assets.imagesDollarPrice,
                  height: 18.h,
                  width: 18.w,
                  color: Theme.of(context).colorScheme.outlineVariant),
              width(8.w),
              AppConstant.commonText('Price Optimized',
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600)
            ],
          ),
          height(10.h),
          AppConstant.commonText(time.isEmpty ? 'Time : N / A' : '01m 48s',
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          height(10.h),
          Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                  text: price,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  children: profit.isEmpty
                      ? null
                      : [
                          WidgetSpan(child: width(6.w)),
                          TextSpan(
                              text: profit,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface))
                        ]))
        ],
      ),
    );
  }
}
