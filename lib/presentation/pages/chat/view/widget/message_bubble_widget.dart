import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageWidget extends StatelessWidget {
  final bool isMyMessage;
  final String message;
  final String time;
  final String amount;
  final String status;

  const ChatMessageWidget(
      {super.key,
      required this.isMyMessage,
      required this.message,
      required this.time,
      required this.amount,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = isMyMessage
        ? const BorderRadius.only(bottomLeft: Radius.circular(0))
        : const BorderRadius.only(
            bottomRight: Radius.circular(0),
          );
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isMyMessage
                    ? Theme.of(context).colorScheme.primaryFixed
                    : Theme.of(context).colorScheme.onSurface,
                borderRadius: isMyMessage
                    ? const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.60,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (amount.isNotEmpty)
                        AppConstant.commonText('\$$amount',
                            fontSize: 32.sp,
                            color: isMyMessage
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context).colorScheme.shadow,
                            fontWeight: FontWeight.w500),
                      if (amount.isNotEmpty) height(4.h),
                      if (status.isNotEmpty)
                        AppConstant.commonText(
                          status,
                          fontSize: 14.sp,
                          color: isMyMessage
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context).colorScheme.shadow,
                        ),
                      if (status.isNotEmpty) height(4.h),
                      AppConstant.commonText(message,
                          fontSize: 14.sp,
                          color: isMyMessage
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context).colorScheme.shadow)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (time.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: Row(
              mainAxisAlignment:
                  isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                timeText(time: time, context: context),
              ],
            ),
          ),
      ],
    );
  }
}

Widget timeText({required String time, required BuildContext context}) {
  return AppConstant.commonText(time,
      fontSize: 14.sp,
      color: Theme.of(context).colorScheme.onSecondaryContainer);
}

