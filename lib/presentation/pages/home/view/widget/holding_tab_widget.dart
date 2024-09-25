import 'package:biorbank/presentation/pages/home/view/widget/common_add_account_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/my_accounts_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/price_detail_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/db/db_wallet.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/models/BiorBankWallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoldingTabWidget extends StatefulWidget {
  const HoldingTabWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<HoldingTabWidget> createState() => _HoldingTabWidgetState();
}

class _HoldingTabWidgetState extends State<HoldingTabWidget> {
  List<BiorBankWallet> wallets = [];

  @override
  void initState() {
    super.initState();
    _loadAccounts();
  }

  Future<void> _loadAccounts() async {
    setState(() {
      wallets = AppHelper.walletService.wallets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                AppConstant.commonText('My Accounts',
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                width(15.h),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                )
              ],
            ),
          ),
          height(14.h),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            separatorBuilder: (context, index) => height(10.h),
            itemCount: wallets.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyAccountsWidget(),
                  ),
                );
              },
              child: PriceDetailWidget(
                title: wallets[index].name,
                currentAmt: '\$${wallets[index].totalAmount}',
                differentAmt: '+0',
                isProfit: true,
                totalDifferentInPercentage: '+0%',
              ),
            ),
          ),
          height(15.h),
          AddAccountWidget(
            onTap: () {},
          )
        ],
      ),
    );
  }
}
