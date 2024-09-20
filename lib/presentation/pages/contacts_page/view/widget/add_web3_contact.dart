import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWeb3ContactWidget extends StatelessWidget {
  const AddWeb3ContactWidget({super.key});

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
            title: '',
            borderRadius: 12.r,
            textColor: Theme.of(context).colorScheme.onSurface,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            prefixWidget: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                Assets.imagesSearch,
                height: 20.h,
                width: 20.w,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
            hintText: AppStrings.searchForUser,
          ),
          CommonTextfield(
            title: AppStrings.userName,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            borderRadius: 12.r,
            textColor: Theme.of(context).colorScheme.onSurface,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            hintText: AppStrings.giveThemAusername,
          ),
          CommonTextfield(
            title: AppStrings.address,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            borderRadius: 12.r,
            textColor: Theme.of(context).colorScheme.onSurface,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            hintText: 'Address 0x...',
          ),
          height(10.h),
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
