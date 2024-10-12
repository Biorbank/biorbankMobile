import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/common_filter_widget.dart';
import 'package:biorbank/presentation/pages/history/view/widget/filter_bottom_sheet.dart';
import 'package:biorbank/presentation/pages/history/view/widget/time_frame_calender_view.dart';
import 'package:biorbank/presentation/pages/history/view/widget/type_bottom_sheet.dart';
import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/app_widgets.dart';
import '../../../../utils/common_spacer.dart';
import '../../../common/common_blue_container.dart';
import '../../../common/common_search_appbar.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<void> refreshHandler() async {
    await context.read<CryptoDBRepositoryImpl>().updateTransactionHistory();
    // ignore: use_build_context_synchronously
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonBlueContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(40.h),
                CommonSearchAppbar(
                  hintText: 'ID/USDT',
                  textController: TextEditingController(),
                  onTapTextField: () {
                    context.router.push(const CommonSearchRoute());
                    //  Navigator.pushNamed(context, Routes.serachViewRoute);
                  },
                ),
                height(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        AppConstant.commonText(
                          "Balance",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                        BlocBuilder<CryptoDBRepositoryImpl,
                            CryptoDBRepositoryState>(builder: (context, state) {
                          return AppConstant.commonText(
                            "\$${AppHelper.walletService.currentWallet.totalAmount <= 0.0001 ? 0 : AppHelper.walletService.currentWallet.totalAmount.toStringAsFixed(4)}",
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          );
                        }),
                        Row(
                          children: [
                            AppConstant.commonText(
                              "CA \$0.00 (0.00%)",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                            ),
                            width(4),
                            AppConstant.commonText(
                              "past week",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                height(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                          context: context,
                          builder: (context) => const TypeBottomSheet(),
                        );
                      },
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          borderRadius: BorderRadius.circular(
                            26.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            AppConstant.commonText('Type',
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                            width(15.h),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Transform.rotate(
                                angle: 0,
                                child: Image.asset(
                                  Assets.imagesChevronDown,
                                  height: 18,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    width(12),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                          context: context,
                          builder: (context) => const TimeFrameCalenderView(),
                        );
                      },
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          borderRadius: BorderRadius.circular(
                            26.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            AppConstant.commonText('Timeframe',
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                            width(15.h),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Transform.rotate(
                                angle: 0,
                                child: Image.asset(
                                  Assets.imagesChevronDown,
                                  height: 18,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    width(12),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                          context: context,
                          builder: (context) => const FilterBottomSheet(),
                        );
                      },
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                          borderRadius: BorderRadius.circular(
                            26.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            AppConstant.commonText('Filter',
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                            width(15.h),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Transform.rotate(
                                angle: 0,
                                child: Image.asset(
                                  Assets.imagesFilterLine,
                                  height: 18,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                height(24),
              ],
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: refreshHandler,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: AppConstant.commonText(
                        "Transaction History",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                    BlocBuilder<CryptoDBRepositoryImpl,
                        CryptoDBRepositoryState>(builder: (context, state) {
                      return _buildTransactionHistory(state);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildTransactionHistory(CryptoDBRepositoryState state) {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    List<TransactionHistoryImpl> hTList = state.historyList.toList();
    hTList.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));

    // Group transactions by date
    Map<String, List<TransactionHistoryImpl>> groupedTransactions = {};
    for (var transaction in hTList) {
      String date = transaction.timeStamp
          .toLocal()
          .toString()
          .split(' ')[0]; // Extract date part
      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }

    // Build the list of widgets
    List<Widget> widgetList = [];
    groupedTransactions.forEach((date, transactions) {
      widgetList.add(_buildDateText(text: date, context: context));
      for (var transaction in transactions) {
        String sign = transaction.type == TransactionType.send ? "-" : "+";
        final DateFormat formatter = DateFormat('hh:mm a');

        widgetList.add(_buildRow(
          imgT: transaction.type == TransactionType.send ? false : true,
          onTap: () {
            // Handle onTap
          },
          icon: transaction.type == TransactionType.send
              ? Assets.imagesArrowUp
              : Assets.imagesArrowDown,
          typeName: transaction.state.status == TransactionStatus.pending
              ? "Pending..."
              : transaction.state.status == TransactionStatus.failed
                  ? "Failed"
                  : (transaction.type == TransactionType.send
                      ? "Sent"
                      : "Received"),
          time: formatter.format(transaction.timeStamp.toLocal()),
          result:
              "${sign}${transaction.info.amount} ${db.state.assetList[transaction.assetIndex].getAsset().symbol}",
          value: "", // Adjust this as needed
          context: context,
        ));
      }
      widgetList.add(height(12)); // Add spacing between date groups
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }

  _buildArrow(
      {required BuildContext context,
      required String icon,
      double? height,
      double? width}) {
    return Image.asset(
      icon,
      height: height ?? 24.h,
      width: width ?? 24.w,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  _buildDateText({required String text, required BuildContext context}) {
    return AppConstant.commonText(
      text,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
  }

  _buildRow(
      {String? icon,
      String? img,
      required Function() onTap,
      required bool imgT,
      required String typeName,
      required String time,
      required String result,
      required String value,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              child: imgT
                  ? CachedNetworkImage(
                      imageUrl: img ?? "",
                      height: 20.h,
                      width: 20,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    )
                  : Image.asset(icon ?? "",
                      height: 18.h,
                      width: 18.w,
                      fit: BoxFit.fitWidth,
                      color: Theme.of(context).colorScheme.primary),
            ),
            width(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText(typeName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.shadow),
                AppConstant.commonText(time,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppConstant.commonText(result,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: result.startsWith("-")
                        ? Theme.of(context).colorScheme.shadow
                        : Theme.of(context).colorScheme.onInverseSurface),
                AppConstant.commonText(value,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
