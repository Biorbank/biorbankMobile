import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        var cubit = context.read<DashboardCubit>();
        if (state is BottomNavigationIndexChangeState) {
          cubit.selectedBottomTabIndex = state.index;
        }
        return Scaffold(
          key: Global.scaffoldKey,
          drawer: Drawer(
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            child: DrawerHeader(child: AppConstant.commonText('Drawer page',
                color: Theme.of(context).colorScheme.shadow)),
          ),
          body: cubit.bottomTabViews[cubit.selectedBottomTabIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: GestureDetector(
            onTap: () {
              cubit.onChnageBottomNavigationIndex(index: 4);
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
            height: 68.h,
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
            activeIndex: cubit.selectedBottomTabIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            leftCornerRadius: 0,
            rightCornerRadius: 0,
            onTap: (index) => cubit.onChnageBottomNavigationIndex(index: index),
          ),
          resizeToAvoidBottomInset: false,
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