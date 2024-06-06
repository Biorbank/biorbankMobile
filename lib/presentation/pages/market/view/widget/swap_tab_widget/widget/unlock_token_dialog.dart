import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/swap_tab_widget/widget/transaction_success_ripple_animation.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnlockTokenDialog extends StatelessWidget {
  const UnlockTokenDialog({super.key});

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
                var cubit = context.read<MarketCubit>();
                if (state is TransactionStatusState) {
                  cubit.transactionStatusID = state.id;
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        AppConstant.commonText(AppStrings.unlockToken,
                            fontSize: 14.sp,
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
                    height(14.h),
                    Visibility(
                        visible: cubit.transactionStatusID == 0,
                        child: currencyExchangeWidget(context: context)),
                    Visibility(
                      visible: cubit.transactionStatusID == 2,
                      child: Center(
                        child: CircularCountDownTimer(
                          width: 100.w,
                          isReverse: true,
                          textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          height: 100.h,
                          duration: 300,
                          fillColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          ringColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    Visibility(
                        visible: cubit.transactionStatusID == 1,
                        child: const TransactionSuccessRippleAnimation()),
                    height(15.h),
                    transactionDetailsWidget(
                        context: context,
                        status: cubit.transactionStatusID == 0
                            ? 'Pending'
                            : cubit.transactionStatusID == 1
                                ? 'Success'
                                : 'In Progress',
                        statusId: cubit.transactionStatusID,
                        transactionId: '0x32...ef61d'),
                    height(20.h),
                  ],
                );
              },
            )));
  }

  Widget transactionDetailsWidget(
      {required BuildContext context,
      required String status,
      required int statusId,
      required String transactionId}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimaryContainer)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Status',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        color: statusId == 1
                            ? const Color(0xFFCDEFDF)
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16)),
                    child: AppConstant.commonText(status,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: statusId == 1
                            ? const Color(0xFF16A965)
                            : Theme.of(context).colorScheme.shadow),
                  ),
                ],
              ),
              height(10.h),
              AppConstant.commonDivider(),
              height(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Txhash',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppConstant.commonText(transactionId,
                          color: Theme.of(context).colorScheme.shadow,
                          fontWeight: FontWeight.w500),
                      width(8.w),
                      Image.asset(
                        Assets.imagesCopyRounded,
                        height: 16.h,
                        width: 16.w,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      width(8.w),
                      Image.asset(
                        Assets.imagesExploreRounded,
                        height: 14.h,
                        width: 14.w,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        height(15.h),
        CommonButton(
          buttonColor: statusId == 2
              ? Theme.of(context).colorScheme.errorContainer
              : null,
          textColor:
              statusId == 2 ? Theme.of(context).colorScheme.shadow : null,
          name: statusId == 0
              ? AppStrings.confirm
              : statusId == 1
                  ? AppStrings.complete
                  : AppStrings.seeDetails,
          onTap: () {
            if (statusId == 0) {
              context.read<MarketCubit>().onChangeTransactionStatus(index: 2);
            } else {
              context.read<MarketCubit>().onChangeTransactionStatus(index: 1);
            }
          },
        ),
      ],
    );
  }

  Widget currencyExchangeWidget({required BuildContext context}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppConstant.commonText('0.0541651',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.shadow),
                      AppConstant.commonText('\$3,363.80 (-2.07%)',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://thumbs.dreamstime.com/b/ethereum-coin-isolated-one-shiny-golden-eth-physical-over-white-background-digital-blockchain-cryptocurrency-118284096.jpg',
                          height: 16.h,
                          width: 16.h,
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                        ),
                        width(8.w),
                        AppConstant.commonText('BTC',
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.shadow,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height(10.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppConstant.commonText('0.0541651',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.shadow),
                      AppConstant.commonText('\$3,363.80 (-2.07%)',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU',
                          height: 16.h,
                          width: 16.h,
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                        ),
                        width(8.w),
                        AppConstant.commonText('ETH',
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.shadow,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            height: 32.h,
            width: 32.w,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.onPrimary,
                ])),
            child: Image.asset(
              Assets.imagesArrowDown,
              height: 16.h,
              width: 16.h,
            ),
          ),
        ),
      ],
    );
  }
}
