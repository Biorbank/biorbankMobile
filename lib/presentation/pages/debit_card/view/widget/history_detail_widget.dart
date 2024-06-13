import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryDetailWidget extends StatelessWidget {
  const HistoryDetailWidget({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(10.h),
              Center(
                child: Container(
                  height: 4.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              height(20.h),
              AppConstant.commonText('History',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.shadow),
              height(15.h),
              AppConstant.commonText('12/31/2023',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              height(15.h),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => height(16.h),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return historyDetails(
                      context: context,
                      isSent: index % 2 == 0,
                      title: index % 2 == 0 ? 'Sent' : 'Recivied',
                      time: '3:48 PM',
                      amount: index % 2 == 0
                          ? '-0.0922076 ETH'
                          : '+0.0922076 ETH',
                      id: '-CAS280.44');
                },
              ),
              height(30.h)
            ],
          ),
        ));
  }

  Widget historyDetails(
      {required BuildContext context,
      required bool isSent,
      required String title,
      required String time,
      required String amount,
      required String id}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Image.asset(
                  isSent ? Assets.imagesArrowUp : Assets.imagesArrowDown,
                  color: Theme.of(context).colorScheme.shadow,
                ),
              ),
            ),
            width(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText(title,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
                height(4.h),
                AppConstant.commonText(time,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            ),
          ],
        ),
        width(12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppConstant.commonText(amount,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  color: isSent
                      ? Theme.of(context).colorScheme.shadow
                      : Theme.of(context).colorScheme.onInverseSurface),
              height(4.h),
              AppConstant.commonText(id,
                  fontWeight: FontWeight.w400,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            ],
          ),
        ),
      ],
    );
  }
}
