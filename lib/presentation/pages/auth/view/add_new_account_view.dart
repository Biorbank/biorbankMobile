import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/add_account/cubit/add_account_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:biorbank/utils/service/wallet_store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:trustdart/trustdart.dart';

@RoutePage()
class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({super.key});

  @override
  State<AddNewAccountScreen> createState() => _AddNewAccountScreenState();
}

class _AddNewAccountScreenState extends State<AddNewAccountScreen> {
  void generateMnemonic(
      {required AddAccountCubit cubit, required BuildContext context}) async {
    late String seedPhrase;
    //backup wallet
    if (AppHelper.command == AppCommand.backupSeedPhrase) {
      seedPhrase = AppHelper.walletService.currentWallet.seedPhrase;
    }
    //create wallet
    else {
      seedPhrase = WalletStoreService.generateMnemonic();
    }

    cubit.setMnemonic(value: seedPhrase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                height(14.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: _buildArrow(
                    context: context,
                    icon: Assets.imagesBackArrow,
                    onTap: () {
                      context.back();
                    },
                  ),
                ),
                height(76.h),
                Image.asset(
                  Assets.imagesAppIcon,
                  height: 100.h,
                  width: 90.w,
                ),
                height(25.h),
                AppConstant.commonText(AppStrings.selectAccountType,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black),
                height(35.h),
                CommonButton(
                  name: AppStrings.createNewAccount,
                  onTap: () {
                    context.router.push(const AddAccountRoute());

                    // Navigator.pushNamed(context, Routes.createAccountRoute);
                  },
                ),
                height(15),
                CommonButton(
                  name: AppStrings.importExistingAccount,
                  buttonColor: Theme.of(context).colorScheme.errorContainer,
                  textColor: Theme.of(context).colorScheme.shadow,
                  onTap: () {
                    context.router.push(const ImportNewAccountRoute());

                    // Navigator.pushNamed(
                    //     context, Routes.importExistingAccountRoute);
                  },
                ),
                height(15),
                CommonButton(
                  name: "Cold Storage",
                  buttonColor: Theme.of(context).colorScheme.errorContainer,
                  textColor: Theme.of(context).colorScheme.shadow,
                  onTap: () {
                    context.router.push(const ConnectHardwareWalletRoute());
                  },
                ),
                height(10),
                bottomOrWidget(),
                height(10),
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        name: "Google",
                        image: Assets.imagesGoogle,
                        buttonColor:
                            Theme.of(context).colorScheme.errorContainer,
                        textColor: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                    width(15),
                    Expanded(
                      child: CommonButton(
                        name: "Twitter",
                        image: Assets.imagesTwitter,
                        buttonColor:
                            Theme.of(context).colorScheme.errorContainer,
                        textColor: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottomOrWidget() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AppConstant.commonDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AppConstant.commonText("or continue",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          Expanded(
            child: AppConstant.commonDivider(),
          ),
        ],
      ),
    );
  }

  _buildArrow({
    required BuildContext context,
    required String icon,
    double? height,
    double? width,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        icon,
        height: height ?? 24.h,
        width: width ?? 24.w,
        color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
      ),
    );
  }
}
