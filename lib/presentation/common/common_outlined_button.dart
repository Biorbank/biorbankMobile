import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonOutlinedButton extends StatelessWidget {
  const CommonOutlinedButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.textColor,
      this.height,
      this.icon,
      this.fontSize,
      this.borderRadius,
      this.borderColor});
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final Widget? icon;
  final double? borderRadius;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular( borderRadius??12),
            border: Border.all(
                color: borderColor ??
                    Theme.of(context).colorScheme.onSecondaryContainer)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppConstant.commonText(title,
                  color: textColor ??
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize:fontSize?? 16.sp,
                  fontWeight: FontWeight.w500),
              if (icon != null) width(10.w),
              icon ?? const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
