import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/counterparty_trading_requirement_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingPriceDialog extends StatelessWidget {
  const FloatingPriceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(6.h),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: AppConstant.commonText('Floating Price',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              alignment: Alignment.centerRight,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              )),
                        )
                      ],
                    ),
                    height(10.h),
                    const CommonTextfield(
                      title: 'Floating ratio',
                      hintText: '100%',
                    ),
                    const CommonTextfield(
                      title: 'Lowest price (optional)',
                      hintText: '3.14 CAD%',
                    ),
                    const CommonTextfield(
                      title: 'Trading quantity',
                      hintText: '5.12 USDT',
                    ),
                    const CommonTextfield(
                      title: 'Market',
                      hintText: 'Private',
                    ),
                    const CommonTextfield(
                      title: 'Withdrawal restriction',
                      hintText: 'T+10',
                    ),
                    height(8.h),
                    AppConstant.commonText('Single order limit',
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CommonTextfield(
                              title: '',
                              isShowSpaceAfterTitle: false,
                              inputType: TextInputType.number,
                              hintText: '13',
                              suffixWidget: AppConstant.commonText('CAD',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer)),
                        ),
                        width(12.w),
                        Expanded(
                          child: CommonTextfield(
                              title: '',
                              isShowSpaceAfterTitle: false,
                              inputType: TextInputType.number,
                              hintText: '0',
                              suffixWidget: AppConstant.commonText('CAD',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer)),
                        ),
                      ],
                    ),
                    height(5.h),
                    const CommonTextfield(
                      title: 'Payment deadline',
                      hintText: '15 Minutes',
                    ),
                    const CommonTextfield(
                      title: 'Payment Method',
                      hintText: 'Wise',
                    ),
                    height(10.h),
                    CounterpartyTradingRequirementWidget(
                      isTradingRequirement: false,
                      onToggle: (value) {},
                    ),
                    height(12.h),
                    const CommonTextfield(
                      title: 'Trading terms (optional)',
                      inputType: TextInputType.number,
                      maxLines: 4,
                    ),
                    const CommonTextfield(
                      title: 'Welcome message (optional)',
                      inputType: TextInputType.number,
                      maxLines: 4,
                    ),
                    height(10.h),
                    AppConstant.commonText('Choose your path',
                        fontSize: 12.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    height(10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonOutlinedButton(
                              isShowIconInPrefix: true,
                              icon: Image.asset(
                                Assets.imagesBitcoinRefresh,
                                height: 18.h,
                                width: 18.w,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              borderColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              onTap: () {},
                              textColor: Theme.of(context).colorScheme.shadow,
                              title: 'Buying'),
                        ),
                        width(10.w),
                        Expanded(
                          child: CommonOutlinedButton(
                              isShowIconInPrefix: true,
                              icon: Image.asset(
                                Assets.imagesBitcoinRefresh,
                                height: 18.h,
                                width: 18.w,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                              borderColor: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              onTap: () {},
                              textColor: Theme.of(context).colorScheme.shadow,
                              title: 'Selling'),
                        ),
                      ],
                    ),
                    height(35.h),
                    CommonButton(
                      name: 'Post',
                      onTap: () {},
                    ),
                    height(20.h),
                  ])),
        ));
  }
}
