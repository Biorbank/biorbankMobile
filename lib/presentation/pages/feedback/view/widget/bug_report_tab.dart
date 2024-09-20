import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BugReportTab extends StatelessWidget {
  const BugReportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(10.h),
          AppConstant.commonText('Please describe the bug you found',
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.shadow),
          height(10.h),
          CommonTextfield(
            title: '',
            maxLines: 10,
            verticalPading: 0,
            isShowSpaceAfterTitle: false,
            isFilled: false,
            focusBorderColor: AppColors.transparent,
            hintText: "Don't include any sensitive or personal information",
          ),
         
          
        ],
      ),
    );
  }
}
