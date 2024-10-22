import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/alert_btn/create_alert_popup.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/tab_bar.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/enum/home_page_action_enum.dart';
import 'package:biorbank/utils/global.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/app_strings.dart';
import '../../../common/common_appbar.dart';
import '../cubit/token_cubit.dart';
import '../cubit/token_state.dart';

@RoutePage()
class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TokenCubit, TokenState>(
        builder: (context, state) {
          var cubit = context.read<TokenCubit>();
          if (state is TabBarIndexState) {
            cubit.selectedTabIndex = state.index;
          } else if (state is ChangeOverviewDropDown) {
            cubit.selectedValue = state.value;
          } else if (state is ChangeInfoDropDown1) {
            cubit.onChanged1Value = state.value;
          } else if (state is ChangeInfoDropDown2) {
            cubit.onChanged2Value = state.value;
          } else if (state is ExploreDropDownValueState) {
            cubit.selectedExplore = state.value;
          } else if (state is ChainDropDownValueState) {
            cubit.selectedChain = state.value;
          } else if (state is ChangeCrossingDropDown) {
            cubit.crossingValue = state.value;
          } else if (state is ChangeCadDropDown) {
            cubit.cadValue = state.value;
          } else if (state is SelectedTimeState) {
            cubit.selectedTime = state.time;
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CommonAppbar(
                    title: AppStrings.token,
                    onTapBack: () {
                      AutoTabsRouter.of(context).setActiveIndex(12);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 28, bottom: 16, left: 20, right: 20),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
                          height: 40.h,
                          width: 40,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
                        width(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppConstant.commonText("ETH",
                                color: Theme.of(context).colorScheme.shadow,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                            AppConstant.commonText("Ethereum",
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CreateAlertPopup(
                                  cubit: cubit,
                                  onChangedCrossing: (value) {
                                    cubit.changeCrossingDropDown(
                                        value: value ?? "");
                                  },
                                  onChangedCad: (value) {
                                    cubit.changeCadDropDown(value: value ?? "");
                                  },
                                  selectedTime: () {
                                    cubit.selectTime(time: cubit.selectedTime);
                                  },
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            child: Image.asset(Assets.imagesNotification,
                                height: 18.h,
                                width: 18.w,
                                fit: BoxFit.fitWidth,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildOwnedMarketValueContainer(
                            name: "Owned", value: "0.1304", context: context),
                      ),
                      width(9),
                      Expanded(
                        child: _buildOwnedMarketValueContainer(
                            name: "Market Value",
                            value: "\$327.10",
                            context: context),
                      ),
                    ],
                  ),
                  height(16),
                  Expanded(
                    child: TabBarViewScreen(
                      cubit: cubit,
                      onChanged1: (value) {
                        cubit.changeInfoDropDown1(value: value);
                      },
                      onChanged2: (value) {
                        cubit.changeInfoDropDown2(value: value);
                      },
                      onChangedOverView: (value) {
                        cubit.changeOverviewDropDown(value: value ?? "");
                      },
                      onTapOverView: (index) {
                        cubit.onTapeTradeActionOption(
                            value: cubit.tradeOptions[index]['type']);
                        // Tap
                        if (index == 0) {
                          context.read<DashboardCubit>().selectItem = 7;
                          context.read<MarketCubit>().selectedTabIndex = 1;
                          Global.controller.hideDrawer();
                          Global.scaffoldKey.currentState?.closeDrawer();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            AutoTabsRouter.of(context).setActiveIndex(1);
                          });
                        } else if (index == 1) {
                          Global.controller.hideDrawer();
                          Global.scaffoldKey.currentState?.closeDrawer();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            context.read<HomeCubit>().selectedOption =
                                ActionEnum.deposit;
                            AutoTabsRouter.of(context).setActiveIndex(4);
                          });
                        } else if (index == 2) {
                          Global.controller.hideDrawer();
                          Global.scaffoldKey.currentState?.closeDrawer();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            context.read<HomeCubit>().selectedOption =
                                ActionEnum.send;
                            AutoTabsRouter.of(context).setActiveIndex(4);
                          });
                        } else if (index == 3) {
                          Global.controller.hideDrawer();
                          Global.scaffoldKey.currentState?.closeDrawer();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            context.read<HomeCubit>().selectedOption =
                                ActionEnum.buyORsell;
                            AutoTabsRouter.of(context).setActiveIndex(4);
                          });
                        } else if (index == 4) {
                          Global.controller.hideDrawer();
                          Global.scaffoldKey.currentState?.closeDrawer();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            context.read<HomeCubit>().selectedOption =
                                ActionEnum.payBills;
                            AutoTabsRouter.of(context).setActiveIndex(4);
                          });
                        }
                      },
                      onChangedExplores: (value) {
                        cubit.changeExploreDropDown(value: value ?? "");
                      },
                      onChangedChain: (value) {
                        cubit.changeChainDropDown(value: value ?? "");
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildOwnedMarketValueContainer(
      {required String name,
      required String value,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                spreadRadius: 0.5,
                blurRadius: 10)
          ]),
      child: Column(
        children: [
          AppConstant.commonText(name,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          AppConstant.commonText(value,
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
