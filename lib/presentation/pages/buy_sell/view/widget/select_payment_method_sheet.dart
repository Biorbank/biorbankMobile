import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/buy_sell/cubit/buysell_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPaymentMethodSheet extends StatelessWidget {
  const SelectPaymentMethodSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: BlocBuilder<BuySellCubit, BuysellState>(
          builder: (context, state) {
            var cubit = context.read<BuySellCubit>();
            if (state is SelectedPaymentMethodState) {
              cubit.paymentMethodSelected = state.paymentMethod;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                height(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppConstant.commonText('Select payment method',
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_outlined,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    )
                  ],
                ),
                height(20.h),
                ListView.separated(
                    separatorBuilder: (context, index) => height(15.h),
                    itemCount: cubit.paymentMethodDataList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = cubit.paymentMethodDataList[index];
                      return paymentCard(
                          onTap: () {
                            cubit.onSelectPaymentMethods(payment: {
                              'image_url': data['image_url'],
                              "payment_name": data['payment_name']
                            });
                          },
                          context: context,
                          imageUrl: data['image_url'],
                          paymentMethodName: data['payment_name'],
                          subImage1: data['sub_image1'],
                          type: data['type'],
                          limit: data['limit'],
                          isSelectedMethod: cubit.paymentMethodSelected.values
                              .contains(data['payment_name']),
                          subImage2: data['sub_image2']);
                    }),
                height(14.h),
                CommonButton(
                  name: 'Confirm',
                  onTap: () {
                    cubit.onConfirmedPaymentMethod(
                        payment: cubit.paymentMethodSelected);
                    Navigator.pop(context);
                  },
                ),
                height(24.h),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget paymentCard(
      {required BuildContext context,
      required String imageUrl,
      required String paymentMethodName,
      required String type,
      required String subImage1,
      required String limit,
      required bool isSelectedMethod,
      required VoidCallback onTap,
      String subImage2 = ""}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isSelectedMethod
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : null,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                color: isSelectedMethod
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onPrimaryContainer)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 24.h,
                      width: 24.w,
                      placeholder: (context, url) => const SizedBox.shrink(),
                    ),
                    width(8.w),
                    AppConstant.commonText(paymentMethodName,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                  ],
                ),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: subImage1,
                      height: 20.h,
                      width: 20.w,
                      placeholder: (context, url) => const SizedBox.shrink(),
                    ),
                    width(subImage2.isNotEmpty ? 8.w : 0),
                    Visibility(
                      visible: subImage2.isNotEmpty,
                      child: CachedNetworkImage(
                        imageUrl: subImage2,
                        height: 20.h,
                        width: 20.w,
                        placeholder: (context, url) => const SizedBox.shrink(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            height(8.h),
            Row(
              children: [
                Image.asset(
                  Assets.imagesClock,
                  height: 18.h,
                  width: 18.w,
                ),
                width(6.w),
                AppConstant.commonText(type,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                width(6.w),
                AppConstant.commonText('•',
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                width(6.w),
                Text.rich(TextSpan(
                    text: '\$',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                      WidgetSpan(child: width(4.w)),
                      TextSpan(
                          text: '\$',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer)),
                      WidgetSpan(child: width(4.w)),
                      TextSpan(
                          text: '\$',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer)),
                    ])),
                width(8.w),
                AppConstant.commonText(limit,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            )
          ],
        ),
      ),
    );
  }
}
