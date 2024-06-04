
import 'package:flutter/material.dart';

class CommonShadowContainer extends StatelessWidget {
  const CommonShadowContainer({super.key,required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, 4))
                ]),
                child: child,
    );
  }
}