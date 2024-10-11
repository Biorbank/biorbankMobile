import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BrowserCardWidget extends StatelessWidget {
  const BrowserCardWidget(
      {super.key,
      required this.data,
      required this.title,
      this.isVisibleBookMark = false});

  final String title;
  final List<dynamic> data;
  final bool isVisibleBookMark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppConstant.commonText(title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.shadow),
                Visibility(
                  visible: isVisibleBookMark,
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
                      width(10.w),
                      AppConstant.commonText('Add Bookmark',
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
              ],
            ),
            height(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                data.length,
                (index) => Expanded(
                  child: InkWell(
                    onTap: () async {
                      if (data[index]['name'] == "AAVE") {
                        await launchUrl(Uri.parse("https://app.aave.com/"));
                      }
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image(
                              image: AssetImage(
                                data[index]['image_url'],
                              ),
                              height: 50.h,
                              width: 50.w,
                            )),
                        height(10.h),
                        AppConstant.commonText(data[index]['name'],
                            fontSize: 14.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            height(8.h),
          ],
        ),
      ),
    );
  }
}
