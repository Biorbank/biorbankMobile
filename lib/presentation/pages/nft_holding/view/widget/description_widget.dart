import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(12.h),
          AppConstant.commonText('Hooligan #7459',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
          height(12.h),
          CommonOutlinedButton(
              height: 50.h,
              borderColor: Theme.of(context).colorScheme.onPrimary,
              textColor: Theme.of(context).colorScheme.onPrimary,
              onTap: () {},
              title: 'Accept Offer'),
          height(20.h),
          AppConstant.commonDivider(),
          height(12.h),
          AppConstant.commonText('Description',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
          height(12.h),
          AppConstant.commonText(
              'A CNS or UNS blockchain domain. Use it to resolve your cryptocurrency address and decentralized websites',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
          height(20.h),
          rowWidget(
              context: context,
              title: 'Contract Address',
              value: 'Oxa9a6a36269932',
              valueTextColor: Theme.of(context).colorScheme.onPrimary,
              isShowIcon: true),
          height(12.h),
          rowWidget(
            context: context,
            title: 'Token ID',
            value: '2955844746...34016',
          ),
          height(12.h),
          rowWidget(
            context: context,
            title: 'Token Standard',
            value: 'ERC721',
          ),
          height(12.h),
          rowWidget(
            context: context,
            title: 'Chain',
            value: 'Polygon',
          ),
        ],
      ),
    );
  }

  Widget rowWidget(
      {required BuildContext context,
      required String title,
      required String value,
      bool isShowIcon = false,
      Color? valueTextColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppConstant.commonText(title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: AppConstant.commonText(value,
                    fontSize: 14.sp,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                    color:
                        valueTextColor ?? Theme.of(context).colorScheme.shadow),
              ),
              width(isShowIcon ? 8.w : 0),
              Visibility(
                visible: isShowIcon,
                child: Image.asset(
                  Assets.imagesExplore,
                  height: 12.h,
                  width: 12.w,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
