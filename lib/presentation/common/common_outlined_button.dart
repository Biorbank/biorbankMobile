import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonOutlinedButton extends StatelessWidget {
  const CommonOutlinedButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.textColor,
      this.height,
      this.borderColor});
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height?? 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor ?? AppColors.grey)),
        child: Center(
          child: AppConstant.commonText(title,
              color: textColor ??  AppColors.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
