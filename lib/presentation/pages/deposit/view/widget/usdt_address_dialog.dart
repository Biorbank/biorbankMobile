import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class UsdtAddressDialog extends StatelessWidget {
  const UsdtAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(10.h),
                      Row(
                        children: [
                          width(40.w),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: AppConstant.commonText('USDT address',
                                  fontSize: 14.sp,
                                  textAlign: TextAlign.right,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ))
                        ],
                      ),
                      height(20.h),
                      Center(
                        child: SizedBox(
                          height: 189.h,
                          width: 189.w,
                          child: PrettyQrView.data(
                            data: '0z1x9c2v8b3n7m4a6s5d0f1g',
                            decoration: const PrettyQrDecoration(
                              shape: PrettyQrSmoothSymbol(roundFactor: 0),
                              image: PrettyQrDecorationImage(
                                fit: BoxFit.cover,
                                padding: EdgeInsets.all(10),
                                image: CachedNetworkImageProvider(
                                    'https://public.bnbstatic.com/static/academy/uploads/2fd4345d8c3a46278941afd9ab7ad225.png',
                                    maxHeight: 40,
                                    maxWidth: 40),
                              ),
                            ),
                          ),
                        ),
                      ),
                      height(30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText('Network',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width(8.w),
                              AppConstant.commonText('Etherium',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                            ],
                          )
                        ],
                      ),
                      height(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText('Coin',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          AppConstant.commonText('USDT',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                        ],
                      ),
                      height(15.h),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppConstant.commonText('0z1x9c2v8b3n7m4a6s5d0f1g',
                                fontSize: 12.sp,
                                color: Theme.of(context).colorScheme.shadow),
                            width(10.w),
                            InkWell(
                              onTap: () {
                                Clipboard.setData(const ClipboardData(
                                    text: '0z1x9c2v8b3n7m4a6s5d0f1g'));
                              },
                              child: Image.asset(
                                Assets.imagesCopyRounded,
                                height: 16.h,
                                width: 16.w,
                                color: Theme.of(context).colorScheme.shadow,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      height(20.h),
                    ]))));
  }
}
