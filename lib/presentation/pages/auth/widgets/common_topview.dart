import 'package:biorbank/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTopView extends StatelessWidget {
  const AppTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SvgPicture.asset(Assets.svgsHeaderIcon)],
    );
  }
}
