import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/import_existing_account/cubit/import_existing_account_cubit.dart';
import 'package:biorbank/presentation/pages/import_existing_account/widget/json_file_widget_view.dart';
import 'package:biorbank/presentation/pages/import_existing_account/widget/phrase_key_widget.dart';
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
import '../../../../utils/common_spacer.dart';
import '../../../common/common_appbar.dart';

@RoutePage()
class ImportExistingAccountScreen extends StatefulWidget {
  const ImportExistingAccountScreen({super.key});

  @override
  State<ImportExistingAccountScreen> createState() =>
      _ImportExistingAccountViewState();
}

class _ImportExistingAccountViewState extends State<ImportExistingAccountScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context
          .read<ImportExistingAccountCubit>()
          .changeTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportExistingAccountCubit, ImportExistingAccountState>(
      builder: (context, state) {
        var cubit = context.read<ImportExistingAccountCubit>();
        if (state is TabIndexChangeState) {
          cubit.tabIndex = state.index;
        }
        return ValueListenableBuilder<bool>(
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
                          title: AppStrings.importExistingAccount,
                        ),
                        height(20.h),
                        CommonTabbar(
                          selectedIndex: cubit.tabIndex,
                          length: 2,
                          backgroundContainerMargin: 0,
                          labelContainerRadius: 6,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          tabAlignment: TabAlignment.fill,
                          isScrollable: false,
                          labelTextBackgroundPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 4),
                          labelColor: Theme.of(context).colorScheme.shadow,
                          isShowBackgroundShadow: true,
                          onTap: (index) {},
                          tabController: tabController,
                          tabList: [
                            AppStrings.pharseOrKey,
                            AppStrings.jsonFile
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: tabController,
                              children: const [
                                PhraseKeyWidget(),
                                JsonFileWidgetView(),
                              ]),
                        ),
                        CommonButton(
                          name: 'Next',
                          onTap: () async {
                            cubit.isLoadingNotifier.value = true;
                            if (cubit.tabIndex == 0 &&
                                (cubit.formKey.currentState?.validate() ??
                                    false)) {
                              // tabController.animateTo(1);
                              Map map = {};
                              map['seed_phrase'] =
                                  cubit.pharseKeyController.text;
                              map['wallet_name'] =
                                  cubit.walletNameController.text;

                              try {
                                BiorBankWallet newWallet =
                                    await compute(generateNewWallet, map);
                                await context
                                    .read<CryptoDBRepositoryImpl>()
                                    .storeWallet(newWallet);

                                UserPreferences.setUserData(
                                    value: cubit.createPasswordController.text);

                                context.router.pushAndPopUntil(
                                  const DashboardRoute(),
                                  predicate: (route) => false,
                                );
                              } catch (e) {
                                LogService.logger.e(
                                    "==========import Wallet Error=========== ${e}");
                              }
                            } else {
                              if (cubit.tabIndex == 1) {
                                context.router
                                    .push(const ConnectHardwareWalletRoute());
                                // Navigator.pushNamed(
                                //     context, Routes.connectHardwareWalletRoute);
                              }
                            }
                            cubit.isLoadingNotifier.value = false;
                          },
                        ),
                        height(25.h)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}