import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWeb2ContactWidget extends StatelessWidget {
  const AddWeb2ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppConstant.commonText(AppStrings.createNewContact,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
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
          height(10.h),
          CommonTextfield(
            title: 'Name',
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            borderRadius: 12.r,
            textColor: Theme.of(context).colorScheme.onSurface,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            hintText: 'Enter contact name',
          ),
          CommonTextfield(
            title: 'Email',
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            borderRadius: 12.r,
            textColor: Theme.of(context).colorScheme.onSurface,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            hintText: 'Enter contacts email address',
          ),
          CommonTextfield(
            title: 'Mobile',
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            borderRadius: 12.r,
            textColor: Theme.of(context).colorScheme.onSurface,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            hintText: 'Enter contact mobile number',
          ),
          height(10.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).colorScheme.errorContainer,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.2))),
            padding: const EdgeInsets.all(10),
            child: Text.rich(TextSpan(
                text:
                    'By continuing, you agrre that have the contact’s consent to use their information for the',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                children: [
                  WidgetSpan(child: width(4.w)),
                  TextSpan(
                      text: 'Interac',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontStyle: FontStyle.italic)),
                  WidgetSpan(child: width(5.w)),
                  TextSpan(
                      text: 'e-Transfer service',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      )),
                ])),
          ),
          height(25.h),
          CommonButton(
            name: AppStrings.confirm,
            onTap: () {},
          ),
          height(20.h),
        ],
      ),
    );
  }
}
