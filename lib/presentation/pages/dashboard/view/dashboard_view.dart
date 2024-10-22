import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:biorbank/presentation/pages/dashboard/view/widget/drawer_view.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/global.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../market/cubit/market_cubit.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        DateTime? lastPressed;
        var cubit = context.read<DashboardCubit>();
        if (state is BottomNavigationIndexChangeState) {
          cubit.selectedBottomTabIndex = state.index;
        }
        return AutoTabsRouter(
          routes: [
            // DefiRoute(),
            DefiDetailRoute(index: 1),
            // MarketRoute(isSwap: false,index: 0),
            const MarketRoute(),
            const BrowserRoute(),
            const ChatRoute(),
            const DefiNavigationRoute(),
            const ContactRoute(),
            const FeedbackRoute(),
            const DebitCardRoute(),
            // const PriceAlertRoute(),
            const HelpCenterRoute(),
            const P2pMarketRoute(),
            const HistoryRoute(),
            const MyAccountsRoute(),
            const AssetRoute(),
            const TokenRoute(),
          ],
          //  transitionBuilder:_customTransitionBuilder ,
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return AdvancedDrawer(
              controller: Global.controller,
              childDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                    offset: const Offset(-45, 5),
                    spreadRadius: -30,
                    blurStyle: BlurStyle.inner,
                  ),
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.2),
                    offset: const Offset(-80, 5),
                    spreadRadius: -50,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              animationController: AnimationController(vsync: this),
              animateChildDecoration: true,
              openRatio: 0.65,
              animationCurve: Curves.easeIn,
              animationDuration: const Duration(milliseconds: 300),
              backdropColor: Theme.of(context).colorScheme.primary,
              drawer: DrawerView(cubit: cubit),
              child: WillPopScope(
                onWillPop: () async {
                  final now = DateTime.now();
                  final backButtonHasNotBeenPressedOrSnackBarClosed =
                      lastPressed == null ||
                          now.difference(lastPressed!) >
                              const Duration(seconds: 2);
                  if (backButtonHasNotBeenPressedOrSnackBarClosed) {
                    lastPressed = now;
                    tabsRouter.setActiveIndex(4);
                    cubit.selectItem = 1;
                    return false;
                  }
                  return true;
                },
                child: Scaffold(
                  key: Global.scaffoldKey,
                  // drawer: const DrawerView(),
                  body: child,
                  //cubit.bottomTabViews[cubit.selectedBottomTabIndex],
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: GestureDetector(
                    onTap: () {
                      tabsRouter.setActiveIndex(4);
                      final stackRouter = tabsRouter
                          .innerRouterOf<StackRouter>(DefiNavigationRoute.name);
                      context.read<HomeCubit>().tabIndex = 0;
                      context
                          .read<HomeCubit>()
                          .onTapeTradeActionOption(value: null);
                      stackRouter?.popUntilRoot();
                    },
                    child: Container(
                      height: 58.h,
                      width: 58.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(colors: [
                          Color(0xFF1C1460),
                          Color(0xFF2E31B7),
                        ]),
                        color: Theme.of(context).colorScheme.onPrimary,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onPrimary,
                            spreadRadius: 1,
                            blurRadius: 12,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesStar,
                          ),
                          Image.asset(
                            Assets.imagesHomeIconWhite,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                    height: 75.h,
                    itemCount: cubit.navigationItems.length,
                    tabBuilder: (index, isActive) {
                      var data = cubit.navigationItems[index];
                      return _buildBottomBar(
                        context: context,
                        enabled: isActive,
                        iconPath: data['icon'],
                        selectedIconPath: data['active_icon'],
                        title: data['title'],
                      );
                    },
                    shadow: Shadow(
                      color: const Color(0xFF002A80).withOpacity(0.10),
                      blurRadius: 32,
                      offset: const Offset(0, -8),
                    ),
                    activeIndex: tabsRouter.activeIndex,
                    gapLocation: GapLocation.center,
                    notchSmoothness: NotchSmoothness.defaultEdge,
                    leftCornerRadius: 0,
                    rightCornerRadius: 0,
                    onTap: (index) {
                      tabsRouter.setActiveIndex(index);
                      if (index == 1) {
                        context.read<MarketCubit>().selectedTabIndex = 0;
                      }
                      //  cubit.onChnageBottomNavigationIndex(index: index);
                    },
                  ),
                  resizeToAvoidBottomInset: false,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomBar({
    required BuildContext context,
    required String iconPath,
    required String selectedIconPath,
    required String title,
    required bool enabled,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: const Alignment(1.5, -3),
          children: [
            Image.asset(
              enabled ? selectedIconPath : iconPath,
              height: 25,
              width: 25,
            ),
          ],
        ),
        const SizedBox(height: 5),
        AppConstant.commonText(title,
            color: enabled
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
