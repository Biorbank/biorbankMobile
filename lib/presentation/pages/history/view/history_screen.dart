import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/app_widgets.dart';
import '../../../../utils/common_spacer.dart';
import '../../../common/common_blue_container.dart';
import '../../../common/common_search_appbar.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                              "CA \$0.00 (0.00%)",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                            ),
                            width(4),
                            AppConstant.commonText(
                              "past week",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                height(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonDropdownWidget(
                      labelText: "Type",
                      borderRadius: 26,
                      backGroundColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                      items: [],
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                      fontColor: Theme.of(context).colorScheme.onSurface,
                      arrowColor: Theme.of(context).colorScheme.onSurface,
                      onChanged: (p0) {},
                    ),
                    width(12),
                    CommonDropdownWidget(
                      labelText: "Timeframe",
                      borderRadius: 26,
                      backGroundColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                      items: [],
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                      fontColor: Theme.of(context).colorScheme.onSurface,
                      arrowColor: Theme.of(context).colorScheme.onSurface,
                      onChanged: (p0) {},
                    ),
                    width(12),
                    CommonDropdownWidget(
                      labelText: "Min value",
                      borderRadius: 26,
                      backGroundColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                      items: [],
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                      fontColor: Theme.of(context).colorScheme.onSurface,
                      arrowColor: Theme.of(context).colorScheme.onSurface,
                      onChanged: (p0) {},
                    ),
                  ],
                ),
                height(24),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: AppConstant.commonText(
                      "Transaction History",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                  _buildDateText(text: "12/31/2023", context: context),
                  _buildRow(
                      imgT: false,
                      onTap: () {},
                      icon: Assets.imagesArrowUp,
                      typeName: "Sent",
                      time: "3:48 PM",
                      result: "-0.0922076 ETH",
                      value: "-CAS280.44",
                      context: context),
                  _buildRow(
                      imgT: false,
                      onTap: () {},
                      icon: Assets.imagesArrowDown,
                      typeName: "Recivied",
                      time: "3:48 PM",
                      result: "+99.7830 FLIP",
                      value: "-CAS280.44",
                      context: context),
                  height(12),
                  _buildDateText(text: "12/24/2023", context: context),
                  _buildRow(
                      imgT: true,
                      onTap: () {},
                      img:
                          "https://imgs.search.brave.com/gJJ2DXf7c2YPd4ycahYNJL8VPVNJzfps-iiLDeecNPw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/cG5nLXZlY3Rvci8y/MDIzMTIwMi9vdXJt/aWQvcG5ndHJlZS1y/b3VuZGVkLXJhc3Rl/ci1pY29uLW9mLWEt/c21vb3RoLWJsdWUt/ZG9sbGFyLXN5bWJv/bC1pbi1wbmctaW1h/Z2VfMTA4NTA0MTYu/cG5n",
                      typeName: "Fees",
                      time: "3:48 PM",
                      result: "-0.0922076 ETH",
                      value: "-CAS280.44",
                      context: context),
                  _buildRow(
                      imgT: false,
                      onTap: () {},
                      icon: Assets.imagesArrowDown,
                      typeName: "Recivied",
                      time: "3:48 PM",
                      result: "+99.7830 FLIP",
                      value: "-CAS280.44",
                      context: context),
                  _buildRow(
                      imgT: false,
                      onTap: () {},
                      icon: Assets.imagesArrowUp,
                      typeName: "Sent",
                      time: "3:48 PM",
                      result: "-0.0922076 ETH",
                      value: "-CAS280.44",
                      context: context),
                ],
              ),
            ),
          ),
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

  _buildDateText({required String text, required BuildContext context}) {
    return AppConstant.commonText(
      text,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
  }

  _buildRow(
      {String? icon,
      String? img,
      required Function() onTap,
      required bool imgT,
      required String typeName,
      required String time,
      required String result,
      required String value,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              child: imgT
                  ? CachedNetworkImage(
                      imageUrl: img ?? "",
                      height: 20.h,
                      width: 20,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    )
                  : Image.asset(icon ?? "",
                      height: 18.h,
                      width: 18.w,
                      fit: BoxFit.fitWidth,
                      color: Theme.of(context).colorScheme.primary),
            ),
            width(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText(typeName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.shadow),
                AppConstant.commonText(time,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppConstant.commonText(result,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: result.startsWith("-")
                        ? Theme.of(context).colorScheme.shadow
                        : Theme.of(context).colorScheme.onInverseSurface),
                AppConstant.commonText(value,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
