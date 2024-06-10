import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    height(14.h),
                    CommonAppbar(
                      fontSize: 20.sp,
                      mainAxisAlignment: MainAxisAlignment.start,
                      titleWidth: 80.w,
                      title: AppStrings.sendMoney,
                    ),
                    height(40.h),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 4, right: 10, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            width(10.w),
                            AppConstant.commonText('Goatskey',
                                fontSize: 16.sp,
                                color: Theme.of(context).colorScheme.shadow)
                          ],
                        ),
                      ),
                    ),
                    height(40.h),
                    SizedBox(
                      width: 150.w,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppConstant.commonText('\$',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          width(8.w),
                          Expanded(
                            child: CommonTextfield(
                              isFilled: true,
                              autoFocus: true,
                              inputType: TextInputType.number,
                              verticalPading: 0,
                              title: '',
                              textStyle: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                              focusBorderColor: AppColors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height(16.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppConstant.commonText('Main',
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.shadow),
                          width(10.w),
                          Container(
                            height: 4.h,
                            width: 4.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(0.5),
                            ),
                          ),
                          CommonDropdownWidget(
                            labelText: '',
                            value: '\$30.0',
                            isExpanded: false,
                            height: 30.h,
                            textStyle: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                            backGroundColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            items: ['\$30.0']
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: AppConstant.commonText(e,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow),
                                    ))
                                .toList(),
                            onChanged: (p0) {},
                          )
                        ],
                      ),
                    ),
                    height(25.h),
                    const CommonTextfield(
                      borderRadius: 12,
                      title: 'Message',
                      hintText: 'Write a message',
                    )
                  ],
                ),
              ),
            ),
            CommonButton(
              name: 'Send',
              onTap: () {},
            ),
            height(20.h),
          ],
        ),
      )),
    );
  }
}
