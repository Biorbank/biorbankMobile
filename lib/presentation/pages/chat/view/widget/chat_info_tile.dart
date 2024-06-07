import 'package:biorbank/presentation/pages/chat/view/widget/chat_cout_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget chatInfoTile({
  required String profileImage,
  String? name,
  String? date,
  String? lastMsg,
  int? chatCount,
  required BuildContext context,
  final GestureTapCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [ 
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: profileImage,
              height: 50.h,
              width: 50.w,
              placeholder: (context, url) => const SizedBox.shrink(),
            ),
          ),
          width(10.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (name != null)
                  AppConstant.commonText(name,
                      maxLines: 2,
                      fontWeight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context).colorScheme.shadow),
                if (lastMsg != null && lastMsg != "") ...[
                  height(3.h),
                  AppConstant.commonText(lastMsg,
                      maxLines: 2,
                      fontSize: 14.sp,
                      color: (chatCount ?? 0) > 0
                          ? Theme.of(context).colorScheme.shadow
                          : Theme.of(context).colorScheme.onSecondaryContainer),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (date != null)
                AppConstant.commonText(date,
                    maxLines: 2,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              if (chatCount != null && chatCount > 0)
                chatCountWidget(chatCount: "$chatCount", context: context)
            ],
          )
        ],
      ),
    ),
  );
}
