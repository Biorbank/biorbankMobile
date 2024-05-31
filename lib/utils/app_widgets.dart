import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstant{

  static Widget commonText(String text,{double? fontSize, Color? color, FontWeight? fontWeight,TextAlign? textAlign,int? maxLines,TextOverflow? textOverflow}){
    return Text(text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: textOverflow,
    style: TextStyle(
      color: color,
      fontSize: fontSize  ,
      fontWeight: fontWeight
    ),);
  }

  static commonDivider({Color? color}) {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color:color?? AppColors.grey.withOpacity(0.1),
      ),
    );
  }
  static Widget commonAppIcon({double? height, double? width}) {
    return Image.asset(Assets.imagesAppIcon,height:height?? 80.h, width:width?? 68.w,);
  }
  
  static showToast({required String msg}){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
}