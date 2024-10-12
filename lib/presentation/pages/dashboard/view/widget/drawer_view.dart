import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/pages/price_alert/view/price_alert_screen.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/Theme/app_colors.dart';
import '../../../../../utils/global.dart';
import '../../../../../utils/routers/auto_app_router.dart';
import '../../../browser/defi_details_page/cubit/defi_detail_cubit.dart';
import '../../../market/cubit/market_cubit.dart';
import '../../cubit/dashboard_cubit.dart';

class DrawerView extends StatefulWidget {
  final DashboardCubit cubit;

  const DrawerView({super.key, required this.cubit});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(32),
          InkWell(
            onTap: () {
              Global.controller.hideDrawer();
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          height(28),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://as2.ftcdn.net/v2/jpg/03/83/25/83/1000_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              width(8),
              AppConstant.commonText(
                "Username",
                fontWeight: FontWeight.w600,
                fontSize: 14,
              )
            ],
          ),
          height(24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildName(title: AppStrings.quickAccess, context: context),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesHomeFill,
                    isSelected: cubit.selectItem == 1,
                    onTap: () {
                      cubit.selectItem = 1;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(4);
                      });
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                    },
                    title: AppStrings.home,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesContactLine,
                    isSelected: cubit.selectItem == 2,
                    onTap: () {
                      cubit.selectItem = 2;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(5);
                      });
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      // if (context.router.canPop()) {
                      //   context.router.back();
                      // }
                    },
                    title: AppStrings.contacts,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesFeedbackLine,
                    isSelected: cubit.selectItem == 3,
                    onTap: () {
                      cubit.selectItem = 3;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(6);
                      });
                    },
                    title: AppStrings.feedback,
                  ),
                  _buildName(title: AppStrings.menu, context: context),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesHoldingLine,
                    isSelected: cubit.selectItem == 4,
                    onTap: () {
                      cubit.selectItem = 4;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(12);
                      });
                    },
                    title: AppStrings.holdings,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesDebitCardLine,
                    isSelected: cubit.selectItem == 5,
                    onTap: () {
                      cubit.selectItem = 5;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(7);
                      });
                    },
                    title: AppStrings.debitCard,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesPriceAlertLine,
                    isSelected: cubit.selectItem == 6,
                    onTap: () {
                      cubit.selectItem = 6;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        // AutoTabsRouter.of(context).setActiveIndex(8);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PriceAlertScreen(),
                          ),
                        );
                        // context.router.push(const PriceAlertRoute());
                      });
                    },
                    title: AppStrings.priceAlerts,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesSwapLine,
                    isSelected: cubit.selectItem == 7,
                    onTap: () {
                      cubit.selectItem = 7;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        context.read<MarketCubit>().selectedTabIndex = 2;
                        AutoTabsRouter.of(context).setActiveIndex(1);
                      });
                    },
                    title: AppStrings.swap,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesStakingLine,
                    isSelected: cubit.selectItem == 8,
                    onTap: () {
                      cubit.selectItem = 8;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        context.read<DefiDetailCubit>().selectedTabIndex = 1;
                        AutoTabsRouter.of(context).setActiveIndex(0);
                      });
                    },
                    title: AppStrings.staking,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesTakeALoanLine,
                    isSelected: cubit.selectItem == 9,
                    onTap: () {
                      cubit.selectItem = 9;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        context.read<DefiDetailCubit>().selectedTabIndex = 2;
                        AutoTabsRouter.of(context).setActiveIndex(0);
                      });
                    },
                    title: AppStrings.takeALoan,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesP2pMarketLine,
                    isSelected: cubit.selectItem == 10,
                    onTap: () {
                      cubit.selectItem = 10;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(9);
                        // context.router.push(const P2pMarketRoute());
                      });
                    },
                    title: AppStrings.p2PMarket,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesCalendar,
                    isSelected: cubit.selectItem == 11,
                    onTap: () {
                      cubit.selectItem = 11;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(10);
                      });
                    },
                    title: AppStrings.history,
                  ),
                  _buildName(title: AppStrings.settings, context: context),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesSettingsLine,
                    isSelected: cubit.selectItem == 12,
                    onTap: () {
                      cubit.selectItem = 12;
                    },
                    title: AppStrings.settings,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesHelpCenterLine,
                    isSelected: cubit.selectItem == 13,
                    onTap: () {
                      cubit.selectItem = 13;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AutoTabsRouter.of(context).setActiveIndex(8);
                      });
                    },
                    title: AppStrings.helpCenter,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesSupportLine,
                    isSelected: cubit.selectItem == 14,
                    onTap: () {
                      cubit.selectItem = 14;
                    },
                    title: AppStrings.support,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesBackupLine,
                    isSelected: cubit.selectItem == 15,
                    onTap: () {
                      cubit.selectItem = 15;
                    },
                    title: AppStrings.backUp,
                    switchWidget: BlocBuilder<DashboardCubit, DashboardState>(
                      builder: (context, state) => FlutterSwitch(
                        width: 28.0,
                        height: 15.0,
                        toggleSize: 12.0,
                        activeColor: AppColors.green,
                        value: widget.cubit.isBackUp,
                        borderRadius: 25.0,
                        padding: 2,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            widget.cubit.isBackUp = val;
                          });
                          // widget.cubit.toggleBackUp(value: val);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: _buildItems(
              isSelected: false,
              context: context,
              icon: Assets.imagesLogoutLine,
              onTap: () {
                // UserPreferences.eraseData();

                context.router.replaceAll([const WelcomeRoute()]);
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   Routes.welcomeScreenRoute,
                //   (route) => false,
                // );
              },
              title: "Logout",
              color: Theme.of(context).colorScheme.onSurface,
            ),
          )
        ],
      ),
    );
  }

  _buildName({required String title, required BuildContext context}) {
    return AppConstant.commonText(title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface);
  }

  _buildItems({
    required BuildContext context,
    required String icon,
    required VoidCallback onTap,
    required String title,
    required bool isSelected,
    Widget? switchWidget,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 20.h,
              width: 20.w,
              color: isSelected
                  ? Theme.of(context).colorScheme.onSurface
                  : color ?? Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            width(10.w),
            AppConstant.commonText(
              title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Theme.of(context).colorScheme.onSurface
                  : color ?? Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const Spacer(),
            switchWidget ?? const SizedBox.shrink(),
            switchWidget == null ? width(0) : width(12),
          ],
        ),
      ),
    );
  }
}
