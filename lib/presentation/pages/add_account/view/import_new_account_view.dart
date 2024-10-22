import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/add_account/widget/json_file_widget_view.dart';
import 'package:biorbank/presentation/pages/add_account/widget/phrase_key_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/common_spacer.dart';
import '../../../common/common_appbar.dart';

@RoutePage()
class ImportNewAccountScreen extends StatefulWidget {
  const ImportNewAccountScreen({super.key});

  @override
  State<ImportNewAccountScreen> createState() =>
      _ImportExistingAccountViewState();
}

class _ImportExistingAccountViewState extends State<ImportNewAccountScreen>
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(14.h),
              CommonAppbar(
                title: AppStrings.importExistingAccount,
                onTapBack: () {
                  context.back();
                },
              ),
              height(20.h),
              CommonTabbar(
                selectedIndex: 0,
                length: 2,
                backgroundContainerMargin: 0,
                labelContainerRadius: 6,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.fill,
                isScrollable: false,
                labelTextBackgroundPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                labelColor: Theme.of(context).colorScheme.shadow,
                isShowBackgroundShadow: true,
                onTap: (index) {},
                tabController: tabController,
                tabList: [AppStrings.pharseOrKey, AppStrings.jsonFile],
              ),
              Expanded(
                child: TabBarView(controller: tabController, children: const [
                  PhraseKeyWidget(),
                  JsonFileWidgetView(),
                ]),
              ),
              CommonButton(
                name: 'Next',
                onTap: () async {},
              ),
              height(25.h)
            ],
          ),
        ),
      ),
    );
  }
}
