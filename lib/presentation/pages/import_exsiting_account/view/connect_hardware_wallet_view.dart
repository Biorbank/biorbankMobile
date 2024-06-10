import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/widget/finding_ledger_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ConnectHardwareWalletScreen extends StatelessWidget {
  const ConnectHardwareWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(14.h),
              CommonAppbar(
                title: AppStrings.connectHardwareWallet,
              ),
              height(20.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.inversePrimary),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.blue50),
                        child: Image.asset(
                          Assets.imagesConnect,
                          height: 28.h,
                          width: 28.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      height(18.h),
                      AppConstant.commonText('Step 1',
                          color: Theme.of(context).colorScheme.shadow,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600),
                      height(10.h),
                      AppConstant.commonText('Connect and unlock your ledger',
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      height(18.h),
                      CommonButton(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onSurface,
                              context: context,
                              builder: (context) => const FindingLedgerWidget(),
                            );
                          },
                          name: 'Connect'),
                    ],
                  ),
                ),
              ),
              height(20.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.inversePrimary),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.blue50),
                        child: Image.asset(
                          Assets.imagesPhone,
                          height: 28.h,
                          width: 28.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      height(18.h),
                      AppConstant.commonText('Step 2',
                          color: Theme.of(context).colorScheme.shadow,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600),
                      height(10.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppConstant.commonText(
                            'Open the Cosmos app on your Ledger device',
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            textAlign: TextAlign.center),
                      ),
                      height(18.h),
                      CommonOutlinedButton(
                          onTap: () {
                            context.router.push(const NewAccountCreateRoute());

                            // Navigator.pushNamed(context, Routes.newAccountCreateRoute);
                          },
                          title: 'Connect'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
