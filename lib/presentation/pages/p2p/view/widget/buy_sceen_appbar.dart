import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuySceenAppbar extends StatelessWidget {
  const BuySceenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBlueContainer(
                height: 200.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context.router.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 20,
                            ),
                          ),
                          CommonDropdownWidget(
                            labelText: '',
                            value: 'Buy',
                            isExpanded: false,
                            height: 30.h,
                            arrowColor: Theme.of(context).colorScheme.onSurface,
                            isUseBackgroundColor: false,
                            itemBackGroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.shadow,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                            items: ['Buy']
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: AppConstant.commonText(e,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                    ))
                                .toList(),
                            onChanged: (p0) {},
                          ),
                          Row(
                            children: [
                              AppConstant.commonText('CAD',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                              width(8.w),
                              Image.asset(
                                Assets.imagesSwapArrow,
                                height: 14.h,
                                width: 14.w,
                              ),
                              width(15.w),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_horiz,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      height(16.h),
                      AppConstant.commonText('You are buying monero',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurface),
                      height(18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgQsY1H2EV352pl38vSL65ty1_IaYN7XYaGYiTT6ud2EynZ6lteeqae8u3MLKaMgeC5Y4&usqp=CAU',
                                  height: 44.h,
                                  width: 44.w,
                                  placeholder: (context, url) =>
                                      const SizedBox.shrink(),
                                ),
                              ),
                              width(10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppConstant.commonText('XMR',
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                  height(6.h),
                                  AppConstant.commonText(
                                      'Reference price C\$1.55',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.2)),
                            child: Row(
                              children: [
                                Image.asset(
                                  Assets.imagesSwapArrow,
                                  height: 14.h,
                                  width: 14.w,
                                ),
                                width(8.w),
                                AppConstant.commonText('XMR',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ));
  }
}