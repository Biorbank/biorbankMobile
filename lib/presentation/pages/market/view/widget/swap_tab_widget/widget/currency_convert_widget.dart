import 'dart:io';

import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_select_token_bottom_sheet.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConvertWidget extends StatefulWidget {
  const CurrencyConvertWidget({super.key});

  @override
  State<CurrencyConvertWidget> createState() => _CurrencyConvertWidgetState();
}

class _CurrencyConvertWidgetState extends State<CurrencyConvertWidget> {
  FocusNode? _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    updateState();
  }

  void updateState() async {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    MarketCubit cubit = context.read<MarketCubit>();
    if (db.state.assetList.isNotEmpty) {
      cubit.onSelectPayWithCurrency(currency: db.state.assetList.first);
      cubit.onSelectReceiveCurrency(currency: db.state.assetList.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MarketCubit>();

    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Pay With',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  Text.rich(
                    TextSpan(
                      text: 'Balance : ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      children: [
                        TextSpan(
                          text: '0.0',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              height(14.h),
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
                        autoFocus: true,
                        hintText: "Input Token Amount",
                        focusBorderColor: Theme.of(context).colorScheme.scrim,
                        fillColor: Theme.of(context).colorScheme.scrim,
                        scrollPadding: const EdgeInsets.all(0.0),
                        verticalPading: 0.0,
                        onChanged: (value) {},
                        focusNode: _focusNode,
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
                                cubit.onSelectPayWithCurrency(
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
                                "${AppHelper.appDir}/${cubit.selectedPayWithCurrency?.getAsset().logo}"),
                            height: 16.h,
                            width: 16.w,
                            fit: BoxFit.cover,
                          ),
                          width(8.w),
                          AppConstant.commonText(
                            cubit.selectedPayWithCurrency?.getAsset().symbol ??
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
              height(15.h),
              // Swap arrow
              Center(
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.onPrimary,
                      ],
                    ),
                  ),
                  child: Transform.rotate(
                    angle: 1.57,
                    child: Image.asset(
                      Assets.imagesSwapArrow,
                      height: 16.h,
                      width: 16.h,
                    ),
                  ),
                ),
              ),
              height(15.h),
              // Receive amount and currency dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Receive',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  Text.rich(TextSpan(
                      text: 'Balance : ',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      children: [
                        TextSpan(
                            text: '0.0',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer))
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
                        autoFocus: true,
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
                                cubit.onSelectReceiveCurrency(
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
                                "${AppHelper.appDir}/${cubit.selectedReceiveCurrency?.getAsset().logo}"),
                            height: 16.h,
                            width: 16.w,
                            fit: BoxFit.cover,
                          ),
                          width(8.w),
                          AppConstant.commonText(
                            cubit.selectedReceiveCurrency?.getAsset().symbol ??
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
            ],
          ),
        );
      },
    );
  }
}
