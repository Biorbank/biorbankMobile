import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton(
      {super.key,
      this.onTap,
      required this.name,
      this.textColor,
      this.fontWeight});
  final VoidCallback? onTap;
  final Color? textColor;
  final String name;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppConstant.commonText(name,
          color: textColor, fontWeight: fontWeight),
    );
  }
}
