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
      this.fontWeight,
      this.borderRadius,
      this.borderColor,
      this.bgColor,
      this.isShowIconInPrefix = false});

  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final Color? bgColor;
  final double? height;
  final Widget? icon;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isShowIconInPrefix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            color: bgColor ?? Theme.of(context).colorScheme.scrim,
            border: Border.all(
                color: borderColor ??
                    Theme.of(context).colorScheme.onSecondaryContainer)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null && isShowIconInPrefix) ...[
                icon ?? const SizedBox.shrink(),
                width(10.w),
              ],
              AppConstant.commonText(title,
                  color: textColor ??
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w500),
              if (icon != null && !isShowIconInPrefix) ...[
                width(10.w),
                icon ?? const SizedBox.shrink(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
