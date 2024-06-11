import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/risk_detail_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoanConfirmationDialog extends StatelessWidget {
  const LoanConfirmationDialog({super.key});

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
                      AppConstant.commonText('Confirm',
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
                  AppConstant.commonText('Borrow',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  height(10.h),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryFixed)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                              height: 20.h,
                              width: 20.w,
                              placeholder: (context, url) =>
                                  const SizedBox.shrink(),
                            ),
                            width(8.w),
                            AppConstant.commonText('BTC',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow),
                          ],
                        ),
                        AppConstant.commonText('For',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU',
                              height: 20.h,
                              width: 20.w,
                              placeholder: (context, url) =>
                                  const SizedBox.shrink(),
                            ),
                            width(8.w),
                            AppConstant.commonText('Ethereum',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow),
                          ],
                        ),
                      ],
                    ),
                  ),
                  height(25.h),
                  commonRowTile(
                      context: context,
                      title: 'Collateral',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU',
                      price: '0.1 ETH'),
                  height(18.h),
                  commonRowTile(
                      context: context,
                      title: 'Slippage',
                      price: '0.00000165 ETH'),
                   height(18.h),
                  commonRowTile(
                      context: context,
                      title: 'Collateral after slippage',
                      price: '0.0.0999983 ETH'),
                  height(18.h),
                  AppConstant.commonDivider(),
                  height(18.h),
                  commonRowTile(
                      context: context,
                      title: 'Borrow',
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                      price: '47.6097 BTC'),
                    height(18.h),
                  commonRowTile(
                      context: context,
                      title: 'Expected debt',
                      price: '71.3598'),
                   height(18.h),
                  commonRowTile(
                      context: context,
                      title: 'Estimated time',
                      price: '1m 32s'),
                   height(18.h),
                  RiskDetailsWidget(
                    onTapRiskButton: () {},
                    margin: EdgeInsets.zero,
                  ),
                  height(22.h),
                  CommonButton(
                    height: 40.h,
                    name: 'Confirm',onTap: (){},),
                  height(20.h)
                ]))));
  }

  Widget commonRowTile(
      {required BuildContext context,
      required String title,
      String imageUrl = '',
      required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        Row(
          children: [
            Visibility(
              visible: imageUrl.isNotEmpty,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 20.h,
                width: 20.w,
                placeholder: (context, url) => const SizedBox.shrink(),
              ),
            ),
            width(8.w),
            AppConstant.commonText(price,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
          ],
        )
      ],
    );
  }
}
