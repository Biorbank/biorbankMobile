import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imagePickDialog({required BuildContext context, VoidCallback? onTapCamera, VoidCallback? onTapGallery}) {
  return AlertDialog(
    backgroundColor: Theme.of(context).colorScheme.onSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppConstant.commonText('Pick image from',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.shadow),
            height(8.h),
        TextButton.icon(
          onPressed:onTapGallery,
          icon: Icon(
            Icons.image_outlined,
            color: Theme.of(context).colorScheme.shadow,
          ),
          label: AppConstant.commonText('Gallery',
              color: Theme.of(context).colorScheme.shadow),
        ),
        TextButton.icon(
          onPressed: onTapCamera,
          icon: Icon(
            Icons.camera_outlined,
            color: Theme.of(context).colorScheme.shadow,
          ),
          label: AppConstant.commonText('Camera',
              color: Theme.of(context).colorScheme.shadow),
        )
      ],
    ),
  );
}
