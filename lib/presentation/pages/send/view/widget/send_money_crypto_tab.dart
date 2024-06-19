import 'dart:math';

import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/send_money_cubit.dart';

class SendMoneyCryptoTab extends StatelessWidget {
  const SendMoneyCryptoTab(
      {super.key,
      required this.onChangedAccount,
      required this.onChangedReceipent,
      required this.onTapSend});
  final Function(dynamic) onChangedAccount;
  final Function(dynamic) onChangedReceipent;
  final VoidCallback onTapSend;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SendMoneyCubit>();

    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 80), 0);
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(25.h),
            AppConstant.commonText('Interac e- Transfer®',
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            height(15.h),
            Row(
              children: [
                AppConstant.commonText('From Account',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.shadow),
                width(10.w),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: const Color(0xFFE5FAEE),
                  ),
                  child: AppConstant.commonText('Account 1',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onInverseSurface),
                )
              ],
            ),
            height(8.h),
            CommonDropdownWidget(
              isExpanded: true,
              borderRadius: 12.r,
              value: cubit.selectedAccount,
              labelText: 'Select account',
              items: cubit.accountList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: AppConstant.commonText(e,
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.shadow),
                      ))
                  .toList(),
              backGroundColor: Theme.of(context).colorScheme.errorContainer,
              onChanged: onChangedAccount,
            ),
            height(18.h),
            CommonDropdownWidget(
              isExpanded: true,
              borderRadius: 12.r,
              value: cubit.selectedReceipent,
              labelText: 'Select receipent',
              title: 'To',
              items: cubit.receipentList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: AppConstant.commonText(e,
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.shadow),
                      ))
                  .toList(),
              backGroundColor: Theme.of(context).colorScheme.errorContainer,
              onChanged: onChangedReceipent,
            ),
            height(10.h),
            const CommonTextfield(
              title: 'Amount',
              hintText: '\$0.00',
            ),
            height(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Message',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                AppConstant.commonText('*Optional',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            ),
            CommonTextfield(
              title: '',
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              isShowSpaceAfterTitle: false,
              hintText: 'Don’t include banking information',
            ),
            height(20.h),
            CommonButton(
              onTap: onTapSend,
              name: 'Send',
            ),
            height(40.h),
          ],
        ),
      ),
    );
  }
}
