import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillAmountDialog extends StatelessWidget {
  const FillAmountDialog({super.key, required this.isTransferAccess});
  final bool isTransferAccess;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        if(isTransferAccess)
                        AppConstant.commonText('Fill amount',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                        const Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              alignment: Alignment.centerRight,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              )),
                        )
                      ],
                    ),
                    height(10.h),
                    if(isTransferAccess)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(0.5))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppConstant.commonText('To',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                              ),
                              Expanded(
                                child: AppConstant.commonText(
                                    '0xD55c9A80395Cd7788642F542F546D6cca01c692Af3a',
                                    fontWeight: FontWeight.w500,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                              ),
                            ],
                          ),
                          height(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppConstant.commonText('Asset',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 24.h,
                                      width: 24.w,
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png',
                                        height: 11.h,
                                        width: 18.w,
                                        placeholder: (context, url) =>
                                            const SizedBox.shrink(),
                                      ),
                                    ),
                                    width(10.w),
                                    AppConstant.commonText('Ethereum',
                                        fontWeight: FontWeight.w500,
                                        maxLines: 1,
                                        fontSize: 16.sp,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    height(20.h),
                    if(isTransferAccess)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppConstant.commonDivider(),
                          height(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.add,
                                        size: 18.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    width(10.w),
                                    Expanded(
                                      child: AppConstant.commonText(
                                          'Add Address To Contacts',
                                          maxLines: 2,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppConstant.commonText('Advanced',
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                    width(10.w),
                                    Image.asset(
                                      Assets.imagesEdit,
                                      height: 20.h,
                                      width: 20.w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          height(15.h),
                        ],
                      ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                  child: CommonTextfield(
                                title: 'Max Fee',
                              )),
                              width(10.w),
                              const Expanded(
                                  child: CommonTextfield(title: 'Priority IP')),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CommonTextfield(
                                      title: 'Nonce',
                                      onTapSuffixWidget: () {},
                                      suffixWidget: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Image.asset(
                                          Assets.imagesInfo,
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                      ))),
                              width(10.w),
                              Expanded(
                                  child: CommonTextfield(
                                      title: 'Gas Limits (Units)',
                                      onTapSuffixWidget: () {},
                                      suffixWidget: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Image.asset(
                                          Assets.imagesInfo,
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                      ))),
                            ],
                          ),
                          height(16.h),
                          AppConstant.commonDivider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(0.3)),
                          height(25.h),
                          commonRowWidget(
                              context: context,
                              title: 'Estimates time',
                              price: '>30 Second'),
                          height(16.h),
                          commonRowWidget(
                              context: context,
                              title: 'Expected Fee',
                              price: '\$11.32 USD',
                              secondPrice: '0.003278 ETH'),
                          height(16.h),
                          commonRowWidget(
                              context: context,
                              title: 'Max fee you’ll pay',
                              price: '\$14.12 USD',
                              secondPrice: '0.003278 ETH'),
                        ],
                      ),
                    height(16.h),
                    commonRowWidget(
                        context: context,
                        title: 'Network Fee',
                        price: '\$14.12 USD',
                        isVisibleInfo: true,
                        titleTextColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        secondPrice: '0.003278 ETH'),
                    height(10.h),
                    Row(
                      children: [
                        Expanded(
                            child: CommonOutlinedButton(
                                height: 48,
                                textColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                borderColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                title: 'Cancel')),
                        width(8.w),
                        Expanded(
                          child: CommonButton(
                            name: isTransferAccess ? 'Transfer' : 'Sell',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                    height(16.h)
                  ]),
            )));
  }

  Widget commonRowWidget(
      {required BuildContext context,
      required String title,
      required String price,
      String? secondPrice,
      bool isVisibleInfo = false,
      Color? titleTextColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(children: [
            AppConstant.commonText(title,
                color: titleTextColor ?? Theme.of(context).colorScheme.shadow),
            width(5.w),
            Visibility(
              visible: isVisibleInfo,
              child: Image.asset(
                Assets.imagesInfo,
                height: 18.h,
                width: 18.w,
              ),
            ),
          ]),
        ),
        width(10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppConstant.commonText(price,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.shadow),
              height(4.h),
              Visibility(
                visible: secondPrice != null,
                child: AppConstant.commonText(secondPrice ?? '',
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
