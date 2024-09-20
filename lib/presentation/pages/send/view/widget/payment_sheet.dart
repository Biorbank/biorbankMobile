import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common_button.dart';

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    height(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText('Payment',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_outlined,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        )
                      ],
                    ),
                    height(10.h),
                    CommonTextfield(
                      title: '',
                      isShowSpaceAfterTitle: false,
                      hintText: 'Enter address or domain here',
                      suffixWidget: Image.asset(
                        Assets.imagesScanner,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height(15.h),
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesInfo,
                          height: 14.h,
                          width: 14.w,
                          color: Theme.of(context).colorScheme.shadow,
                          fit: BoxFit.cover,
                        ),
                        width(8.w),
                        Expanded(
                          child: AppConstant.commonText(
                              'Note: Items transferred to thw wrong address cannot be recovered',
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.shadow),
                        )
                      ],
                    ),
                    height(15.h),
                    commonRowTile(
                        context: context,
                        title: 'Reccent addresses',
                        onTap: () {}),
                    height(15.h),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => height(20.h),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppConstant.commonText(
                                '0z1x9c2v8b3n7m4a6s5d0f1g2h3j4k5l6p7o8i9u0y8t7r6e5w4q3z2c1v',
                                fontSize: 12.sp,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                color: Theme.of(context).colorScheme.shadow),
                            height(6.h),
                            AppConstant.commonDivider()
                          ],
                        );
                      },
                    ),
                    height(20.h),
                    commonRowTile(
                        context: context,
                        title: 'Keystone 3 Pro 02',
                        onTap: () {}),
                    height(15.h),
                    AppConstant.commonText('Account 01',
                        color: Theme.of(context).colorScheme.shadow,
                        fontWeight: FontWeight.w500),
                    height(6.h),
                    AppConstant.commonText(
                        '0z1x9c2v8b3n7m4a6s5d0f1g2h3j4k5l6p7o8i9u0y8t7r6e5w4q3z2c1v',
                        fontSize: 12.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        color: Theme.of(context).colorScheme.shadow),
                    height(6.h),
                    AppConstant.commonDivider(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, -4),
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryFixedVariant
                          .withOpacity(0.12))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommonButton(
                name: 'Connect hardware wallet to confirm',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commonRowTile(
      {required BuildContext context,
      required String title,
      required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            fontSize: 12.sp,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        InkWell(
          onTap: onTap,
          child: Image.asset(
            Assets.imagesChevronDown,
            height: 18.h,
            width: 18.w,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
