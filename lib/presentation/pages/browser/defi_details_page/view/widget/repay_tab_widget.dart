import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayTabWidget extends StatelessWidget {
  const RepayTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(20.h),
            Row(
              children: [
                Expanded(
                  child: commonValueWidget(
                      context: context,
                      title: 'Collateral Value',
                      value: '339.98'),
                ),
                width(12.w),
                Expanded(
                  child: commonValueWidget(
                      context: context, title: 'Debt Value', value: '71.3502'),
                ),
              ],
            ),
            height(15.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppConstant.commonText('Collateral',
                        fontSize: 12.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  Expanded(
                    child: Center(
                      child: AppConstant.commonText('Debt',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: AppConstant.commonText('Unlock',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ),
                  ),
                ],
              ),
            ),
            height(10.h),
            ExpansionTile(
              // expandedCrossAxisAlignment: CrossAxisAlignment.start,
              // expandedAlignment: Alignment.centerLeft,
              childrenPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4),
              tilePadding: EdgeInsets.zero,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.transparent)),
              collapsedIconColor: Theme.of(context).colorScheme.shadow,
              iconColor: Theme.of(context).colorScheme.shadow,
              leading: CachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU',
                height: 30.h,
                width: 30.w,
                placeholder: (context, url) => const SizedBox(),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstant.commonText('0.09999 ETH',
                            fontSize: 12.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.shadow),
                        height(6.h),
                        AppConstant.commonText('\$0.09999 ETH',
                            fontSize: 12.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                      ],
                    ),
                  ),
                  width(20.w),
                  Expanded(
                    child: AppConstant.commonText('\$71.35',
                        fontSize: 12.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.shadow),
                  ),
                  Expanded(
                    child: AppConstant.commonText('12 days 8h',
                        fontSize: 12.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.shadow),
                  ),
                ],
              ),
              children: [
                height(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppConstant.commonText('Repay with:',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                    AppConstant.commonText('Balance: 0.0174470725',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ],
                ),
                height(10.h),
                 Row(
                   children: [
                     CommonDropdownWidget(
                          
                          labelText: '',
                          border: Border.all(color:Theme.of(context).colorScheme.onSecondaryFixed ),
                          //  value: cubit.selectedCurrency,
                        
                          borderRadius: 8,
                          height: 27.h,
                          items: [
                            CurrencyModel(
                                name: 'BTC',
                                url:
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
                            CurrencyModel(
                                name: 'ETH',
                                url:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU'),
                          ]
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: e.url,
                                        height: 14.h,
                                        width: 14.w,
                                        placeholder: (context, url) =>
                                            const SizedBox.shrink(),
                                      ),
                                      width(8.w),
                                      AppConstant.commonText(e.name,
                                          color:
                                              Theme.of(context).colorScheme.shadow,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ],
                                  )))
                              .toList(),
                          backGroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                          onChanged: (value) {
                            //cubit.onSelectCurrency(currency: value);
                          },
                        ),
                   ],
                 ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget commonValueWidget(
      {required BuildContext context,
      required String title,
      required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppConstant.commonText(title,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              Image.asset(
                Assets.imagesInfo,
                height: 16.h,
                width: 16.w,
              )
            ],
          ),
          height(10.h),
          AppConstant.commonText(value,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
        ],
      ),
    );
  }
}
