import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_text_button.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/deposit/cubit/deposit_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoTabWidget extends StatelessWidget {
  const CryptoTabWidget(
      {super.key,
      required this.onChangedAccount,
      required this.onChangedNetwork,
      required this.onChangedCoin,
      required this.imageUrl,
      required this.onChangedUSDTaddress,
      required this.onTapCopyAddress,
      required this.onTapShowQRcode});
  final Function(dynamic) onChangedAccount;
  final Function(dynamic) onChangedNetwork;
  final Function(dynamic) onChangedCoin;
  final Function(dynamic) onChangedUSDTaddress;
  final VoidCallback onTapCopyAddress;
  final VoidCallback onTapShowQRcode;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<DepositCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(25.h),
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            labelText: 'Select receipent',
            title: 'Form an account',
            items: const [],
            backGroundColor: Theme.of(context).colorScheme.errorContainer,
            onChanged: onChangedAccount,
          ),
          height(18.h),
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            labelText: '',
            value: cubit.selectedNetwork,
            title: 'Choose a network',
            items: cubit.networkList
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: e.url,
                          height: 22.h,
                          width: 22.w,
                          fit: BoxFit.cover,
                        ),
                        width(8.w),
                        AppConstant.commonText(e.name,
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.shadow),
                      ],
                    )))
                .toList(),
            backGroundColor: Theme.of(context).colorScheme.errorContainer,
            onChanged: onChangedNetwork,
          ),
          height(18.h),
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            value: cubit.selectedCoin,
            labelText: '',
            title: 'Select a coin',
            items: cubit.networkList
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: e.url,
                          height: 22.h,
                          width: 22.w,
                          fit: BoxFit.cover,
                        ),
                        width(8.w),
                        AppConstant.commonText(e.name,
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.shadow),
                      ],
                    )))
                .toList(),
            backGroundColor: Theme.of(context).colorScheme.errorContainer,
            onChanged: onChangedCoin,
          ),
          height(18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppConstant.commonText('Deposit address',
                  fontSize: 14.sp,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.shadow),
              Row(
                children: [
                  AppConstant.commonText('Manage address',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimary),
                  width(4.w),
                  Image.asset(Assets.imagesArrowRight,
                      height: 13.h,
                      width: 13.w,
                      color: Theme.of(context).colorScheme.onPrimary)
                ],
              )
            ],
          ),
          height(12.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: 50.h,
                        width: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    width(15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppConstant.commonText('USDT address',
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          height(8.h),
                          CommonDropdownWidget(
                            isExpanded: true,
                            borderRadius: 12.r,
                            labelText: '',
                            value: cubit.selectedQr,
                            items: cubit.qrCodeList
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: AppConstant.commonText(e,
                                          fontSize: 14.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow),
                                    ))
                                .toList(),
                            backGroundColor:
                                Theme.of(context).colorScheme.errorContainer,
                            onChanged: onChangedUSDTaddress,
                          ),
                          height(8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextButton(
                                name: 'Copy address',
                                fontSize: 12.sp,
                                icon: Image.asset(
                                  Assets.imagesCopyRounded,
                                  height: 14.h,
                                  width: 14.w,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fit: BoxFit.cover,
                                ),
                                textColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onTap: onTapCopyAddress,
                              ),
                              CommonTextButton(
                                name: 'Show QR Code',
                                fontSize: 12.sp,
                                icon: Image.asset(
                                  Assets.imagesQrCode,
                                  height: 14.h,
                                  width: 14.w,
                                  fit: BoxFit.cover,
                                ),
                                textColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onTap: onTapShowQRcode,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          height(50.h)
        ],
      ),
    );
  }
}
