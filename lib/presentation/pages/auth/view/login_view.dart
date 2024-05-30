import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:biorbank/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../utils/Theme/app_colors.dart';
import '../../../../utils/common_spacer.dart';
import '../../../common/common_text_button.dart';
import '../../../common/common_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with Validation {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              height(80.h),
              Center(
                  child: AppConstant.commonAppIcon(height: 90.h, width: 90.w)),
              height(40.h),
              AppConstant.commonText(AppStrings.welcomeBack,
                  color: AppColors.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600),
              height(25.h),
              Form(
                key: cubit.formKey,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return CommonTextfield(
                      title: AppStrings.password,
                      controller: cubit.passwordTextController,
                      obscureText: cubit.isShowPassword,
                      hintText: AppStrings.fillYourPassword,
                      validator: (value) => confirmValidate(
                          value: cubit.passwordTextController.text,
                          confirm: UserPreferences.getUserData(),
                          slug: 'password'),
                      onTapSuffixWidget: () {
                        cubit.togglePasswordVisibility();
                      },
                      suffixWidget: context.read<AuthCubit>().isShowPassword
                          ? Icon(Icons.visibility_outlined,
                              color: AppColors.black)
                          : Icon(Icons.visibility_off_outlined,
                              color: AppColors.black),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppConstant.commonText(AppStrings.unlockWithFaceId,
                      color: AppColors.grey, fontSize: 12.sp),
                      width(8.w),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return FlutterSwitch(
                        width: 28.0,
                        height: 15.0,
                        toggleSize: 12.0,
                        activeColor: AppColors.green,
                        value: cubit.isUnlockFaceId,
                        borderRadius: 25.0,
                        padding: 2,
                        showOnOff: false,
                        onToggle: (val) {
                          cubit.toggleFaceIdSwitch(value: val);
                        },
                      );
                    },
                  )
                ],
              ),
              height(25.h),
              CommonButton(
                name: AppStrings.unlock,
                textColor:Theme.of(context).colorScheme.onSurface,
                onTap: () {
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    Navigator.pushReplacementNamed(context, Routes.dashboardRoute);
                  }
                },
              ),
              height(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppConstant.commonText(AppStrings.walletDesc,
                    color: AppColors.grey, textAlign: TextAlign.center),
              ),
              height(4.h),
              CommonTextButton(
                name: AppStrings.resetWallet,
                onTap: () {},
                fontWeight: FontWeight.w500,
                textColor: Theme.of(context).colorScheme.onPrimary,
              )
            ],
          ),
        ),
      )),
    );
  }
}
