import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';

class CommonTabbar extends StatelessWidget {
  const CommonTabbar(
      {super.key,
      required this.selectedIndex,
      required this.length,
      required this.onTap,
      required this.tabController,
      required this.tabList});
  final TabController tabController;
  final int length;
  final List<String> tabList;
  final int selectedIndex;
  final  Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: TabBar(
          onTap:onTap,
            indicatorColor: AppColors.transparent,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onSecondaryContainer,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(
              bottom: 10,
              top: 6,
            ),
            indicatorPadding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            tabs: tabList.map((e) {
              int index =tabList.indexOf(e);
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:selectedIndex == index
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                        gradient:selectedIndex == index
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
            }).toList()));
  }
}
