import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_text_button.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/p2p_buttomsheet.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class P2PHeader extends StatelessWidget {
  const P2PHeader(
      {super.key,
      required this.selectedCountry,
      required this.selectedCurrency,
      required this.onChangedCurrency,
      required this.onChangedCountry});

  final CurrencyModel? selectedCountry;
  final CurrencyModel? selectedCurrency;
  final Function(CurrencyModel?) onChangedCurrency;
  final Function(CurrencyModel?) onChangedCountry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.router.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 20,
                ),
              ),
              CommonDropdownWidget(
                labelText: '',
                value: 'P2P',
                isExpanded: false,
                height: 30.h,
                arrowColor: Theme.of(context).colorScheme.onSurface,
                isUseBackgroundColor: false,
                itemBackGroundColor: Theme.of(context).colorScheme.onPrimary,
                textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
                items: ['P2P']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: AppConstant.commonText(e,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onSurface),
                        ))
                    .toList(),
                onChanged: (p0) {},
              ),
              Row(
                children: [
                  AppConstant.commonText('CAD',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface),
                  width(8.w),
                  Image.asset(
                    Assets.imagesSwapArrow,
                    height: 14.h,
                    width: 14.w,
                  ),
                  width(15.w),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: false,
                        shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        context: context,
                        builder: (context) => const P2pButtomsheetWidget(),
                      );
                    },
                    child: Icon(
                      Icons.more_horiz,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                ],
              ),
            ],
          ),
          height(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  width(6),
                  CommonTextButton(
                    name: 'Buy',
                    onTap: () {},
                  ),
                  width(14.w),
                  CommonTextButton(
                    name: 'Sell',
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    child: CommonDropdownWidget(
                      labelText: '',
                      value: selectedCurrency,
                      isExpanded: false,
                      height: 30.h,
                      dropDownArrow: Assets.imagesArrowDropDown,
                      backGroundColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.2),
                      arrowColor: Theme.of(context).colorScheme.onSurface,
                      itemBackGroundColor:
                          Theme.of(context).colorScheme.onPrimary,
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.shadow,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                      items: context
                          .read<P2pMarketCubit>()
                          .currencyList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: e.url,
                                      height: 16.h,
                                      width: 16.w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const SizedBox.shrink(),
                                    ),
                                    width(6.w),
                                    AppConstant.commonText(e.name,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: onChangedCurrency,
                    ),
                  ),
                  width(8.w),
                  CommonDropdownWidget(
                    labelText: '',
                    value: selectedCountry,
                    isExpanded: false,
                    height: 30.h,
                    dropDownArrow: Assets.imagesArrowDropDown,
                    backGroundColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.2),
                    arrowColor: Theme.of(context).colorScheme.onSurface,
                    itemBackGroundColor:
                        Theme.of(context).colorScheme.onPrimary,
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.shadow,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700),
                    items: context
                        .read<P2pMarketCubit>()
                        .countryList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: e.url,
                                    height: 16.h,
                                    width: 16.w,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const SizedBox.shrink(),
                                  ),
                                  width(6.w),
                                  AppConstant.commonText(e.name,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: onChangedCountry,
                  ),
                  width(10.w),
                  InkWell(
                      onTap: () {
                        context.router.push(const MyOrderRoute());
                      },
                      child: Image.asset(
                        Assets.imagesFile,
                        height: 20.h,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
