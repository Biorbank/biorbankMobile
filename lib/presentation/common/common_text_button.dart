import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton(
      {super.key,
      this.onTap,
      required this.name,
      this.textColor,
      this.fontSize,
      this.mainAxisAlignment,
      this.icon,
      this.fontWeight});
  final VoidCallback? onTap;
  final Color? textColor;
  final String name;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? icon;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            icon ?? const SizedBox.shrink(),
            width(8.w),
          ],
          AppConstant.commonText(name,
              fontSize: fontSize, color: textColor, fontWeight: fontWeight),
        ],
      ),
    );
  }
}
