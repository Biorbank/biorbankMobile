import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoNotLikeTab extends StatefulWidget {
  const DoNotLikeTab({super.key});

  @override
  State<DoNotLikeTab> createState() => _DoNotLikeTabState();
}

class _DoNotLikeTabState extends State<DoNotLikeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(5.h),
          AppConstant.commonText(
            "what should we change ?",
            color: Theme.of(context).colorScheme.shadow,
            fontWeight: FontWeight.w500,
          ),
          height(5.h),
          AppConstant.commonText(
            "Don't include any sensitive and personal information",
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
          ),
        ],
      ),
    );
  }
}
