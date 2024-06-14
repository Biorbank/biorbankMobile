import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTabbar extends StatelessWidget {
  const CommonTabbar(
      {super.key,
      required this.selectedIndex,
      required this.length,
      required this.onTap,
      required this.tabController,
      this.padding,
      this.tabAlignment,
      this.labelColor,
      this.labelPadding,
      this.indicatorColor,
      this.labelContainerRadius,
      this.tabBarIndicatorSize,
      this.labelFontWight,
      this.isShowBackground=false,
      this.backgroundContainerMargin,
      this.labelTextBackgroundPadding,
      this.isScrollable=true,
      this.isShowBackgroundShadow = false,
      required this.tabList});
  final TabController tabController;
  final int length;
  final List<String> tabList;
  final int selectedIndex;
  final Function(int)? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? labelPadding;
  final EdgeInsets? labelTextBackgroundPadding;
  final bool isShowBackgroundShadow;
  final bool isShowBackground;
  final TabAlignment? tabAlignment;
  final TabBarIndicatorSize? tabBarIndicatorSize;
  final Color? labelColor;
  final Color? indicatorColor;
  final double? labelContainerRadius;
  final double? backgroundContainerMargin;
  final bool? isScrollable;
  final FontWeight? labelFontWight;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Container(
          width: double.infinity,
          margin: isShowBackgroundShadow
              ?  EdgeInsets.symmetric(horizontal:backgroundContainerMargin?? 15)
              : EdgeInsets.zero,
          decoration: isShowBackgroundShadow
              ? BoxDecoration(  
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(12),
                )
              : null,
          child: TabBar(
              onTap: onTap,
              indicatorColor: indicatorColor ?? AppColors.transparent,
              labelColor: labelColor,
              unselectedLabelColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              isScrollable: isScrollable??true,
              labelPadding:labelPadding?? const EdgeInsets.only(
                bottom: 6,
                top: 6,
              ),
              dividerHeight: 0,
              
              indicatorPadding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
              tabAlignment: tabAlignment ?? TabAlignment.start,
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: tabBarIndicatorSize ?? TabBarIndicatorSize.label,
              controller: tabController,
              tabs: tabList.map((e) {
                int index = tabList.indexOf(e);
                return isShowBackgroundShadow
                    ? Container(
                        decoration: selectedIndex == index
                            ? BoxDecoration(
                                color: AppColors.blue50,
                                borderRadius: BorderRadius.circular(labelContainerRadius??12),
                                boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).colorScheme.tertiary
                                          .withOpacity(0.15),
                                      spreadRadius: 0,
                                      blurRadius: 40,
                                      offset: const Offset(2, 4),
                                    ),
                                  ])
                            : null,
                        padding:labelTextBackgroundPadding?? const EdgeInsets.symmetric(
                            horizontal: 33, vertical: 10),
                        child: Center(
                          child: AppConstant.commonText(e,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.w600
                                  : FontWeight.w500),
                        ),
                      )
                    :isShowBackground? 
                    AppConstant.commonText(e,
                                fontSize: 16.sp,
                                fontWeight:selectedIndex == index
                                    ? labelFontWight
                                    : null)
                    : Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: selectedIndex == index
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                gradient: selectedIndex == index
                                    ? LinearGradient(colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.onPrimary,
                                      ])
                                    : null),
                            child: AppConstant.commonText(e,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == index
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer)),
                      );
              }).toList()),
        ));
  }
}
