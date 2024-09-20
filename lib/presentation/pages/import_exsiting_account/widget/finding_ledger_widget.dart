import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindingLedgerWidget extends StatefulWidget {
  const FindingLedgerWidget({super.key});

  @override
  State<FindingLedgerWidget> createState() => _FindingLedgerWidgetState();
}

class _FindingLedgerWidgetState extends State<FindingLedgerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
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
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            height(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText('Finding Ledger',
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w500),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ))
              ],
            ),
            height(20.h),
            Expanded(
              child: AnimatedBuilder(
                animation: CurvedAnimation(
                    parent: _controller, curve: Curves.fastOutSlowIn),
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _buildContainer(150 * _controller.value),
                      _buildContainer(200 * _controller.value),
                      _buildContainer(250 * _controller.value),
                      _buildContainer(300 * _controller.value),
                      _buildContainer(350 * _controller.value),
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surface),
                          child: Icon(
                            Icons.bluetooth,
                            color: Theme.of(context).colorScheme.onSurface,
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AppConstant.commonText(
                            'BiorBank doesn’t have permission to use bluetooth',
                            textAlign: TextAlign.center,
                            color: Theme.of(context).colorScheme.onSecondaryContainer),
                      ),
                    ],
                  );
                },
              ),
            ),
            height(20.h),
            CommonButton(
              name: 'Open App Settings',
              onTap: () {},
            ),
            height(10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context)
            .colorScheme
            .onPrimary
            .withOpacity(1 - _controller.value),
      ),
    );
  }
}
