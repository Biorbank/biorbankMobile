import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/common_spacer.dart';
import '../../../../common/common_blue_container.dart';
import '../../../../common/common_search_appbar.dart';
import '../../cubit/home_cubit.dart';

class AssetPageWidget extends StatelessWidget {
  const AssetPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Stack(
      children: [
        CommonBlueContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(40.h),
                CommonSearchAppbar(
                  hintText: 'ID/USDT',
                  onTapTextField: () {},
                ),
                height(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildArrow(context: context, icon: Assets.imagesBackArrow),
                    const Spacer(),
                    Column(
                      children: [
                        AppConstant.commonText(
                          "Balance",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                        AppConstant.commonText(
                          "\$75,630.90",
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        Row(
                          children: [
                            AppConstant.commonText(
                              "all Account",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            width(4),
                            _buildArrow(
                              context: context,
                              icon: Assets.imagesArrowDownOutline,
                              height: 16.h,
                              width: 16.w,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    _buildArrow(
                        context: context, icon: Assets.imagesArrowRight),
                  ],
                ),
                height(28),
              ],
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.68,
          minChildSize: 0.6,
          maxChildSize: 0.68,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Theme.of(context).colorScheme.onSurface,
              ),
              child: Column(
                children: [
                  height(10.h),
                  Container(
                    height: 4.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  height(20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.myActTokenData.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final data = cubit.myActTokenData[index];
                        return _buildContainerData(
                          context: context,
                          img: data.img ?? "",
                          title: data.title ?? "",
                          title2: data.title2 ?? "",
                          amt: data.amt ?? "",
                          currentAmt: data.currentAmt ?? "",
                          differentAmt: data.differentAmt ?? "",
                          totalDifferentInPercentage:
                              data.totalDifferentInPercentage ?? "",
                          isProfit: data.isProfit ?? false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  _buildArrow(
      {required BuildContext context,
      required String icon,
      double? height,
      double? width}) {
    return Image.asset(
      icon,
      height: height ?? 24.h,
      width: width ?? 24.w,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  _buildContainerData({
    required BuildContext context,
    required String img,
    required String title,
    required String title2,
    required String amt,
    required String currentAmt,
    required String differentAmt,
    required String totalDifferentInPercentage,
    required bool isProfit,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: img,
              height: 44.h,
              width: 44.w,
              fit: BoxFit.fill,
            ),
          ),
          width(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                      children: [
                        TextSpan(
                          text: title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                        ),
                        // width(4),
                        TextSpan(text: " $title2"),
                      ]),
                ),
                height(6),
                AppConstant.commonText(amt,
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
          width(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppConstant.commonText(currentAmt,
                  color: Theme.of(context).colorScheme.shadow,
                  fontWeight: FontWeight.w600),
              height(6.h),
              Row(
                children: [
                  AppConstant.commonText(differentAmt,
                      color: isProfit
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : Theme.of(context).colorScheme.error,
                      fontSize: 11.sp),
                  width(6.w),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      color: isProfit
                          ? const Color(0xFFE5FAEE)
                          : const Color(0xFFFDEBEC),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: AppConstant.commonText(
                      totalDifferentInPercentage,
                      fontSize: 10.sp,
                      color: isProfit
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
