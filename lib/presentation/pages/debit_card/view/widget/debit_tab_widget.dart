import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/card_widget.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/history_detail_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/bloc/debitCard/debit_card_bloc.dart';
import '../../../../../utils/events/debit_card/debit_card_events.dart';
import '../../../../../utils/service/pay_with_moon_service.dart';

import '../../../../../utils/service/pay_with_moon_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/state/debit_card_state.dart';

class DebitTabWidget extends StatelessWidget {
  const DebitTabWidget({
    super.key,
    required this.isVisibleCardNumber,
    required this.onTapEyeButton,
    required this.onTapBlocButton,
    required this.onTapSettingButton,
  });

  final bool isVisibleCardNumber;
  final VoidCallback onTapEyeButton;
  final VoidCallback onTapBlocButton;
  final VoidCallback onTapSettingButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DebitCardBloc()
        ..add(FetchCardDetailsEvent('550e8400-e29b-41d4-a716-446655440000')), // Replace with actual cardId
      child: BlocBuilder<DebitCardBloc, DebitCardState>(
        builder: (context, state) {
          if (state is DebitCardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DebitCardLoaded) {
            return Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardWidget(
                        cardNumber: state.card.pan,
                        cvvNumber: state.card.cvv,
                        expiryDate: state.card.expiration,
                        isObscureText: !isVisibleCardNumber,
                      ),
                      height(20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: onTapEyeButton,
                              child: commonCardWidget(
                                  context: context,
                                  icon: isVisibleCardNumber
                                      ? Assets.imagesEyeHide
                                      : Assets.imagesEye,
                                  title: isVisibleCardNumber
                                      ? 'Hide details'
                                      : 'Show details'),
                            ),
                            GestureDetector(
                              onTap: onTapBlocButton,
                              child: commonCardWidget(
                                  context: context,
                                  icon: Assets.imagesCloseCircle,
                                  title: 'Block'),
                            ),
                            GestureDetector(
                              onTap: onTapSettingButton,
                              child: commonCardWidget(
                                  context: context,
                                  icon: Assets.imagesSetting,
                                  title: 'Setting'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  minChildSize: 0.3,
                  maxChildSize: 1,
                  builder: (context, scrollController) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          spreadRadius: 0,
                          offset: const Offset(2, 4),
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: HistoryDetailWidget(
                      transactions: state.transactions,
                      scrollController: scrollController,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is DebitCardError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No card data available.'));
          }
        },
      ),
    );
  }

  Widget commonCardWidget({
    required BuildContext context,
    required String icon,
    required String title,
  }) {
    return Container(
      width: 101.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: Column(
        children: [
          height(12.h),
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                icon,
                height: 20.h,
                width: 20.w,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
          ),
          height(8.h),
          AppConstant.commonText(
            title,
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
    );
  }
}
