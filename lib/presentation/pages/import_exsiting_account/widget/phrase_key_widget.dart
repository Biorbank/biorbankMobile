import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/cubit/import_exsiting_account_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhraseKeyWidget extends StatefulWidget {
  const PhraseKeyWidget({super.key});

  @override
  State<PhraseKeyWidget> createState() => _PhraseKeyWidgetState();
}

class _PhraseKeyWidgetState extends State<PhraseKeyWidget> with Validation {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportExsitingAccountCubit, ImportExsitingAccountState>(
      builder: (context, state) {
        var cubit = context.read<ImportExsitingAccountCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant.commonText('Recovery Phrase or Private Key',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow),
                      Image.asset(
                        Assets.imagesScan,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ],
                  ),
                  CommonTextfield(
                    title: '',
                    controller: cubit.pharseKeyController,
                    validator: (value) {
                      return null;
                    },
                    hintText: 'Type your recovery pharse or private key',
                    maxLines: 5,
                  ),
                  CommonTextfield(
                    title: 'Wallet Name',
                    controller: cubit.walletNameController,
                    validator: (value) {
                      return null;
                    },
                    hintText: 'e.g. Trading, NFT Vault, Investment',
                  ),
                  CommonTextfield(
                    title: 'Create Password',
                    validator: (value) => slugValidation(
                        value: value, slug: 'Password', length: 8),
                    obscureText: cubit.isObscurePassword,
                    controller: cubit.createPasswordController,
                    hintText: 'At least 8 character in length',
                    onTapSuffixWidget: () {
                      cubit.togglePasswordVisibility();
                    },
                    onChanged: (value) {},
                    suffixWidget: cubit.isObscurePassword
                        ? Icon(Icons.visibility_outlined,
                            color: AppColors.black)
                        : Icon(Icons.visibility_off_outlined,
                            color: AppColors.black),
                  ),
                  CommonTextfield(
                    title: 'Confirm Password',
                    controller: cubit.confirmPasswordController,
                    validator: (value) => confirmValidate(
                        value: cubit.createPasswordController.text,
                        confirm: cubit.confirmPasswordController.text,
                        slug: 'confirm password'),
                    obscureText: cubit.isObscureConfirmPassword,
                    hintText: 'At least 8 character in length',
                    onTapSuffixWidget: () {
                      cubit.toggleConfirmPasswordVisibility();
                    },
                    onChanged: (value) {},
                    suffixWidget: cubit.isObscureConfirmPassword
                        ? Icon(Icons.visibility_outlined,
                            color: AppColors.black)
                        : Icon(Icons.visibility_off_outlined,
                            color: AppColors.black),
                  ),
                  height(15.h)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
