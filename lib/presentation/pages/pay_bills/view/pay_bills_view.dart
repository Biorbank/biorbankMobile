import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/custom_dropdown_widget.dart';

class PayBillsView extends StatelessWidget {
  const PayBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          height(20.h),
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            title: 'Payee',
            labelText: 'Select payee',
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
                      hintText: '\$0',
                      isShowSpaceAfterTitle: false,
                      verticalPading: 0,
                      inputType: TextInputType.number,
                      focusBorderColor: AppColors.transparent,
                    ),
                  ),
                  CommonDropdownWidget(
                    labelText: 'USD',
                    borderRadius: 8,
                    isUseBackgroundColor: false,
                    height: 40.h,
                    items: ['ETH', 'BTC']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: AppConstant.commonText(e,
                                  color: Theme.of(context).colorScheme.shadow,
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
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            // value: cubit.selectedCoin,
            title: 'From Account',
            labelText: 'Select payee',
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
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            // value: cubit.selectedCoin,
            title: 'How Often',
            labelText: 'Once',
            items: ['Once', '2 Time']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: AppConstant.commonText(e,
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.shadow),
                    ))
                .toList(),
            backGroundColor: Theme.of(context).colorScheme.errorContainer,
            onChanged: (p0) {},
          ),
          height(18.h),
          AppConstant.commonText('Date',
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
          height(8.h),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).colorScheme.errorContainer),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Feb 28, 2024',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                Image.asset(
                  Assets.imagesCalendar,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          height(20.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesInfo,
                      height: 16.h,
                      width: 16.w,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                    width(8.w),
                    Expanded(
                      child: AppConstant.commonText(
                          'All bill payments are processed in ET time zome.',
                          fontSize: 12.sp,
                          color: Theme.of(context).colorScheme.shadow),
                    )
                  ],
                ),
                height(8.h),
                AppConstant.commonText(
                    'When will my bill payment be processed?',
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onPrimary),
              ],
            ),
          ),
          height(20.h),
          CommonButton(name: 'Continue',onTap: (){},),
          height(30.h)
        ]),
      ),
    );
  }
}
