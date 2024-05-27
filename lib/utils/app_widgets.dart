import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant{

  static commonText(String text,{double? fontSize, Color? color, FontWeight? fontWeight}){
    return Text(text,style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight
    ),);
  }

  static commonDivider() {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey.withOpacity(0.1),
      ),
    );
  }
}