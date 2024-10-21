import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/card_widget.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/history_detail_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/service/pay_with_moon_service.dart';

import '../../../../../utils/service/pay_with_moon_service.dart';

class DebitTabWidget extends StatelessWidget {
  const DebitTabWidget(
      {super.key,
      required this.isVisibleCardNumber,
      required this.onTapEyeButton,
      required this.onTapBlocButton,
      required this.onTapSettingButton});
  final bool isVisibleCardNumber;
  final VoidCallback onTapEyeButton;
  final VoidCallback onTapBlocButton;
  final VoidCallback onTapSettingButton;
  @override
  Widget build(BuildContext context) {
    //final card = await fetchCard("1");
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardWidget(
                cardNumber: '5354 5667 1108 8816',
                cvvNumber: '533',
                expiryDate: '02/28',
                isObscureText: !isVisibleCardNumber,
              ),
              height(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTapEyeButton,
                      child: commonCardWidget(
                          context: context,
                          icon: isVisibleCardNumber
                              ? Assets.imagesEyeHide
                              : Assets.imagesEye,
                          title: isVisibleCardNumber
                              ? 'Hide details'
                              : 'Show details'),
                    ),
                    commonCardWidget(
                        context: context,
                        icon: Assets.imagesCloseCircle,
                        title: 'Block'),
                    commonCardWidget(
                        context: context,
                        icon: Assets.imagesSetting,
                        title: 'Setting'),
                  ],
                ),
              )
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 1,
          builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        spreadRadius: 0,
                        offset: const Offset(2, 4),
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(0.25))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r))),
              child: HistoryDetailWidget(
                scrollController: scrollController,
              )),
        )
      ],
    );
  }

  Widget commonCardWidget(
      {required BuildContext context,
      required String icon,
      required String title}) {
    return Container(
      width: 101.w,
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.inversePrimary),
      child: Column(
        children: [
          height(12.h),
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onSurface),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                icon,
                height: 20.h,
                width: 20.w,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
          ),
          height(8.h),
          AppConstant.commonText(title,
              color: Theme.of(context).colorScheme.shadow)
        ],
      ),
    );
  }
}
