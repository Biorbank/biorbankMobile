import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.cardNumber,
      required this.cvvNumber,
      required this.expiryDate,
      this.onTapVirtualButton,
      this.isObscureText = false});
  final String cardNumber;
  final String expiryDate;
  final String cvvNumber;
  final VoidCallback? onTapVirtualButton;
  final bool isObscureText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.onPrimary,
                  ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(8.h),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 67.w,
                    child: CommonButton(
                      height: 34.h,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      name: 'Virtual',
                      onTap: onTapVirtualButton,
                      fontSize: 12.sp,
                      buttonColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                height(15.h),
                AppConstant.commonText('Card Number',
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                height(8.h),
              isObscureText
                        ? isObscureTextWidget(number: 16)
                        :   Row(
                  children: [
                    AppConstant.commonText(cardNumber,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurface),
                    width(12.w),
                    Visibility(
                      visible: !isObscureText,
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: cardNumber));
                        },
                        child: Image.asset(
                          Assets.imagesCopyRounded,
                          height: 16.h,
                          width: 16.w,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    )
                  ],
                ),
                height(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppConstant.commonText('Expiry date',
                                fontSize: 12.sp,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            height(8.h),
                            isObscureText
                                ? Row(
                                    children: [
                                      isObscureTextWidget(number: 2),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 3),
                                        child: AppConstant.commonText('/',fontSize: 16.sp),
                                      ),
                                      isObscureTextWidget(number: 2),
                                    ],
                                  )
                                : AppConstant.commonText(expiryDate,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ],
                        ),
                        width(25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppConstant.commonText('CVV',
                                fontSize: 12.sp,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            height(8.h),
                           isObscureText? isObscureTextWidget(number: 3) :  Row(
                              children: [
                                AppConstant.commonText(cvvNumber,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                                width(8.w),
                                Visibility(
                                  visible: !isObscureText,
                                  child: GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: cvvNumber));
                                    },
                                    child: Image.asset(
                                      Assets.imagesCopyRounded,
                                      height: 16.h,
                                      width: 16.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.imagesCardLogo,
                      height: 33.h,
                      width: 60.w,
                    )
                  ],
                ),
                height(6.h)
              ],
            ),
          ),
        ),
        Image.asset(Assets.imagesWhiteShadow)
      ],
    );
  }
}

Widget isObscureTextWidget({required int number}) {
  List<Widget> dots = [];

  for (int i = 0; i < number; i++) {
    dots.add(AppConstant.commonText('.', fontSize: 26.sp));

    if ((i + 1) % 4 == 0 && i != number - 1) {
      dots.add(width(8.w)); // Space after every 4 dots, except the last set
    }
  }

  return Baseline(
    baseline: 10,
    baselineType: TextBaseline.alphabetic,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    ),
  );
}
