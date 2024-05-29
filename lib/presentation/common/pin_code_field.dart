// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/Theme/app_colors.dart';

class CommonPinCodeTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onComplete;
  final StreamController<ErrorAnimationType>? errorController;

  const CommonPinCodeTextField({
    super.key,
    required this.controller,
    this.onComplete,
    this.errorController,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      blinkWhenObscuring: false,
      length: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.number,
      cursorHeight: 14,
      errorAnimationController: errorController,
      onChanged: (value) {
      },
      onCompleted: onComplete,
      cursorColor: AppColors.black,
      obscuringWidget: Center(
        child: Container(
          // width: 8,
          // height: 8,
          decoration:    BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
        ),
      ),
      autoDisposeControllers: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: 26,
        activeColor: AppColors.blue,
        fieldWidth: 26,
        activeFillColor: AppColors.blue ,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.circular(30),
        inactiveColor: AppColors.black,
        selectedColor: AppColors.blue,
      ),
    );
  }
}
