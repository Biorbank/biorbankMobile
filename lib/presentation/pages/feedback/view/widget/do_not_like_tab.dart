import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/feedback/cubit/feedback_cubit_cubit.dart';
import 'package:biorbank/presentation/pages/feedback/view/widget/categories_dialog.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoNotLikeTab extends StatefulWidget {
  const DoNotLikeTab({super.key,required this.tabIndex});
 final int tabIndex;
  @override
  State<DoNotLikeTab> createState() => _DoNotLikeTabState();
}

class _DoNotLikeTabState extends State<DoNotLikeTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener((){
      context.read<FeedbackCubit>().changeNotLikeTabIndex(value: tabController.index);
    });
    super.initState();
  }
@override
  void dispose() {
   tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(10.h),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const CategoriesDialog(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondaryFixed)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Select Category',
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  Transform.rotate(
                    angle: -1.52,
                    child: Image.asset(
                      Assets.imagesBackArrow,
                      height: 16.h,
                      width: 16.w,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  )
                ],
              ),
            ),
          ),
          height(18.h),
          CommonTabbar(
              selectedIndex: widget.tabIndex,
              length: 2,
              backgroundContainerMargin: 0,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              tabAlignment: TabAlignment.fill,
              isScrollable: false,
              labelTextBackgroundPadding:
                  const EdgeInsets.symmetric(vertical: 10),
              labelColor: Theme.of(context).colorScheme.shadow,
              isShowBackgroundShadow: true,
              onTap: (index) {},
              tabController: tabController,
              tabList: const ['Vote', 'Add New']),
          Expanded(
            child: TabBarView(
                controller: tabController, children: [voteTabWidget(), const SizedBox()]),
          )
        ],
      ),
    );
  }

  Widget voteTabWidget() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 15),
      separatorBuilder: (context, index) => AppConstant.commonDivider(),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(4.r)),
              child: AppConstant.commonText('1',
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.shadow),
            ),
            width(20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText('Not able to check my matic balance',
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w500),
                height(4.h),
                AppConstant.commonText('Reported Bugs',
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w400),
              ],
            )
          ],
        ),
      ),
    );
  }
}
