import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget chatCountWidget(
    {required BuildContext context,
    required String chatCount,
    EdgeInsets? padding,
    double? fontSize
    }) {
  return Container(
    padding: padding ?? const EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: padding != null? BorderRadius.circular(14):null,
        color: Theme.of(context).colorScheme.onPrimary,
        shape: padding != null ? BoxShape.rectangle : BoxShape.circle),
    child: AppConstant.commonText(chatCount,
        fontSize:fontSize?? 10.sp, color: Theme.of(context).colorScheme.onSurface),
  );
}
