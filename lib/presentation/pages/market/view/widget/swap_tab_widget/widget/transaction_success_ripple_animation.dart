import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionSuccessRippleAnimation extends StatefulWidget {
  const TransactionSuccessRippleAnimation({super.key});

  @override
  State<TransactionSuccessRippleAnimation> createState() =>
      _TransactionSuccessRippleAnimationState();
}

class _TransactionSuccessRippleAnimationState
    extends State<TransactionSuccessRippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(seconds: 3),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: AnimatedBuilder(
              animation: CurvedAnimation(
                  parent: _controller, curve: Curves.fastOutSlowIn),
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildContainer(50 * _controller.value),
                    _buildContainer(75 * _controller.value),
                    _buildContainer(100 * _controller.value),
                    _buildContainer(125 * _controller.value),
                    _buildContainer(150 * _controller.value),
                    Image.asset(
                      Assets.imagesCheckCircle,
                      height: 50.h,
                      width: 50.w,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        AppConstant.commonText(AppStrings.transactionCompleted,
            fontWeight: FontWeight.w600, color: const Color(0xFF16A965))
      ],
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: AppColors.green100.withOpacity(1 - _controller.value)),
        color: const Color(0xFFDCFAE6).withOpacity(1 - _controller.value),
      ),
    );
  }
}
