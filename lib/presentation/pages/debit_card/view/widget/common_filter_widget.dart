import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonFilterWidget extends StatelessWidget {
  const CommonFilterWidget(
      {super.key,
      required this.title,
      required this.filterList,
      this.onTapFilter,
      required this.selectedFilter});
  final String title;
  final List<String> filterList;
  final String selectedFilter;
  final Function(String)? onTapFilter;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText(title,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                )
              ],
            ),
            height(14.h),
            ...List.generate(
              filterList.length,
              (index) => InkWell(
                onTap:  () {
                  if (onTapFilter != null) {
                    onTapFilter!(filterList[index]);
                  }
                  Navigator.pop(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: selectedFilter == filterList[index]
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSecondaryFixed),
                          ),
                          child: Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedFilter == filterList[index]
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : AppColors.transparent,
                            ),
                          ),
                        ),
                        width(15.w),
                        AppConstant.commonText(filterList[index],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow)
                      ],
                    ),
                    height(12.h),
                    AppConstant.commonDivider(),
                    height(12.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
