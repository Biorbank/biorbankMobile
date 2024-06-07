import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton(
      {super.key,
      this.onTap,
      required this.name,
      this.textColor,
      this.fontSize,
      this.fontWeight});
  final VoidCallback? onTap;
  final Color? textColor;
  final String name;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppConstant.commonText(name,
          fontSize: fontSize, color: textColor, fontWeight: fontWeight),
    );
  }
}
