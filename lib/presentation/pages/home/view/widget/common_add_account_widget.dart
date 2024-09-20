import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAccountWidget extends StatelessWidget {
  const AddAccountWidget({
    super.key,
    required this.onTap
  });
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  color: const Color(0xFFAAAAAA).withOpacity(0.15),
                  offset: const Offset(2, 4))
            ]),
        child: Row(
          children: [
            Container(
              height: 18.h,
              width: 18.w,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                size: 15,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            width(15.w),
            AppConstant.commonText('Add Account',
                color: Theme.of(context).colorScheme.shadow,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
