import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/widget/swap_description_dialog.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwapSettingDialog extends StatelessWidget {
  const SwapSettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: BlocBuilder<MarketCubit, MarketState>(
            builder: (context, state) {
              var cubit=context.read<MarketCubit>();
              if(state is SwapApprovalState){
                cubit.isSwapInfiniteApproval=state.isApproval;
              }
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        AppConstant.commonText(AppStrings.swapSetting,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, bottom: 12, top: 12),
                                child: Image.asset(
                                  Assets.imagesClose,
                                  height: 12.w,
                                  width: 12.w,
                                ),
                              )),
                        )
                      ],
                    ),
                    height(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText(
                            AppStrings.slipPageTolerancePerSwap,
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  const SwapDescriptionDialog(),
                            );
                          },
                          child: Image.asset(
                            Assets.imagesInfo,
                            height: 16.h,
                            width: 16.w,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        )
                      ],
                    ),
                    height(14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['0.5', '1%', '3%', 'Custom%']
                          .map((e) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer)),
                                child: AppConstant.commonText(e,
                                    color: Theme.of(context).colorScheme.shadow,
                                    fontSize: 12.sp),
                              ))
                          .toList(),
                    ),
                    height(14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText(AppStrings.infiniteApproval,
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        FlutterSwitch(
                          width: 35.0,
                          height: 20.0,
                          switchBorder: Border.all(color: AppColors.grey100),
                          toggleSize: 16.0,
                          activeColor: AppColors.green,
                          value:  cubit.isSwapInfiniteApproval,
                          borderRadius: 25.0,
                          padding: 2,
                          showOnOff: false,
                          onToggle: (val) {
                            cubit.onChangeSwapInfiniteApprvoval(value: val);
                          },
                        )
                      ],
                    ),
                    height(18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText(AppStrings.liquidSources,
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        Row(
                          children: [
                            AppConstant.commonText('5/5',
                                fontSize: 12.sp,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            width(6.w),
                            Transform.rotate(
                              angle: 3.15,
                              child: Image.asset(
                                Assets.imagesBackArrow,
                                height: 18.h,
                                width: 18.w,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    height(14.h),
                  ]);
            },
          )),
    );
  }
}
