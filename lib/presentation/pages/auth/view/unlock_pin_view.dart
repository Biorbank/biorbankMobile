import 'dart:async';

import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_text_button.dart';
import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/pin_code_field.dart';

class UnlockPinView extends StatefulWidget {
  const UnlockPinView({super.key});

  @override
  State<UnlockPinView> createState() => _UnlockPinViewState();
}

class _UnlockPinViewState extends State<UnlockPinView> {
  StreamController<ErrorAnimationType>? errorController1;

  @override
  void initState() {
    errorController1 = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController1?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(
      //         Icons.arrow_back_ios,
      //         color: AppColors.black,
      //       )),
      //   centerTitle: true,
      //   backgroundColor: AppColors.white,
      //   title: AppConstant.commonText(AppStrings.unlockWithPin,
      //       color: AppColors.black,
      //       fontSize: 20.sp,
      //       fontWeight: FontWeight.w500),
      // ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                height(20.h),
                CommonAppbar(title:AppStrings.unlockWithPin,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        height(50.h),
                        Center(
                            child: Image.asset(
                          Assets.imagesUser,
                          height: 80.h,
                          width: 80.w,
                        )),
                        height(20.h),
                        AppConstant.commonText('Rafael Mitoma',
                            fontSize: 16.sp, color: AppColors.black),
                        height(100.h),
                        CommonPinCodeTextField(
                            controller: cubit.pinCodeTextController,
                            onComplete: (value) {},
                            errorController: errorController1),
                        height(20.h),
                        CommonTextButton(
                          name: AppStrings.forgetPassword,
                          textColor: AppColors.blue,
                          fontWeight: FontWeight.w500,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
