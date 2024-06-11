import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String? name;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? buttonColor;
  final String? image;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? height;
  const CommonButton(
      {super.key,
      this.name,
      this.onTap,
      this.textColor,
      this.margin,
      this.buttonColor,
      this.image,
      this.height,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        height:height?? 50.h,
        margin:margin ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          color: buttonColor ?? Theme.of(context).colorScheme.onPrimary,
          boxShadow: buttonColor == null
              ? [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onPrimary,
                    spreadRadius: -2,
                    blurRadius: 12,
                    offset: const Offset(0, 0),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      image!,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox.shrink(),
            AppConstant.commonText(name ?? "",
                fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor)
          ],
        ),
      ),
    );
  }
}
