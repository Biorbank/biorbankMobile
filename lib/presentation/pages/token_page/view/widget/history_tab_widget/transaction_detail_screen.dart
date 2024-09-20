import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              CommonAppbar(title: AppStrings.transactionDetails),
              height(24),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 2),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onSurface,
                                  child: Image.asset(
                                    Assets.imagesArrowDown,
                                    height: 24.h,
                                    width: 24,
                                  ),
                                ),
                                height(4),
                                AppConstant.commonText("Received",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                                height(12),
                                _buildResultText(
                                    result: "+99.7830 FLIP", context: context),
                                AppConstant.commonText("+CA\$280.44",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                                height(12),
                                _buildConfirmContainer(
                                    context: context,
                                    text: "Confirmed (468182)",
                                    h: h,
                                    w: w),
                              ],
                            ),
                          ],
                        ),
                        height(20),
                        _buildDetailColumn(
                            name: "Account",
                            value: "Chianflip",
                            context: context),
                        _buildDetailColumn(
                            name: "Date",
                            value: "12/24/2023 - 10:58 PM",
                            context: context),
                        _buildNetworkFeesDetailColumn(
                            name: "Network fees",
                            value: "0.00410521 ETH",
                            value2: " = CA\$12.394",
                            context: context),
                        _buildDetailColumn(
                            name: "Transaction ID",
                            value:
                                "0x3d7934734uwoi34ujebrbiu3u43343u3u3bjjfudbdjdvj2922444d",
                            context: context),
                        _buildDetailColumn(
                            name: "From",
                            value: "0x3d7934734uwoi34ujebrbiu3u43343u3u3bjjw",
                            context: context),
                        _buildDetailColumn(
                            name: "To",
                            value: "0x23udbfi77wbioi34ujebrbiu3u43343tywew821",
                            context: context),
                      ],
                    ),
                  ),
                ),
              ),
              height(24),
              CommonButton(
                name: "View in Explorer",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildResultText({required String result, required BuildContext context}) {
    return AppConstant.commonText(result,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: result.startsWith("-")
            ? Theme.of(context).colorScheme.shadow
            : Theme.of(context).colorScheme.onInverseSurface);
  }

  _buildConfirmContainer(
      {required BuildContext context,
      required String text,
      required double w,
      required double h}) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 14, right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.2),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size(w * 0.45, h)),
        child: Row(
          children: [
            CircleAvatar(
                radius: 3,
                backgroundColor:
                    Theme.of(context).colorScheme.onInverseSurface),
            width(10),
            Expanded(
              child: AppConstant.commonText(
                text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDetailColumn(
      {required String name,
      required String value,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.commonText(name,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          AppConstant.commonText(value,
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  _buildNetworkFeesDetailColumn(
      {required String name,
      required String value,
      required String value2,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.commonText(name,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          Row(
            children: [
              AppConstant.commonText(value,
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
              AppConstant.commonText(value2,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }
}
