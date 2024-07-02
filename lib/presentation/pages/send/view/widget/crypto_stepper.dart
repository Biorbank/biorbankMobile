import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/send/cubit/send_money_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common_button.dart';

class CryptoStepper extends StatelessWidget {
  const CryptoStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<SendMoneyCubit, SendMoneyState>(
        builder: (context, state) {
          var cubit = context.read<SendMoneyCubit>();
          if (state is StepperIndexState) {
            cubit.activeStepIndex = state.index;
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stepper(
                  stepIconMargin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 0,
                  // stepIconBuilder: (stepIndex, stepState) {
                  //   return null;
                  // },
                  controlsBuilder: (context, details) =>
                      const SizedBox.shrink(),
                  physics: const NeverScrollableScrollPhysics(),
                  connectorThickness: 2,
                  margin: EdgeInsets.zero,
                  currentStep: cubit.activeStepIndex,
                  type: StepperType.vertical,
                  onStepTapped: (value) {
                    cubit.onChangeStepperIndex(index: value);
                  },
                  steps: [
                    Step(
                        state: StepState.complete,
                        isActive: cubit.activeStepIndex >= 0,
                        stepStyle: StepStyle(
                          connectorColor: cubit.activeStepIndex >= 0
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        content: CommonDropdownWidget(
                          isExpanded: true,
                          borderRadius: 12.r,
                          title: 'Crypto',
                          labelText: '',
                          items: cubit.accountList
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
                          onChanged: (p0) {},
                        ),
                        title: AppConstant.commonText('Select Crypto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.shadow)),
                    Step(
                      state: StepState.complete,
                      isActive: cubit.activeStepIndex >= 1,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  width(4.w),
                                  Image.asset(Assets.imagesArrowRight,
                                      height: 13.h,
                                      width: 13.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)
                                ],
                              )
                            ],
                          ),
                          CommonTextfield(
                            title: '',
                            isShowSpaceAfterTitle: false,
                            hintText: 'Please enter your withdrawal address',
                            suffixWidget: Image.asset(
                              Assets.imagesCopyRounded,
                              height: 16.h,
                              width: 16.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstant.commonText(
                                        'USDT Account Equity',
                                        fontSize: 12.sp,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                    height(6.h),
                                    AppConstant.commonText(
                                        'USDT Account Equity',
                                        fontSize: 14.sp,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                  ],
                                ),
                              ),
                              width(20.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstant.commonText('Withdrawal Fee',
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 12.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                    height(6.h),
                                    AppConstant.commonText('0 - 4 USDT',
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      stepStyle: StepStyle(
                        connectorColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        color: cubit.activeStepIndex >= 1
                            ? Theme.of(context).colorScheme.onPrimary
                            : const Color(0xFFEBEBEB),
                      ),
                      title: AppConstant.commonText('Withdraw To',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.shadow),
                    ),
                    Step(
                      state: StepState.complete,
                      isActive: cubit.activeStepIndex >= 2,
                      title: AppConstant.commonText('Withdraw Amount',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.shadow),
                      content: const SizedBox.shrink(),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Withdrawal amount',
                      fontSize: 12.sp,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant.commonText('Withdrawal limit: 3.000.000 USDT',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      width(8.w),
                      Image.asset(
                        Assets.imagesInfo,
                        height: 12.h,
                        width: 12.w,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      )
                    ],
                  ),
                ],
              ),
              height(12.h),
              CommonTextfield(
                title: '',
                hintText: 'Minimum withdrawal amount: 1',
                suffixWidget: Text.rich(TextSpan(
                    text: 'ALL',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                      WidgetSpan(child: width(8.w)),
                      TextSpan(
                          text: 'USDT',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow))
                    ])),
              ),
              height(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: 'Available',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      children: [
                        WidgetSpan(child: width(8.w)),
                        TextSpan(
                            text: '3.000.000 USDT',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow))
                      ])),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesSwapArrow,
                          height: 12.h,
                          width: 12.w,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        width(6.w),
                        AppConstant.commonText('Transfer',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ],
                    ),
                  )
                ],
              ),
              height(14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Transaction fees',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  AppConstant.commonText('3.0638816 USDT',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              height(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Actual amount received',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  AppConstant.commonText('-- USDT',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              height(20.h),
              CommonButton(
                name: 'Withdraw',
                onTap: () {},
              ),
              height(60)
            ],
          );
        },
      ),
    );
  }
}
