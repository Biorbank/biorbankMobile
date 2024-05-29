import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/cubit/import_exsiting_account_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JsonFileWidgetView extends StatelessWidget {
  const JsonFileWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ImportExsitingAccountCubit>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          height(20.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.inversePrimary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesUploadCloud,
                    height: 32.h,
                    width: 32.w,
                  ),
                  height(20.h),
                  AppConstant.commonText('Import your .Json File',
                      color: AppColors.grey),
                  height(20.h),
                  CommonOutlinedButton(onTap: () {}, title: 'Browse'),
                ],
              ),
            ),
          ),
          height(14.h),
          CommonTextfield(
            title: 'Username',
            controller: cubit.userNameController,
            validator: (value) {
              return null;
            },
            hintText: 'Fill your username',
          ),
          CommonTextfield(
            controller: cubit.createPasswordForJsonFile,
            title: 'Create Password',
            validator: (value) {
              return null;
            },
            hintText: 'Fill your password',
          ),
        ],
      ),
    );
  }
}
