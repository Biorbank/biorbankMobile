import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/global.dart';
import 'package:biorbank/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/create_account_cubit.dart';

class CreateAccountFieldView extends StatefulWidget {
  const CreateAccountFieldView({super.key});

  @override
  State<CreateAccountFieldView> createState() => _CreateAccountFieldViewState();
}

class _CreateAccountFieldViewState extends State<CreateAccountFieldView>
    with Validation {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(20.h),
          Container(
            decoration: BoxDecoration(
                color: AppColors.blue50,
                borderRadius: BorderRadius.circular(12),
                boxShadow:  [
                  BoxShadow(
                    color: const Color(0xFFAAAAAA).withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: const Offset(2, 4),
                  ),
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(14.h),
                AppConstant.commonText('Fill out the words',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                height(6.h),
                CommonTextfield(
                  title: 'Word #8',
                  validator: (value) => confirmValidate(
                      value: value,
                      confirm: Global.recoveryPhraseList[7],
                      slug: 'phrase'),
                  controller: cubit.firstWordTextController,
                  hintText: 'Enter word#8',
                  onChanged: (value) {},
                ),
                CommonTextfield(
                  title: 'Word #12',
                  validator: (value) => confirmValidate(
                      value: value,
                      confirm: Global.recoveryPhraseList[11],
                      slug: 'phrase'),
                  controller: cubit.secondWordTextController,
                  hintText: 'Enter word#12',
                  onChanged: (value) {},
                ),
                height(4.h),
              ],
            ),
          ),
          height(20.h),
          CommonTextfield(
            title: 'Account Name',
            controller: cubit.accountNameTextController,
            hintText: 'Enter your account name',
            validator: (value) => nameValidation(value: value, slug: 'account'),
            onChanged: (value) {},
          ),
          BlocBuilder<CreateAccountCubit, CreateAccountState>(
            builder: (context, state) {
              return CommonTextfield(
                title: 'Create Password',
                validator: (value) =>
                    slugValidation(value: value, slug: 'Password', length: 8),
                obscureText: cubit.isShowPassword,
                controller: cubit.createPasswordController,
                hintText: 'At least 8 character in length',
                onTapSuffixWidget: () {
                  cubit.togglePasswordVisibility();
                },
                onChanged: (value) {},
                suffixWidget: cubit.isShowPassword
                    ? Icon(Icons.visibility_outlined, color: AppColors.black)
                    : Icon(Icons.visibility_off_outlined,
                        color: AppColors.black),
              );
            },
          ),
          BlocBuilder<CreateAccountCubit, CreateAccountState>(
            builder: (context, state) {
              return CommonTextfield(
                title: 'Confirm Password',
                controller: cubit.confirmPasswordController,
                validator: (value) => confirmValidate(
                    value: cubit.createPasswordController.text,
                    confirm: cubit.confirmPasswordController.text,
                    slug: 'confirm password'),
                obscureText: cubit.isShowConfirmPassword,
                hintText: 'At least 8 character in length',
                onTapSuffixWidget: () {
                  cubit.toggleConfirmPasswordVisibility();
                },
                onChanged: (value) {},
                suffixWidget: cubit.isShowConfirmPassword
                    ? Icon(Icons.visibility_outlined, color: AppColors.black)
                    : Icon(Icons.visibility_off_outlined,
                        color: AppColors.black),
              );
            },
          ),
        ],
      ),
    );
  }
}
