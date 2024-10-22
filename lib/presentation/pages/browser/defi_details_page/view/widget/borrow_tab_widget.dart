import 'dart:io';

import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_select_token_bottom_sheet.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/loan_confirmation_dialog.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorrowTabWidget extends StatefulWidget {
  const BorrowTabWidget({super.key});

  @override
  State<BorrowTabWidget> createState() => _BorrowTabWidgetState();
}

class _BorrowTabWidgetState extends State<BorrowTabWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateState();
  }

  void updateState() async {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    var cubit = context.read<DefiDetailCubit>();
    if (db.state.assetList.isNotEmpty) {
      CryptoAssetRepositoryImpl tokenUSDT = db.state.assetList.firstWhere(
          (e) => e.getAsset().symbol == "USDT" && e.getAsset().networkId == 1);
      CryptoAssetRepositoryImpl tokenBTC = db.state.assetList.firstWhere(
          (e) => e.getAsset().symbol == "BTC" && e.getAsset().networkId == 0);
      cubit.onSelectBorrowCurrency(currency: tokenUSDT);
      cubit.onSelectCollateralCurrency(currency: tokenBTC);
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<DefiDetailCubit>();

    return BlocBuilder<DefiDetailCubit, DefiDetailState>(
        builder: (context, state) {
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
                          isShowSpaceAfterTitle: false,
                          borderRadius: 0.0,
                          title: '',
                          hintText: "Input Token Amount",
                          focusBorderColor: Theme.of(context).colorScheme.scrim,
                          fillColor: Theme.of(context).colorScheme.scrim,
                          scrollPadding: const EdgeInsets.all(0.0),
                          verticalPading: 0.0,
                          onChanged: (value) {},
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            scrollControlDisabledMaxHeightRatio: 4 / 5,
                            shape: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            builder: (context) {
                              return CommonSelectTokenBottomSheet(
                                onTap: (selectedAsset) {
                                  cubit.onSelectBorrowCurrency(
                                      currency: selectedAsset);
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Image.file(
                              File(
                                  "${AppHelper.appDir}/${cubit.selectedBorrowCurrency?.getAsset().logo}"),
                              height: 16.h,
                              width: 16.w,
                              fit: BoxFit.cover,
                            ),
                            width(8.w),
                            AppConstant.commonText(
                              cubit.selectedBorrowCurrency?.getAsset().symbol ??
                                  "",
                              color: Theme.of(context).colorScheme.shadow,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            width(8.w),
                            Image.asset(
                              Assets.imagesChevronDown,
                              height: 18,
                              color: Theme.of(context).colorScheme.shadow,
                            )
                          ],
                        ),
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
                    Expanded(
                      child: CommonTextfield(
                        isShowSpaceAfterTitle: false,
                        borderRadius: 0.0,
                        title: '',
                        hintText: "Input Token Amount",
                        focusBorderColor: Theme.of(context).colorScheme.scrim,
                        fillColor: Theme.of(context).colorScheme.scrim,
                        scrollPadding: const EdgeInsets.all(0.0),
                        verticalPading: 0.0,
                        onChanged: (value) {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          scrollControlDisabledMaxHeightRatio: 4 / 5,
                          shape: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                          builder: (context) {
                            return CommonSelectTokenBottomSheet(
                              onTap: (selectedAsset) {
                                cubit.onSelectCollateralCurrency(
                                    currency: selectedAsset);
                              },
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Image.file(
                            File(
                                "${AppHelper.appDir}/${cubit.selectedCollateralCurrency?.getAsset().logo}"),
                            height: 16.h,
                            width: 16.w,
                            fit: BoxFit.cover,
                          ),
                          width(8.w),
                          AppConstant.commonText(
                            cubit.selectedCollateralCurrency
                                    ?.getAsset()
                                    .symbol ??
                                "",
                            color: Theme.of(context).colorScheme.shadow,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          width(8.w),
                          Image.asset(
                            Assets.imagesChevronDown,
                            height: 18,
                            color: Theme.of(context).colorScheme.shadow,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              height(14.h),
              CommonButton(
                name: 'confirm',
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
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
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
                        imageColor: Theme.of(context).colorScheme.surfaceTint,
                        profit: '(+\$-0.0111)',
                        time: ''),
                  )),
                  width(10.w),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: priceOptimizationWidget(
                        context: context,
                        image: Assets.imagesWatch,
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
    });
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
      Color? imageColor,
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
              Image.asset(image, height: 18.h, width: 18.w, color: imageColor),
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
