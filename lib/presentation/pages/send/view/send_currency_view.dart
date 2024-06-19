import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/send/cubit/send_money_cubit.dart';
import 'package:biorbank/presentation/pages/send/view/widget/payment_sheet.dart';
import 'package:biorbank/presentation/pages/send/view/widget/send_money_crypto_tab.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendCurrencyView extends StatefulWidget {
  const SendCurrencyView({super.key});

  @override
  State<SendCurrencyView> createState() => _SendCurrencyViewState();
}

class _SendCurrencyViewState extends State<SendCurrencyView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context
          .read<SendMoneyCubit>()
          .onChangeTabIndex(index: tabController.index);
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
      child: BlocBuilder<SendMoneyCubit, SendMoneyState>(
        builder: (context, state) {
          var cubit = context.read<SendMoneyCubit>();
          if (state is SendMoneyTabIndexState) {
            cubit.sendTabIndex = state.index;
          } else if (state is SelectedAccountState) {
            cubit.selectedAccount = state.account;
          } else if (state is SelectedReceipentState) {
            cubit.selectedReceipent = state.account;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(20.h),
              CommonTabbar(
                  backgroundContainerMargin: 0,
                  selectedIndex: cubit.sendTabIndex,
                  length: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  tabAlignment: TabAlignment.fill,
                  isScrollable: false,
                  labelTextBackgroundPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  labelColor: Theme.of(context).colorScheme.shadow,
                  isShowBackgroundShadow: true,
                  onTap: (index) {},
                  tabController: tabController,
                  tabList: const ['Crypto', 'Cash']),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  SendMoneyCryptoTab(
                    onChangedAccount: (value) {
                      cubit.onChangeAccount(value: value);
                    },
                    onChangedReceipent: (value) {
                      cubit.onChangeReceipent(value: value);
                    },
                    onTapSend: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        useRootNavigator: true,
                        shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        context: context,
                        builder: (context) => const PaymentSheet(),
                      );
                    },
                  ),
                  const SizedBox()
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
