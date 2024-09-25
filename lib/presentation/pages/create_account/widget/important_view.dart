import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportantView extends StatelessWidget {
  const ImportantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'I understand that ',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'if I share my seed phrase or private key with anyone, ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.sp,
                ),
              ),
              TextSpan(
                text: 'they can steal my assets.',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
