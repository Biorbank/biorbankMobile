import 'package:biorbank/presentation/pages/feedback/view/widget/bug_report_tab.dart';
import 'package:biorbank/presentation/pages/feedback/view/widget/categories_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/Theme/app_colors.dart';
import '../../../../../utils/app_widgets.dart';
import '../../../../../utils/common_spacer.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_outlined_button.dart';
import '../../../../common/common_tabbar.dart';
import '../../../../common/common_textfield.dart';
import '../../cubit/feedback_cubit_cubit.dart';

class HaveSuggestionTab extends StatefulWidget {
  final int tabIndex;

  const HaveSuggestionTab({super.key, required this.tabIndex});

  @override
  State<HaveSuggestionTab> createState() => _HaveSuggestionTabState();
}

class _HaveSuggestionTabState extends State<HaveSuggestionTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context
          .read<FeedbackCubit>()
          .changeNotLikeTabIndex(value: tabController.index);
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
    return BlocBuilder<FeedbackCubit, FeedbackState>(
      builder: (context, state) {
        var cubit = context.read<FeedbackCubit>();

        // Handling state conditions
        if (state is IncludedScreenshotState) {
          cubit.isIncludedScreenshot = state.value;
        } else if (state is ChangeNotLikeTabIndexState) {
          cubit.notLikeTabIndex = state.index;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
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
                      color: Theme.of(context).colorScheme.onSecondaryFixed,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant.commonText(
                        'Select Category',
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      Transform.rotate(
                        angle: -1.52,
                        child: Image.asset(
                          Assets.imagesBackArrow,
                          height: 16.h,
                          width: 16.w,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.h),
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
                tabList: const ['Vote', 'Add New'],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [voteTabWidget(), addNewTabWidget(context, cubit)],
                ),
              ),
            ],
          ),
        );
      },
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
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: AppConstant.commonText(
                '${index + 1}',
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText(
                  'Not able to check my matic balance',
                  color: Theme.of(context).colorScheme.shadow,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                AppConstant.commonText(
                  'Reported Bugs',
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addNewTabWidget(BuildContext context, FeedbackCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h), // Height padding
          AppConstant.commonText(
            'Please describe your suggestion',
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.shadow,
          ),
          SizedBox(height: 10.h),
          CommonTextfield(
            title: '',
            maxLines: 10,
            verticalPading: 0,
            isShowSpaceAfterTitle: false,
            isFilled: false,
            focusBorderColor: AppColors.transparent,
            hintText: "Don't include any sensitive or personal information",
          ),
          AnimatedBuilder(
            animation: tabController.animation!,
            builder: (context, child) {
              return tabController.index == 0
                  ? const SizedBox.shrink()
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText(
                          'Included Screenshot',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                        FlutterSwitch(
                          width: 33.0,
                          height: 18.0,
                          toggleSize: 14.0,
                          activeColor: AppColors.green,
                          value: cubit.isIncludedScreenshot,
                          borderRadius: 22.0,
                          padding: 2,
                          showOnOff: false,
                          onToggle: (val) {
                            cubit.toggleIncludedScreenshotSwitch(value: val);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonOutlinedButton(
                            borderColor:
                            Theme.of(context).colorScheme.onPrimary,
                            textColor:
                            Theme.of(context).colorScheme.onPrimary,
                            height: 48.h,
                            onTap: () {},
                            title: 'Cancel',
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: CommonButton(
                            onTap: () {},
                            name: 'Send',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}
