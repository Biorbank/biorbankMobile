import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(
      {super.key,
      required this.title,
      this.isVisibleAcceptButton = true,
      required this.description,
      required this.chain,
      required this.contactAddress,
      required this.tokenId,
      this.onTapExploreButton,
      required this.tokenStandard});
  final String title;
  final bool isVisibleAcceptButton;
  final String description;
  final String contactAddress;
  final String tokenId;
  final String tokenStandard;
  final String chain;
  final VoidCallback? onTapExploreButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(12.h),
          AppConstant.commonText(title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
          height(12.h),
          Visibility(
            visible: isVisibleAcceptButton,
            child: CommonOutlinedButton(
                height: 50.h,
                borderColor: Theme.of(context).colorScheme.onPrimary,
                textColor: Theme.of(context).colorScheme.onPrimary,
                onTap: () {},
                title: 'Accept Offer'),
          ),
          height(isVisibleAcceptButton ? 20.h : 0),
          AppConstant.commonDivider(),
          height(12.h),
          AppConstant.commonText('Description',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
          height(12.h),
          AppConstant.commonText(
            description,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
          height(20.h),
          rowWidget(
              context: context,
              title: 'Contract Address',
              onTapExploreButton:onTapExploreButton ,
              value: contactAddress,
              valueTextColor: Theme.of(context).colorScheme.onPrimary,
              isShowIcon: true),
          height(12.h),
          rowWidget(
            context: context,
            title: 'Token ID',
            value: tokenId,
          ),
          height(12.h),
          rowWidget(
            context: context,
            title: 'Token Standard',
            value: tokenStandard,
          ),
          height(12.h),
          rowWidget(
            context: context,
            title: 'Chain',
            value: chain,
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
      Color? valueTextColor,
      VoidCallback? onTapExploreButton,
      }) {
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
                child: InkWell(
                  onTap: onTapExploreButton,
                  child: Image.asset(
                    Assets.imagesExplore,
                    height: 12.h,
                    width: 12.w,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
