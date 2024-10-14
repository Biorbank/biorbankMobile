import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_select_token_bottom_sheet.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConvertWidget extends StatelessWidget {
  const CurrencyConvertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        var cubit = context.read<MarketCubit>();

        if (state is CurrncySelectedState) {
          cubit.selectedCurrency = state.currency;
        } else if (state is ReceiveCurrncySelectedState) {
          cubit.selectedReceiveCurrency = state.currency;
        }

        final selectedCurrency =
            cubit.currencyList.contains(cubit.selectedCurrency)
                ? cubit.selectedCurrency
                : cubit.currencyList.first;
        final selectedReceiveCurrency =
            cubit.receiveCurrencyList.contains(cubit.selectedReceiveCurrency)
                ? cubit.selectedReceiveCurrency
                : cubit.receiveCurrencyList[1];

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
                            return const CommonSelectTokenBottomSheet();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png",
                            height: 16.h,
                            width: 16.w,
                            placeholder: (context, url) =>
                                const SizedBox.shrink(),
                          ),
                          width(8.w),
                          AppConstant.commonText(
                            "BTC",
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
                            return const CommonSelectTokenBottomSheet();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png",
                            height: 16.h,
                            width: 16.w,
                            placeholder: (context, url) =>
                                const SizedBox.shrink(),
                          ),
                          width(8.w),
                          AppConstant.commonText(
                            "BTC",
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
