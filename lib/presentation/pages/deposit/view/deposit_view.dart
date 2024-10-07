import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/deposit/cubit/deposit_cubit.dart';
import 'package:biorbank/presentation/pages/deposit/view/widget/crypto_tab_widget.dart';
import 'package:biorbank/presentation/pages/deposit/view/widget/token_address_dialog.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/database_service.dart/database_service.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepositView extends StatefulWidget {
  const DepositView({super.key});

  @override
  State<DepositView> createState() => _DepositViewState();
}

class _DepositViewState extends State<DepositView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context.read<DepositCubit>().onChangeTabIndex(index: tabController.index);
    });
    super.initState();
    updateState();
  }

  void updateState() async {
    final cubit = context.read<DepositCubit>();
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    cubit.onChangeAssetList(value: db.state.assetList);
    cubit.onChangeNetworkList(
        value: await DatabaseService.instance.getAllNetworks);
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
      child: BlocBuilder<DepositCubit, DepositState>(
        builder: (context, state) {
          var cubit = context.read<DepositCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(20.h),
              CommonTabbar(
                  backgroundContainerMargin: 0,
                  selectedIndex: cubit.depositTabIndex,
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
                child: TabBarView(
                  controller: tabController,
                  children: [
                    CryptoTabWidget(
                        onChangedAccount: (p0) {},
                        onChangedNetwork: (network) {
                          cubit.onChangeNetwork(value: network);
                        },
                        onChangedCoin: (coin) {
                          cubit.onChangeCoin(value: coin);
                        },
                        onChangedUSDTaddress: (value) {
                          cubit.onChangeQRcodeValue(value: value);
                        },
                        onTapCopyAddress: () {
                          if (cubit.selectedQr != null) {
                            Clipboard.setData(
                              ClipboardData(
                                text: cubit.selectedQr!,
                              ),
                            );
                          }
                        },
                        onTapShowQRcode: () {
                          if (cubit.selectedCoin != null &&
                              cubit.selectedQr != null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return TokenAddressDialog(
                                  selectedCoin: cubit.selectedCoin!,
                                  selectedQr: cubit.selectedQr!,
                                );
                              },
                            );
                          }
                        }),
                    const SizedBox()
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
