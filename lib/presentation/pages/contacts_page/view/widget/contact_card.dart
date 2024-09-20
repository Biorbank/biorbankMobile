import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.id,
      this.isShowActionButtons = true});
  final String imageUrl;
  final String name;
  final String id;
  final bool isShowActionButtons;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) => Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ),
              ),
              width(10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstant.commonText(
                      name,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                    height(4.h),
                    AppConstant.commonText(
                      id,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        width(10.w),
        Visibility(
          visible: isShowActionButtons,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Theme.of(context).colorScheme.inversePrimary),
                    child: Row(
                      children: [
                        AppConstant.commonText('Send',
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w500),
                        width(4.h),
                        Image.asset(
                          Assets.imagesArrowUp,
                          height: 18.h,
                          width: 18.w,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      ],
                    )),
              ),
              width(12.w),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 44.h,
                  width: 44.w,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  child: Image.asset(
                    Assets.imagesMessage,
                    height: 20.h,
                    width: 20.w,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
