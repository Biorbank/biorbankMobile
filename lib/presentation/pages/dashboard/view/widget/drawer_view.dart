import 'package:auto_route/auto_route.dart';
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
import '../../cubit/dashboard_cubit.dart';

class DrawerView extends StatefulWidget {
  final DashboardCubit cubit;

  const DrawerView({super.key, required this.cubit});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> with TickerProviderStateMixin {
  int selectItem = 1;

  @override
  Widget build(BuildContext context) {
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
                    isSelected: selectItem == 1,
                    onTap: () {
                      selectItem = 1;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();

                      AutoTabsRouter.of(context).setActiveIndex(4);
                    },
                    title: AppStrings.home,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesContactLine,
                    isSelected: selectItem == 2,
                    onTap: () {
                      selectItem = 2;
                      AutoTabsRouter.of(context).setActiveIndex(5);
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
                    isSelected: selectItem == 3,
                    onTap: () {
                      selectItem = 3;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();

                      AutoTabsRouter.of(context).setActiveIndex(6);
                    },
                    title: AppStrings.feedback,
                  ),
                  _buildName(title: AppStrings.menu, context: context),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesHoldingLine,
                    isSelected: selectItem == 4,
                    onTap: () {
                      selectItem = 4;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();

                      AutoTabsRouter.of(context).setActiveIndex(11);
                    },
                    title: AppStrings.holdings,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesDebitCardLine,
                    isSelected: selectItem == 5,
                    onTap: () {
                      selectItem = 5;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      AutoTabsRouter.of(context).setActiveIndex(7);
                    },
                    title: AppStrings.debitCard,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesPriceAlertLine,
                    isSelected: selectItem == 6,
                    onTap: () {
                      selectItem = 6;
                    },
                    title: AppStrings.priceAlerts,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesSwapLine,
                    isSelected: selectItem == 7,
                    onTap: () {
                      selectItem = 7;
                    },
                    title: AppStrings.swap,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesStakingLine,
                    isSelected: selectItem == 8,
                    onTap: () {
                      selectItem = 8;
                    },
                    title: AppStrings.staking,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesTakeALoanLine,
                    isSelected: selectItem == 9,
                    onTap: () {
                      selectItem = 9;
                    },
                    title: AppStrings.takeALoan,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesP2pMarketLine,
                    isSelected: selectItem == 10,
                    onTap: () {
                      selectItem = 10;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      context.router.push(const P2pMarketRoute());
                    },
                    title: AppStrings.p2PMarket,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesCalendar,
                    isSelected: selectItem == 11,
                    onTap: () {
                      selectItem = 11;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      AutoTabsRouter.of(context).setActiveIndex(9);
                    },
                    title: AppStrings.history,
                  ),
                  _buildName(title: AppStrings.settings, context: context),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesSettingsLine,
                    isSelected: selectItem == 12,
                    onTap: () {
                      selectItem = 12;
                    },
                    title: AppStrings.settings,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesHelpCenterLine,
                    isSelected: selectItem == 13,
                    onTap: () {
                      selectItem = 13;
                      Global.controller.hideDrawer();
                      Global.scaffoldKey.currentState?.closeDrawer();
                      AutoTabsRouter.of(context).setActiveIndex(8);
                    },
                    title: AppStrings.helpCenter,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesSupportLine,
                    isSelected: selectItem == 14,
                    onTap: () {
                      selectItem = 14;
                    },
                    title: AppStrings.support,
                  ),
                  _buildItems(
                    context: context,
                    icon: Assets.imagesBackupLine,
                    isSelected: selectItem == 15,
                    onTap: () {
                      selectItem = 15;
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

    // return Drawer(
    //   shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //           topRight: Radius.circular(6), bottomRight: Radius.circular(6))),
    //   backgroundColor: Theme.of(context).colorScheme.onSurface,
    //   child: DrawerHeader(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               children: [
    //                 Image.asset(
    //                   Assets.imagesFolderCloud,
    //                   height: 20.h,
    //                   width: 20.w,
    //                 ),
    //                 width(10.w),
    //                 AppConstant.commonText(AppStrings.backUp,
    //                     fontWeight: FontWeight.w500,
    //                     color: Theme.of(context).colorScheme.shadow),
    //               ],
    //             ),
    //             SizedBox(
    //               height: 16,
    //               child: FittedBox(
    //                 child: DayNightSwitch(
    //                   value: false,
    //                   moonImage: const AssetImage(Assets.imagesMoon),
    //                   sunImage: const AssetImage(Assets.imagesDay),
    //                   onChanged: (value) {},
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         height(20.h),
    //         Expanded(
    //           child: SingleChildScrollView(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 CircleAvatar(
    //                   radius: 31,
    //                   backgroundColor:
    //                       Theme.of(context).colorScheme.onPrimaryContainer,
    //                 ),
    //                 height(10.h),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     AppConstant.commonText('Goatskey',
    //                         fontSize: 18.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: Theme.of(context).colorScheme.shadow),
    //                     width(10.w),
    //                     Image.asset(
    //                       Assets.imagesMessageEdit,
    //                       height: 16.h,
    //                       width: 16.w,
    //                     )
    //                   ],
    //                 ),
    //                 height(16.h),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     drawerTile(
    //                         context: context,
    //                         icon: Assets.imagesContact,
    //                         title: 'Contacts',
    //                         onTap: () {
    //                           AutoTabsRouter.of(context).setActiveIndex(5);
    //                           Global.scaffoldKey.currentState?.closeDrawer();
    //                           // if (context.router.canPop()) {
    //                           //   context.router.back();
    //                           // }
    //                         }),
    //                     drawerTile(
    //                         context: context,
    //                         icon: Assets.imagesHome,
    //                         title: 'Home',
    //                         onTap: () {
    //                           Global.scaffoldKey.currentState?.closeDrawer();
    //
    //                           AutoTabsRouter.of(context).setActiveIndex(4);
    //                         }),
    //                     drawerTile(
    //                         context: context,
    //                         icon: Assets.imagesMessageFavorite,
    //                         title: 'Feedback',
    //                         onTap: () {
    //                           Global.scaffoldKey.currentState?.closeDrawer();
    //
    //                           AutoTabsRouter.of(context).setActiveIndex(6);
    //                         }),
    //                   ],
    //                 ),
    //                 height(25.h),
    //                 AppConstant.commonDivider(),
    //                 height(25.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesHolding,
    //                     onTap: () {},
    //                     title: 'Holdings'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesCards,
    //                     onTap: () {
    //                       Global.scaffoldKey.currentState?.closeDrawer();
    //                       AutoTabsRouter.of(context).setActiveIndex(7);
    //                     },
    //                     title: 'Debit Card'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesDollarPrice,
    //                     onTap: () {},
    //                     title: 'Price Alerts'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesSwap,
    //                     onTap: () {},
    //                     title: 'Swap'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesStaking,
    //                     onTap: () {},
    //                     title: 'Staking'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesBitCoin,
    //                     onTap: () {},
    //                     title: 'Take a Loan'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesShop,
    //                     onTap: () {
    //                       Global.scaffoldKey.currentState?.closeDrawer();
    //                       context.router.push(const P2pMarketRoute());
    //                     },
    //                     title: 'P2P Market'),
    //                 height(25.h),
    //                 AppConstant.commonDivider(),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesSettingFilled,
    //                     onTap: () {},
    //                     title: 'Settings'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesInfoFilled,
    //                     onTap: () {
    //                       Global.scaffoldKey.currentState?.closeDrawer();
    //                       AutoTabsRouter.of(context).setActiveIndex(8);
    //                     },
    //                     title: 'Help Center'),
    //                 height(18.h),
    //                 drawerActionTile(
    //                     context: context,
    //                     icon: Assets.imagesSupport,
    //                     onTap: () {},
    //                     title: 'Support'),
    //                 height(18.h),
    //                 AppConstant.commonDivider(),
    //                 height(18.h),
    //                 Row(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         UserPreferences.eraseData();
    //
    //                         context.router.replaceAll([const WelcomeRoute()]);
    //                         // Navigator.pushNamedAndRemoveUntil(
    //                         //   context,
    //                         //   Routes.welcomeScreenRoute,
    //                         //   (route) => false,
    //                         // );
    //                       },
    //                       child: Image.asset(
    //                         Assets.imagesLogOut,
    //                         height: 30.h,
    //                         width: 30.w,
    //                       ),
    //                     ),
    //                     const Spacer(),
    //                     GestureDetector(
    //                       onTap: () {},
    //                       child: Image.asset(
    //                         Assets.imagesDiscord,
    //                         height: 30.h,
    //                         width: 30.w,
    //                       ),
    //                     ),
    //                     width(16.w),
    //                     GestureDetector(
    //                       onTap: () {},
    //                       child: Image.asset(
    //                         Assets.imagesTelegram,
    //                         height: 30.h,
    //                         width: 30.w,
    //                       ),
    //                     ),
    //                     width(16.w),
    //                     GestureDetector(
    //                       onTap: () {},
    //                       child: Image.asset(
    //                         Assets.imagesTwitter,
    //                         height: 30.h,
    //                         width: 30.w,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 height(14.h),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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

// Widget drawerTile(
//     {required BuildContext context,
//     required String icon,
//     required VoidCallback onTap,
//     required String title}) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Column(
//       children: [
//         Container(
//           height: 38.h,
//           width: 38.w,
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Theme.of(context).colorScheme.onPrimaryContainer),
//           child: Image.asset(
//             icon,
//             height: 19,
//           ),
//         ),
//         height(10.h),
//         AppConstant.commonText(title,
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w500,
//             color: Theme.of(context).colorScheme.shadow)
//       ],
//     ),
//   );
// }

  ///

// Widget drawerActionTile(
//     {required BuildContext context,
//     required String icon,
//     required VoidCallback onTap,
//     required String title}) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Row(
//       children: [
//         Image.asset(
//           icon,
//           height: 20.h,
//           width: 20.w,
//           color: Theme.of(context).colorScheme.onSecondaryContainer,
//         ),
//         width(10.w),
//         AppConstant.commonText(title,
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w500,
//             color: Theme.of(context).colorScheme.shadow)
//       ],
//     ),
//   );
// }
}
