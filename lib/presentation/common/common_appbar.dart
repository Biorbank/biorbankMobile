import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar(
      {super.key,
      required this.title,
      this.onTapBack,
      this.mainAxisAlignment,
      this.titleWidth,
      this.isShowBackArrow = true,
      this.fontSize});
  final String title;
  final VoidCallback? onTapBack;
  final bool isShowBackArrow;
  final double? fontSize;
  final double? titleWidth;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: isShowBackArrow,
          child: GestureDetector(
            onTap: onTapBack ??
                () {
                  Navigator.pop(context);
                },
            child: Image.asset(
              Assets.imagesBackArrow,
              height: 25,
            ),
          ),
        ),if(mainAxisAlignment!=null) width(titleWidth??0),
        Center(
          child: AppConstant.commonText(title,
              color: AppColors.black,
              fontSize: fontSize ?? 18.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox()
      ],
    );
  }
}
