import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LimitBottomsheetWidget extends StatelessWidget {
  const LimitBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<P2pMarketCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant.commonText('Limit',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_outlined,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      )
                    ],
                  ),
                  CommonTextfield(
                    title: '',
                    borderRadius: 100.r,
                    hintText: 'Enter Purchase  Amount',
                    suffixWidget: AppConstant.commonText('CAD',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                  ),
                  height(15.h),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: cubit.paymentLimitList.length,
                     physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (106.w) / (44.h),
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      var data = cubit.paymentLimitList[index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                                color:
                                    Theme.of(context).colorScheme.errorContainer),
                            child: Center(
                              child: AppConstant.commonText(data,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        height(20.h),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(0, -4),
                    color: const Color(0xFF000000).withOpacity(0.12))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: CommonOutlinedButton(
                        height: 50,
                        borderColor: Theme.of(context).colorScheme.onPrimary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                        onTap: () {},
                        title: 'Reset')),
                width(20.w),
                Expanded(
                    child: SizedBox(
                  child: CommonButton(
                    name: 'Confirm',
                    onTap: () {},
                  ),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
