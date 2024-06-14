import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/widget/provider_bottomsheet_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class StakingDefiScreen extends StatelessWidget {
  const StakingDefiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context.router.maybePop();
                            },
                            child: Image.asset(
                              Assets.imagesBackArrow,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                          AppConstant.commonText('Cosmos Hub (ATOM)',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          Image.asset(
                            Assets.imagesInfo,
                            height: 24.h,
                            width: 24.w,
                          )
                        ],
                      ),
                      height(25.h),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            children: [
                              height(8.h),
                              rowWidget(
                                  context: context,
                                  title: 'Available',
                                  value: '0 ATOM'),
                              height(12.h),
                              rowWidget(
                                  context: context,
                                  title: 'Staked',
                                  value: '0 ATOM'),
                              height(12.h),
                              rowWidget(
                                  context: context,
                                  title: 'APR',
                                  value: '13.88%'),
                              height(12.h),
                              rowWidget(
                                  context: context,
                                  title: 'Lock Time',
                                  value: '21 days'),
                              height(12.h),
                            ],
                          ),
                        ),
                      ),
                      height(16.h),
                      CommonTextfield(
                        title: 'Amount to stake',
                        hintText: 'ATOM amount',
                        borderRadius: 12.r,
                        onTapSuffixWidget: () {},
                        suffixWidget: AppConstant.commonText('Max',
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      height(10.h),
                      AppConstant.commonText('Validator',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow),
                      height(8.h),

                      /// validator
                      validatorWidget(context: context),
                      height(18.h),
                      stakDescription(context: context)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, -4),
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryFixedVariant
                            .withOpacity(0.12))
                  ]),
              child: CommonButton(
                name: 'Stake',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget stakDescription({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryFixed)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppConstant.commonText('•',
                      fontSize: 16.sp,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
                width(10.w),
                Expanded(
                  child: AppConstant.commonText(
                      'Staked funds are accessible 21 days after unstaking',
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                )
              ],
            ),
            height(10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppConstant.commonText('•',
                      fontSize: 16.sp,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
                width(10.w),
                Expanded(
                  child: AppConstant.commonText(
                      'You can unstake or redelegate at any time, normal network fees apply',
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget validatorWidget({required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: false,
          useSafeArea: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r))),
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          context: context,
          builder: (context) => const ProviderBottomsheetWidget(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).colorScheme.errorContainer),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.trustnodes.com/trustnodes-app-icon-1.webp',
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox.shrink(),
                  ),
                ),
                width(12.w),
                AppConstant.commonText('Trust Nodes',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow)
              ],
            ),
            Row(
              children: [
                AppConstant.commonText('APR',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                width(6.w),
                AppConstant.commonText('12.5%',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onInverseSurface),
                width(12.w),
                Transform.rotate(
                  angle: 3.15,
                  child: Image.asset(
                    Assets.imagesBackArrow,
                    height: 16.h,
                    width: 16.w,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rowWidget(
      {required BuildContext context,
      required String title,
      required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstant.commonText(title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        AppConstant.commonText(value,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.shadow),
      ],
    );
  }
}
