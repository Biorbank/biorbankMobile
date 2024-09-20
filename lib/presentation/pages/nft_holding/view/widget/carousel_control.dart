import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselControl extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  const CarouselControl({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: const Color(0xFF000000).withOpacity(0.25),
          )
        ],
      ),
      height: 36.0.h,
      width: 36.0.w,
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
