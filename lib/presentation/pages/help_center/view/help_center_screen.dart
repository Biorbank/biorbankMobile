import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonBlueContainer(
          height: 120.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(45.h),
                CommonSearchAppbar(
                  hintText: 'Help Center',
                  textController: TextEditingController(),
                ),
              ],
            ),
          ),
        ),
        height(15.h),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => AppConstant.commonDivider(),
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          Assets.imagesQuestion,
                          height: 20.h,
                          width: 20.w,
                        ),
                        width(8.w),
                        AppConstant.commonText('FAQ',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                      ],
                    ),
                    minVerticalPadding: 10,
                    minTileHeight: 50,
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: AppConstant.commonText('Learn about BiorBank',
                          fontSize: 12.sp,
                          color:
                              Theme.of(context).colorScheme.onSecondaryContainer),
                    ),
                    trailing: Transform.rotate(
                        angle: 3.15,
                        child: Image.asset(
                          Assets.imagesBackArrow,
                          height: 20.h,
                          width: 20.w,
                        )),
                  )),
        )
      ],
    );
  }
}
