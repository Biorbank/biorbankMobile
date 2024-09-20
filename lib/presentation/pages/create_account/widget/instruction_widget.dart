import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/Theme/app_colors.dart';
import '../../../../utils/app_widgets.dart';
import '../../../../utils/common_spacer.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border:
            Border.all(color: const Color.fromRGBO(233, 233, 233, 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 245, 250, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        width: 1.5,
                          color:
                              const Color.fromRGBO(233, 233, 233, 1)),
                    ),
                    child: Image.asset(
                      Assets.imagesDanger,
                      height: 18,
                      width: 18,
                    ),
                  ),
                  width(10.w),
                  Expanded(
                    child: AppConstant.commonText(
                        "Do not share recovery pharse with anyone",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppColors.yellow),
                  )
                ],
              ),
            ),
          ),
          AppConstant.commonDivider(color: const Color.fromRGBO(233, 233, 233, 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: AppConstant.commonText(
                "Anyone with your recovery phrase can have full control over your assests. Please stay viglant against phising attacks at all times.",
                fontSize: 13.sp,color: AppColors.black),
          )
        ],
      ),
    );
  }
}
