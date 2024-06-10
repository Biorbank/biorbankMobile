import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/cubit/import_exsiting_account_cubit.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/widget/json_file_widget_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/widget/phrase_key_widget.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          .read<ImportExsitingAccountCubit>()
          .changeTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child:
            BlocBuilder<ImportExsitingAccountCubit, ImportExsitingAccountState>(
          builder: (context, state) {
            var cubit = context.read<ImportExsitingAccountCubit>();
            if (state is TabIndexChangeState) {
              cubit.tabIndex = state.index;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(14.h),
                CommonAppbar(
                  title: AppStrings.importExsitingAccount,
                ),
                height(20.h),
                CommonTabbar(
                  selectedIndex: cubit.tabIndex,
                  length: 2,
                  labelTextBackgroundPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                  onTap: (index) {},
                  backgroundContainerMargin: 0,
                  tabController: tabController,
                  tabList: [AppStrings.pharseOrKey, AppStrings.jsonFile],
                  labelColor: Theme.of(context).colorScheme.shadow,
                  padding: EdgeInsets.zero,
                  labelContainerRadius: 6,
                  labelPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  tabAlignment: TabAlignment.center,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  isShowBackgroundShadow: true,
                ),
                Expanded(
                  child: TabBarView(controller: tabController, children: const [
                    PhraseKeyWidget(),
                    JsonFileWidgetView(),
                  ]),
                ),
                CommonButton(
                  name: 'Next',
                  onTap: () {
                    if (cubit.tabIndex == 0 &&
                        (cubit.formKey.currentState?.validate() ?? false)) {
                      tabController.animateTo(1);
                    } else {
                      if (cubit.tabIndex == 1) {
                      context.router.push(const ConnectHardwareWalletRoute());
                        // Navigator.pushNamed(
                        //     context, Routes.connectHardwareWalletRoute);
                      }
                    }
                  },
                ),
                height(25.h)
              ],
            );
          },
        ),
      )),
    );
  }
}
