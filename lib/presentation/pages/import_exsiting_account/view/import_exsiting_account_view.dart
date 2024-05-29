import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/cubit/import_exsiting_account_cubit.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/widget/json_file_widget_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/widget/phrase_key_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/routers/app_router.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_strings.dart';
import '../../../../utils/app_widgets.dart';
import '../../../../utils/common_spacer.dart';
import '../../../common/common_appbar.dart';

class ImportExistingAccountView extends StatefulWidget {
  const ImportExistingAccountView({super.key});

  @override
  State<ImportExistingAccountView> createState() =>
      _ImportExistingAccountViewState();
}

class _ImportExistingAccountViewState extends State<ImportExistingAccountView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
                DefaultTabController(
                  length: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      indicatorColor: AppColors.transparent,
                      onTap: (value) {
                        cubit.changeTabIndex(index: value);
                      },
                      tabs: [
                        Container(
                          decoration: cubit.tabIndex == 0
                              ? BoxDecoration(
                                  color: AppColors.blue50,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFFAAAAAA)
                                            .withOpacity(0.15),
                                        spreadRadius: 0,
                                        blurRadius: 40,
                                        offset: const Offset(2, 4),
                                      ),
                                    ])
                              : null,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 2),
                          child: AppConstant.commonText(AppStrings.pharseOrKey,
                              fontWeight: tabController.index == 0
                                  ? FontWeight.w600
                                  : FontWeight.w500),
                        ),
                        Container(
                          decoration: tabController.index == 1
                              ? BoxDecoration(
                                  color: AppColors.blue50,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFFAAAAAA)
                                            .withOpacity(0.15),
                                        spreadRadius: 0,
                                        blurRadius: 40,
                                        offset: const Offset(2, 4),
                                      ),
                                    ])
                              : null,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 2),
                          child: AppConstant.commonText(AppStrings.jsonFile,
                              fontWeight: tabController.index == 1
                                  ? FontWeight.w600
                                  : FontWeight.w500),
                        ),
                      ],
                      unselectedLabelColor: const Color(0XFF757575),
                      padding: EdgeInsets.zero,
                      controller: tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
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
                    if (tabController.index == 0 &&
                        (cubit.formKey.currentState?.validate() ?? false)) {
                      tabController.animateTo(1);
                    } else {
                      if (tabController.index == 1) {
                        Navigator.pushNamed(
                            context, Routes.connectHardwareWalletRoute);
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
