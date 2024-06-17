import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/header.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/limit_bottomsheet_widget.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/p2p_card_widget.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/payment_method_sheet.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class P2pMarketScreen extends StatelessWidget {
  const P2pMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<P2pMarketCubit, P2pMarketState>(
        builder: (context, state) {
          var cubit = context.read<P2pMarketCubit>();
          if (state is CurrencySelectedState) {
            cubit.selectedCurrency = state.currency;
          } else if (state is CountrySelectedState) {
            cubit.selectedCountry = state.country;
          } else if (state is PaymentMethodSheetStatusState) {
            cubit.isOpenPaymentMethodSheet = state.isOpen;
          } else if (state is LimitSheetStatus) {
            cubit.isOpenLimitSheet = state.isOpen;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonBlueContainer(
                  height: 151.h,
                  child: P2PHeader(
                    selectedCountry: cubit.selectedCountry,
                    selectedCurrency: cubit.selectedCurrency,
                    onChangedCountry: (value) {
                      cubit.onChangeCountry(country: value);
                    },
                    onChangedCurrency: (value) {
                      cubit.onChangeCurrency(currency: value);
                    },
                  )),
              height(22.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buttonTile(
                              context: context,
                              isOpen: cubit.isOpenLimitSheet,
                              onTap: () async {
                                cubit.onTapLimitButton(value: true);
                                await showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onSurface,
                                  context: context,
                                  builder: (context) =>
                                      const LimitBottomsheetWidget(),
                                ).then((value) =>
                                    cubit.onTapLimitButton(value: false));
                              },
                              title: 'Limit'),
                          width(15.w),
                          buttonTile(
                              context: context,
                              isOpen: cubit.isOpenPaymentMethodSheet,
                              onTap: () async {
                                cubit.onTapPaymentMethodButton(value: true);
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onSurface,
                                  context: context,
                                  builder: (context) =>
                                      const PaymentMethodSheet(),
                                ).then((value) => cubit
                                    .onTapPaymentMethodButton(value: false));
                              },
                              title: 'Payment method'),
                        ],
                      ),
                      height(15.h),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => height(25.h),
                          itemCount: 8,
                          itemBuilder: (context, index) => p2pCardWidget(
                              context: context,
                              title: 'Fabulous',
                              orders: '9 Order(s) 82%',
                              cs: '1.33',
                              limit: 'cs 13 - 50',
                              quantity: '260.4 USDT',
                              status: 'Online',
                              onTapBuy: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buttonTile(
      {required bool isOpen,
      required String title,
      required BuildContext context,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
            border: Border.all(
                color: isOpen
                    ? Theme.of(context).colorScheme.onPrimary
                    : AppColors.transparent),
            borderRadius: BorderRadius.circular(25.r),
            color: Theme.of(context).colorScheme.errorContainer),
        child: Row(
          children: [
            AppConstant.commonText(title,
                fontWeight: FontWeight.w500,
                color: isOpen
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondaryContainer),
            width(8.w),
            Transform.rotate(
              angle: isOpen ? 3.13 : 0,
              child: Image.asset(
                Assets.imagesChevronDown,
                color: isOpen
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.shadow,
                height: 18.h,
                width: 18.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
