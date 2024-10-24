import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/debit_card/cubit/debit_card_cubit.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/buy_card_tab.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/debit_tab_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/bloc/debitCard/freeze_card_bloc.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/events/debit_card/debit_card_events.dart';

@RoutePage()
class DebitCardScreen extends StatefulWidget {
  const DebitCardScreen({super.key});

  @override
  State<DebitCardScreen> createState() => _DebitCardScreenState();
}

class _DebitCardScreenState extends State<DebitCardScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DebitCardFreezeBloc()),
        BlocProvider(create: (context) => DebitCardCubit()),
      ],
      child: BlocListener<DebitCardFreezeBloc, DebitCardState>(
        listener: (context, blocState) {
          if (blocState is DebitCardFrozen) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(blocState.message),
                duration: const Duration(seconds: 2),
              ),
            );
          } else if (blocState is DebitCardError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(blocState.message),
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<DebitCardCubit, DebitCardState>(
          builder: (context, state) {
            var cubit = context.read<DebitCardCubit>();
            if (state is SortByFilterUpdateState) {
              cubit.selectedSortByFilter = state.value;
            } else if (state is OnlineInStoreFilterUpdateState) {
              cubit.selectedOnlineInStoreFilter = state.value;
            } else if (state is TypeFilterUpdateState) {
              cubit.selectedTypeFilter = state.value;
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
                          textController: TextEditingController(),
                          onTapTextField: () {
                            context.router.push(const CommonSearchRoute());
                          },
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
                        length: 2,
                        child: TabBar(
                          indicatorColor:
                          Theme.of(context).colorScheme.onPrimary,
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          labelPadding: const EdgeInsets.only(
                              bottom: 10, top: 6, right: 30),
                          controller: tabController,
                          isScrollable: true,
                          padding: const EdgeInsets.only(left: 20),
                          tabs: [
                            AppConstant.commonText('Debit', fontSize: 16.sp),
                            AppConstant.commonText('Buy card', fontSize: 16.sp),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        Assets.imagesFilter,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    width(20.w),
                  ],
                ),
                height(15.h),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      DebitTabWidget(
                        isVisibleCardNumber: cubit.isVisibleCardNumber,
                        onTapEyeButton: () {
                          cubit.toggleCardNumberVisibility();
                        },
                        onTapBlocButton: () {
                          context.read<DebitCardFreezeBloc>().add(
                              FreezeCardEvent('1',
                                  true)); // Replace '1' with actual card ID
                        },
                        onTapSettingButton: () {},
                      ),
                      BuyCardTab(
                        selectedTypeFilter: cubit.selectedTypeFilter,
                        selectedSortByFilter: cubit.selectedSortByFilter,
                        selectedOnlineInStoreFilter:
                        cubit.selectedOnlineInStoreFilter,
                        onTapSortByFilter: (filter) {
                          cubit.sortByFilterChange(filterValue: filter);
                        },
                        onTapOnlineInStoreFilter: (filter) {
                          cubit.onlineOrInStoreFilterChange(
                              filterValue: filter);
                        },
                        onTapTypeFilter: (filter) {
                          cubit.typeFilterChange(filterValue: filter);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
