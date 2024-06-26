import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/token_page/cubit/token_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_bar_chart/progress_bar_chart.dart';

import '../../../../common/custom_dropdown_widget.dart';

class InfoTabScreen extends StatelessWidget {
  final TokenCubit cubit;
  final Function(dynamic) onChanged1;
  final Function(dynamic) onChanged2;

  const InfoTabScreen(
      {super.key,
      required this.cubit,
      required this.onChanged1,
      required this.onChanged2});

  @override
  Widget build(BuildContext context) {
    final List<StatisticsItem> stats = [
      StatisticsItem(Theme.of(context).colorScheme.surface, 75.27),
      StatisticsItem(Theme.of(context).colorScheme.onInverseSurface, 21.10),
      StatisticsItem(Theme.of(context).colorScheme.surfaceBright, 3.63),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: CommonDropdownWidget(
                    labelText: "items",
                    value: cubit.onChanged1Value,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondaryFixed),
                    isExpanded: true,
                    arrowColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                    dropDownContentPadding: EdgeInsets.zero,
                    items: cubit.items.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: items.url ?? "",
                              height: 20.h,
                              width: 20,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                            ),
                            width(5),
                            Text(items.name ?? ""),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    Assets.imagesSwapArrow,
                    height: 23,
                    width: 23,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Expanded(
                  child: CommonDropdownWidget(
                    labelText: "items",
                    value: cubit.onChanged2Value,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondaryFixed),
                    isExpanded: true,
                    arrowColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                    dropDownContentPadding: EdgeInsets.zero,
                    items: cubit.items.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: items.url ?? "",
                              height: 20.h,
                              width: 20,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                            ),
                            width(5),
                            Text(items.name ?? ""),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 14.sp),
                children: [
                  const TextSpan(text: "if "),
                  WidgetSpan(
                    child: _buildCachedImg(
                      imgUrl:
                          "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png",
                    ),
                  ),
                  _buildBlackTextSpan(name: ' ETH ', context: context),
                  const TextSpan(text: 'had '),
                  WidgetSpan(
                    child: _buildCachedImg(
                      imgUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png",
                    ),
                  ),
                  _buildBlackTextSpan(name: ' Bitcoin ', context: context),
                  const TextSpan(text: 'market cap of '),
                  _buildBlackTextSpan(name: '\$1.0T,', context: context),
                  const TextSpan(text: '\n1 XMR would be worth'),
                  _buildBlackTextSpan(name: ' \$56.3k ', context: context),
                  const TextSpan(text: ', an upside of '),
                  _buildBlackTextSpan(
                      name: '451x',
                      context: context,
                      color: Theme.of(context).colorScheme.onInverseSurface),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildColumnText(
                          name: "Market Cap",
                          value: "301.68 B USDT",
                          context: context),
                      _buildColumnText(
                          name: "Volume 24h",
                          value: "7.68 B USDT",
                          context: context),
                      _buildColumnText(
                          name: "Max Supply", value: "--", context: context),
                      _buildColumnText(
                          name: "All Time High",
                          value: "4,890.12 USDT",
                          context: context),
                      _buildColumnText(
                          name: "All Time Low",
                          value: "0.4207 USDT",
                          context: context),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildColumnText(
                          name: "Fully Diluted Market Cap",
                          value: "301.68 B USDT",
                          context: context),
                      _buildColumnText(
                          name: "Circulating Supply",
                          value: "120.17 M ETH",
                          context: context),
                      _buildColumnText(
                          name: "Total Supply",
                          value: "120.17 M ETH",
                          context: context),
                      _buildColumnText(
                          name: "Rank", value: "#2", context: context),
                      _buildColumnText(
                          name: "Market Dominance",
                          value: "16.67%",
                          context: context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildDivider(context: context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: _buildColumnText(
                      name: "Whale Holdings",
                      value: "37.85%",
                      context: context),
                ),
                Expanded(
                  child: _buildColumnText(
                      name: "Holding Addresses",
                      value: "112.09 M",
                      context: context),
                ),
              ],
            ),
          ),
          _buildDivider(context: context),
          height(20),
          AppConstant.commonText("Addresses by Time Held",
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          Row(
            children: [
              Expanded(
                child: _buildAddressesByTimeHeld(
                    name: "Holder (1y+)",
                    value: "75.27%",
                    color: Theme.of(context).colorScheme.surface,
                    context: context),
              ),
              Expanded(
                child: _buildAddressesByTimeHeld(
                    name: "Cursier (1-12m)",
                    value: "21.10%",
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    context: context),
              ),
              Expanded(
                child: _buildAddressesByTimeHeld(
                    name: "Trader (<1m)",
                    value: "3.63%",
                    color: Theme.of(context).colorScheme.surfaceBright,
                    context: context),
              ),
            ],
          ),
          ProgressBarChart(
            values: stats,
            height: 15,
            borderRadius: 20,
            totalPercentage: 100,
            showLables: false,
          ),
        ],
      ),
    );
  }

  _buildDivider({required BuildContext context}) {
    return Divider(
        color: Theme.of(context).colorScheme.onSecondaryFixed,
        thickness: 1,
        height: 2);
  }

  _buildCachedImg({required String imgUrl}) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: 20.h,
      width: 20,
      fit: BoxFit.cover,
      placeholder: (context, url) => const CircularProgressIndicator(),
    );
  }

  _buildBlackTextSpan(
      {required String name, required BuildContext context, Color? color}) {
    return TextSpan(
      text: name,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: color ?? Theme.of(context).colorScheme.shadow,
          fontSize: 14.sp),
    );
  }

  _buildColumnText(
      {required String name,
      required String value,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.commonText(name,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          AppConstant.commonText(value,
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  _buildAddressesByTimeHeld(
      {required String name,
      required String value,
      required Color color,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 5,
              ),
              width(4),
              AppConstant.commonText(name,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ],
          ),
          AppConstant.commonText(value,
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
