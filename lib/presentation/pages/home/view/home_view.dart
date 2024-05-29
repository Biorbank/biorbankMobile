import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            height(25.h),
            const CommonAppbar(
              title: 'Home page',
              isShowBackArrow: false,
            ),
          ],
        ),
      ),
    );
  }
}
