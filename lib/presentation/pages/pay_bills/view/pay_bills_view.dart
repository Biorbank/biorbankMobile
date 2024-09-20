import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/pay_bills/cubit/pay_bills_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/custom_dropdown_widget.dart';
import 'widget/paye_dialog.dart';

class PayBillsView extends StatelessWidget {
  const PayBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: BlocBuilder<PayBillsCubit, PayBillsState>(
          builder: (context, state) {
            var cubit=context.read<PayBillsCubit>();

            if(state is FormattedDateState){
              cubit.formattedDate=state.dateTime;
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    backGroundColor:
                        Theme.of(context).colorScheme.errorContainer,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow,
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
                    backGroundColor:
                        Theme.of(context).colorScheme.errorContainer,
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
                    backGroundColor:
                        Theme.of(context).colorScheme.errorContainer,
                    onChanged: (p0) {},
                  ),
                  height(18.h),
                  AppConstant.commonText('Date',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                  height(8.h),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).colorScheme.errorContainer),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText(cubit.formattedDate??cubit.formatDate(date: DateTime.now()),
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                        InkWell(
                          onTap: () async {
                            final DateTime? pickedTime = await showDatePicker(
                              context: context,
                              
                              initialDate:cubit.selectedDate?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                              builder: (context, child) => Theme(
                                data: Theme.of(context).copyWith(
                                  datePickerTheme: DatePickerThemeData(
                                      dayOverlayColor:
                                          WidgetStatePropertyAll<Color>(
                                        Theme.of(context).colorScheme.onSurface,
                                      ),
                                      headerBackgroundColor: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      headerForegroundColor:
                                          Theme.of(context).colorScheme.shadow,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Theme.of(context).colorScheme.onPrimary,
                                    onPrimary:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                                child: child ?? const SizedBox(),
                              ),
                            );
                            if (pickedTime != null) {
                           cubit.formatDate(date: pickedTime);
                           cubit.selectedDate=pickedTime;
                            }
                          },
                          child: Image.asset(
                            Assets.imagesCalendar,
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  height(20.h),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
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
                  CommonButton(
                    name: 'Continue',
                    onTap: () {
                      showDialog(context: context, builder:(context) => const PayeDialog(),);
                    },
                  ),
                  height(30.h)
                ]);
          },
        ),
      ),
    );
  }
}
