import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/create_account/cubit/create_account_cubit.dart';
import 'package:biorbank/presentation/pages/create_account/widget/important_view.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:biorbank/utils/service/wallet_store_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../utils/app_strings.dart';
import '../../../common/common_appbar.dart';
import '../widget/create_account_field_view.dart';

@RoutePage()
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  buildScreenByStep(int step) {
    if (step == 0) {
      return const ImportantView();
    } else if (step == 1) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateAccountFieldView(),
            height(25.h),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountCubit, CreateAccountState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CreateAccountCubit>(context);
        return PopScope(
          canPop: cubit.step == 0,
          onPopInvoked: (didPop) {
            // if (cubit.step != 0) {
            //   cubit.updateStep(value: 0);
            // }
          },
          child: ValueListenableBuilder<bool>(
            valueListenable: cubit.isLoadingNotifier,
            builder: (context, isLoading, child) {
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Scaffold(
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height(14.h),
                          CommonAppbar(
                            onTapBack: () {
                              if (cubit.step == 0) {
                                Navigator.pop(context);
                              } else if (cubit.step == 1) {
                                cubit.updateStep(value: 0);
                              }
                            },
                            title: AppStrings.createNewAccount,
                          ),
                          Expanded(
                            child: buildScreenByStep(cubit.step),
                          ),
                          CommonButton(
                            name: cubit.step == 0 ? "I understand" : 'Next',
                            onTap: () async {
                              cubit.isLoadingNotifier.value = true;
                              if (cubit.step == 0) {
                                cubit.updateStep(value: 1);
                              } else {
                                if (cubit.formKey.currentState?.validate() ??
                                    false) {
                                  UserPreferences.setUserData(
                                      value:
                                          cubit.createPasswordController.text);

                                  Map map = {};
                                  map['seed_phrase'] = cubit.mnemonic;
                                  map['wallet_name'] =
                                      cubit.accountNameTextController.text;

                                  try {
                                    BiorBankWallet newWallet =
                                        await compute(generateNewWallet, map);
                                    await context
                                        .read<CryptoDBRepositoryImpl>()
                                        .storeWallet(newWallet);
                                  } catch (e) {
                                    LogService.logger.e(
                                        "==========GenerateNewWallet Error=========== ${e}");
                                  }
                                  // BiorbankAccounts.insertAccount(Account(
                                  //     id: 0,
                                  //     name: cubit.accountNameTextController.text,
                                  //     mnemonic: cubit.mnemonic));
                                  context.router.pushAndPopUntil(
                                    const DashboardRoute(),
                                    predicate: (route) => false,
                                  );
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //   context,
                                  //   Routes.dashboardRoute,
                                  //   (route) => false,
                                  // );
                                }
                              }
                              cubit.isLoadingNotifier.value = false;
                            },
                          ),
                          height(10.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
