import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:biorbank/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../utils/Theme/app_colors.dart';
import '../../../../utils/common_spacer.dart';
import '../../../common/common_text_button.dart';
import '../../../common/common_textfield.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> with Validation {
  Future<void> migration() async {
    LogService.logger.i(
        "Wallet - ${AppHelper.walletService.currentWallet.ethwallet.toJson()}");

    bool isExist = AppHelper.walletService.isWalletExist;

    if (isExist) {
      if (context.mounted) {
        CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
        await db.initRepo();
      }
    }
  }

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
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 12.sp),
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
                textColor: Theme.of(context).colorScheme.onSurface,
                onTap: () async {
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    await migration();
                    context.router.pushAndPopUntil(
                      const DashboardRoute(),
                      predicate: (route) => false,
                    );
                  }
                },
              ),
              height(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppConstant.commonText(AppStrings.walletDesc,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    textAlign: TextAlign.center),
              ),
              height(4.h),
              Center(
                child: CommonTextButton(
                  mainAxisAlignment: MainAxisAlignment.center,
                  name: AppStrings.resetWallet,
                  onTap: () {},
                  fontWeight: FontWeight.w500,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
