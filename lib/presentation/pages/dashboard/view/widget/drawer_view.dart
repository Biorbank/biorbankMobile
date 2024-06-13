import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/global.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(6), bottomRight: Radius.circular(6))),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesFolderCloud,
                      height: 20.h,
                      width: 20.w,
                    ),
                    width(10.w),
                    AppConstant.commonText(AppStrings.backUp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                  ],
                ),
                SizedBox(
                  height: 16,
                  child: FittedBox(
                    child: DayNightSwitch(
                      value: false,
                      moonImage: const AssetImage(Assets.imagesMoon),
                      sunImage: const AssetImage(Assets.imagesDay),
                      onChanged: (value) {},
                    ),
                  ),
                )
              ],
            ),
            height(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    height(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppConstant.commonText('Goatskey',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.shadow),
                        width(10.w),
                        Image.asset(
                          Assets.imagesMessageEdit,
                          height: 16.h,
                          width: 16.w,
                        )
                      ],
                    ),
                    height(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        drawerTile(
                            context: context,
                            icon: Assets.imagesContact,
                            title: 'Contacts',
                            onTap: () {
                              AutoTabsRouter.of(context).setActiveIndex(5);
                              Global.scaffoldKey.currentState?.closeDrawer();
                              // if (context.router.canPop()) {
                              //   context.router.back();
                              // }
                            }),
                        drawerTile(
                            context: context,
                            icon: Assets.imagesHome,
                            title: 'Home',
                            onTap: () {
                              Global.scaffoldKey.currentState?.closeDrawer();

                              AutoTabsRouter.of(context).setActiveIndex(4);
                            }),
                        drawerTile(
                            context: context,
                            icon: Assets.imagesMessageFavorite,
                            title: 'Feedback',
                            onTap: () {
                              Global.scaffoldKey.currentState?.closeDrawer();

                              AutoTabsRouter.of(context).setActiveIndex(6);
                            }),
                      ],
                    ),
                    height(25.h),
                    AppConstant.commonDivider(),
                    height(25.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesHolding,
                        onTap: () {},
                        title: 'Holdings'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesCards,
                        onTap: () {
                          Global.scaffoldKey.currentState?.closeDrawer();
                          AutoTabsRouter.of(context).setActiveIndex(7);
                        },
                        title: 'Debit Card'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesDollarPrice,
                        onTap: () {},
                        title: 'Price Alerts'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesSwap,
                        onTap: () {},
                        title: 'Swap'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesStaking,
                        onTap: () {},
                        title: 'Staking'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesBitCoin,
                        onTap: () {},
                        title: 'Take a Loan'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesShop,
                        onTap: () {},
                        title: 'P2P Market'),
                    height(25.h),
                    AppConstant.commonDivider(),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesSettingFilled,
                        onTap: () {},
                        title: 'Settings'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesInfoFilled,
                        onTap: () {},
                        title: 'Help Center'),
                    height(18.h),
                    drawerActionTile(
                        context: context,
                        icon: Assets.imagesSupport,
                        onTap: () {},
                        title: 'Support'),
                    height(18.h),
                    AppConstant.commonDivider(),
                    height(18.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            UserPreferences.eraseData();

                            context.router.replaceAll([const WelcomeRoute()]);
                            // Navigator.pushNamedAndRemoveUntil(
                            //   context,
                            //   Routes.welcomeScreenRoute,
                            //   (route) => false,
                            // );
                          },
                          child: Image.asset(
                            Assets.imagesLogOut,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            Assets.imagesDiscord,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                        width(16.w),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            Assets.imagesTelegram,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                        width(16.w),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            Assets.imagesTwitter,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                    height(14.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerTile(
      {required BuildContext context,
      required String icon,
      required VoidCallback onTap,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 38.h,
            width: 38.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            child: Image.asset(
              icon,
              height: 19,
            ),
          ),
          height(10.h),
          AppConstant.commonText(title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow)
        ],
      ),
    );
  }

  Widget drawerActionTile(
      {required BuildContext context,
      required String icon,
      required VoidCallback onTap,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 20.h,
            width: 20.w,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          width(10.w),
          AppConstant.commonText(title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow)
        ],
      ),
    );
  }
}
