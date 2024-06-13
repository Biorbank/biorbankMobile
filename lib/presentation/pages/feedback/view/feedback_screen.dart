import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/feedback/cubit/feedback_cubit_cubit.dart';
import 'package:biorbank/presentation/pages/feedback/view/widget/bug_report_tab.dart';
import 'package:biorbank/presentation/pages/feedback/view/widget/do_not_like_tab.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

@RoutePage()
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
        if (state is IncludedScreenshotState) {
          cubit.isIncludedScreenshot = state.value;
        }else if(state is ChangeNotLikeTabIndexState){
          cubit.notLikeTabIndex=state.index;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBlueContainer(
              height: 120.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(45.h),
                    CommonSearchAppbar(
                      hintText: 'ID/USDT',
                      onTapBellIcon: () {},
                      textController: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: TabBar(
                      dividerHeight: 0,
                      indicatorColor: Theme.of(context).colorScheme.onPrimary,
                      onTap: (value) {},
                      isScrollable: true,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onSecondaryContainer,
                      labelPadding: const EdgeInsets.only(
                        bottom: 10,
                        right: 20,
                        top: 6,
                      ),
                      controller: tabController,
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Row(
                          children: [
                            tabImage(
                                context: context,
                                image: Assets.imagesLamp,
                                isSelected: true),
                            width(6.w),
                            AppConstant.commonText(
                              'Have suggestion',
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            tabImage(
                                context: context,
                                image: Assets.imagesBug,
                                isSelected: true),
                            width(6.w),
                            AppConstant.commonText(
                              'Bug report',
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            tabImage(
                                context: context,
                                image: Assets.imagesSmilySad,
                                isSelected: true),
                            width(6.w),
                            AppConstant.commonText(
                              'I do not like something',
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ])),
            ),
            height(15.h),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              const SizedBox(),
              const BugReportTab(),
              DoNotLikeTab(
                tabIndex: cubit.notLikeTabIndex,
              ),
            ])),
            height(15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant.commonText('Included Screenshot',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.shadow),
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
                      )
                    ],
                  ),
                  height(12.h),
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
                              title: 'Cancel')),
                      width(20.w),
                      Expanded(child: CommonButton(onTap: () {}, name: 'Send')),
                    ],
                  ),
                  height(20.h),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget tabImage(
      {required BuildContext context,
      required String image,
      required bool isSelected}) {
    return Image.asset(
      image,
      height: 20.h,
      width: 20.w,
      color: isSelected
          ? Theme.of(context).colorScheme.onPrimary
          : Theme.of(context).colorScheme.onSecondaryContainer,
    );
  }
}
