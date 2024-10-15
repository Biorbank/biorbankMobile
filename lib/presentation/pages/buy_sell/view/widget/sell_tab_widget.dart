import 'dart:math';

import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/buy_sell/cubit/buysell_cubit.dart';
import 'package:biorbank/presentation/pages/buy_sell/view/widget/select_payment_method_sheet.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellTabWidget extends StatelessWidget {
  const SellTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 80), 0);
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SingleChildScrollView(
        child: BlocBuilder<BuySellCubit, BuysellState>(
          builder: (context, state) {
            var cubit = context.read<BuySellCubit>();
            if (state is RegionSelectedState) {
              cubit.selectedRegion = state.region;
            } else if (state is PaymentMethodConfirmedState) {
              cubit.confirmedPaymentMethod = state.paymentMethod;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(25.h),
                CommonDropdownWidget<CurrencyModel>(
                  isExpanded: true,
                  maxHeight: 250,
                  borderRadius: 12.r,
                  value: cubit.selectedRegion,
                  labelText: 'Select region',
                  title: 'Your Region',
                  items: cubit.regionList
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: e.url,
                                height: 16.h,
                                width: 22.w,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const SizedBox.shrink(),
                              ),
                              width(8.w),
                              AppConstant.commonText(e.name,
                                  color: Theme.of(context).colorScheme.shadow),
                            ],
                          )))
                      .toList(),
                  backGroundColor: Theme.of(context).colorScheme.errorContainer,
                  onChanged: (value) {
                    cubit.onSelectRegion(region: value);
                  },
                  dropdownSearchData: DropdownSearchData(
                    searchController: cubit.religionTextController,
                    searchInnerWidgetHeight: 200,
                    searchInnerWidget: Column(
                      children: [
                        height(10.h),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              borderRadius: BorderRadius.circular(30.r)),
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: cubit.religionTextController,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.shadow),
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  Assets.imagesSearch,
                                  height: 20.h,
                                  width: 20.w,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Serch Region..',
                              hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value?.name ?? '')
                          .toString()
                          .toLowerCase()
                          .contains(searchValue);
                    },
                  ),
                ),
                height(18.h),
                AppConstant.commonText('Payment Method',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                height(8.h),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: false,
                        useRootNavigator: true,
                        shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        context: context,
                        builder: (context) => const SelectPaymentMethodSheet());
                  },
                  child: Container(
                      height: 45.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Theme.of(context).colorScheme.errorContainer),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Visibility(
                          visible: cubit.confirmedPaymentMethod.isNotEmpty,
                          replacement: Align(
                            alignment: Alignment.centerLeft,
                            child: AppConstant.commonText(
                                'Select payment method',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                textAlign: TextAlign.left,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    cubit.confirmedPaymentMethod['image_url'] ??
                                        '',
                                height: 24.h,
                                width: 24.w,
                                placeholder: (context, url) =>
                                    const SizedBox.shrink(),
                              ),
                              width(8.w),
                              AppConstant.commonText(
                                  cubit.confirmedPaymentMethod[
                                          'payment_name'] ??
                                      '',
                                  color: Theme.of(context).colorScheme.shadow)
                            ],
                          ),
                        ),
                      )),
                ),
                height(18.h),
                CommonDropdownWidget(
                  isExpanded: true,
                  borderRadius: 12.r,
                  // value: cubit.selectedCoin,
                  labelText: 'Select destination account',
                  title: 'Select an account',
                  items: []
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: AppConstant.commonText(e.name,
                                fontSize: 14.sp,
                                color: Theme.of(context).colorScheme.shadow),
                          ))
                      .toList(),
                  backGroundColor: Theme.of(context).colorScheme.errorContainer,
                  onChanged: (p0) {},
                ),
                height(18.h),
                AppConstant.commonText('You want to sell',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                height(8.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Theme.of(context).colorScheme.errorContainer),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonTextfield(
                            title: '',
                            isShowSpaceAfterTitle: false,
                            verticalPading: 0,
                            inputType: TextInputType.number,
                            focusBorderColor: AppColors.transparent,
                          ),
                        ),
                        CommonDropdownWidget(
                          labelText: 'BTC',
                          borderRadius: 8,
                          height: 40.h,
                          isUseBackgroundColor: false,
                          items: ['ETH', 'BTC']
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: AppConstant.commonText(e,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ))
                              .toList(),
                          //backGroundColor: Theme.of(context).colorScheme.onSurface,
                          onChanged: (value) {
                            //cubit.onSelectCurrency(currency: value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                height(18.h),
                AppConstant.commonText('Amount',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                height(8.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Theme.of(context).colorScheme.errorContainer),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonTextfield(
                            title: '',
                            scrollPadding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            isShowSpaceAfterTitle: false,
                            hintText: '\$0',
                            verticalPading: 0,
                            inputType: TextInputType.number,
                            focusBorderColor: AppColors.transparent,
                          ),
                        ),
                        CommonDropdownWidget(
                          labelText: 'ETH',
                          borderRadius: 8,
                          isUseBackgroundColor: false,
                          height: 40.h,
                          items: ['ETH', 'BTC']
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: AppConstant.commonText(e,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //cubit.onSelectCurrency(currency: value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                height(18.h),
                CommonButton(
                  name: 'Continue',
                  onTap: () {},
                ),
                height(30.h),
              ],
            );
          },
        ),
      ),
    );
  }
}