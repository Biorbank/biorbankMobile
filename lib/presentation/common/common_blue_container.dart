import 'package:flutter/material.dart';

class CommonBlueContainer extends StatelessWidget {
  const CommonBlueContainer({super.key, this.height, required this.child});
  final double? height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              transform: const GradientRotation(6),
              stops: const [
            0.3,
            1
          ],
              colors: [
            const Color(0xFF2E31B7),
            Theme.of(context).colorScheme.primary,
          ])),
      child: child,
    );
  }
}
