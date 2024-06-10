import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DefiDetailScreen extends StatefulWidget {
  const DefiDetailScreen({super.key});

  @override
  State<DefiDetailScreen> createState() => _DefiDetailScreenState();
}

class _DefiDetailScreenState extends State<DefiDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DefiDetailCubit, DefiDetailState>(
      builder: (context, state) {
        var cubit = context.read<DefiDetailCubit>();
        if (state is DefiDetailTabIndexChange) {
          cubit.selectedTabIndex = state.index;
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
                    height(35.h),
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
            Row(
              children: [
                Expanded(
                  child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                          dividerHeight: 0,
                          onTap: (value) {},
                          unselectedLabelColor:
                              Theme.of(context).colorScheme.onSecondaryContainer,
                          labelPadding: const EdgeInsets.only(
                            bottom: 10,
                            top: 6,
                            right: 30
                          ),
                          controller: tabController,
                          isScrollable: true,

                          padding:const EdgeInsets.only(left: 16),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabAlignment: TabAlignment.start,
                          tabs: [
                            AppConstant.commonText('NFT',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 0
                                    ? FontWeight.w500
                                    : null),
                            AppConstant.commonText('Staking',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 1
                                    ? FontWeight.w500
                                    : null),
                            AppConstant.commonText('Loans',
                                fontSize: 16.sp,
                                fontWeight: cubit.selectedTabIndex == 2
                                    ? FontWeight.w500
                                    : null),
                          ])),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Assets.imagesFilter,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
                width(20.w)
              ],
            ),
          ],
        );
      },
    );
  }
}
