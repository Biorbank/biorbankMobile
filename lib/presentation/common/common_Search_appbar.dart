import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonSearchAppbar extends StatelessWidget {
  const CommonSearchAppbar(
      {super.key,
      this.hintText,
      this.textController,
      this.onTapBellIcon,
      this.onTapTextField,
      this.isVisibleTextField = true,
      this.onTapScan});
  final String? hintText;
  final TextEditingController? textController;
  final VoidCallback? onTapScan;
  final VoidCallback? onTapBellIcon;
  final VoidCallback? onTapTextField;
  final bool isVisibleTextField;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Global.scaffoldKey.currentState?.openDrawer();
                },
                child: Icon(
                  Icons.sort,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              width(20.w),
              Visibility(
                visible: isVisibleTextField,
                child: Expanded(
                  child: GestureDetector(
                    onTap: onTapTextField,
                    child: AbsorbPointer(
                      absorbing: true,
                      child: CommonTextfield(
                        title: '',
                        isShowSpaceAfterTitle: false,
                        borderRadius: 100,
                        textColor: Theme.of(context).colorScheme.onSurface,
                        cursorColor: Theme.of(context).colorScheme.onSurface,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.12),
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        prefixWidget: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            Assets.imagesSearch,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        hintText: hintText ?? '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            width(10.w),
            GestureDetector(
              onTap: onTapScan,
              child: Image.asset(Assets.imagesScan,
                  height: 24.h,
                  width: 24.w,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            width(15.w),
            GestureDetector(
              onTap: onTapBellIcon,
              child: Image.asset(Assets.imagesNotification,
                  height: 24.h,
                  width: 24.w,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        )
      ],
    );
  }
}
