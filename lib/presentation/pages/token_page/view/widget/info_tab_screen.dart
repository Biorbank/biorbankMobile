import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_bar_chart/progress_bar_chart.dart';

import '../../../../../utils/Theme/app_colors.dart';
import '../../../../common/custom_dropdown_widget.dart';

class InfoTabScreen extends StatelessWidget {
  const InfoTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      {"https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png": "ETH"},
      {
        "https://academy.cryptowebacademy.com/wp-content/uploads/2023/12/bitcoin_logo-1-768x768-1.png":
            "Bitcoin"
      },
    ];

    final List<StatisticsItem> stats = [
      StatisticsItem(Theme.of(context).colorScheme.surfaceContainer, 75.27),
      StatisticsItem(AppColors.green, 21.10),
      StatisticsItem(AppColors.yellow, 3.63),
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
                    value: items.first.keys.first,
                    border: Border.all(color: AppColors.grey100),
                    isExpanded: true,
                    arrowColor: AppColors.grey,
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    dropDownContentPadding: EdgeInsets.zero,
                    items: items.map((items) {
                      return DropdownMenuItem(
                        value: items.keys.first,
                        // Access the first key (image URL)
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: items.keys.first,
                              height: 20.h,
                              width: 20,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                            ),
                            width(5),
                            Text(items.values.first),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (p0) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    Assets.imagesSwapArrow,
                    height: 23,
                    width: 23,
                    color: AppColors.grey,
                  ),
                ),
                Expanded(
                  child: CommonDropdownWidget(
                    labelText: "items",
                    value: items.last.keys.first,
                    border: Border.all(color: AppColors.grey100),
                    isExpanded: true,
                    arrowColor: AppColors.grey,
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    dropDownContentPadding: EdgeInsets.zero,
                    items: items.map((items) {
                      return DropdownMenuItem(
                        value: items.keys.first,
                        // Access the first key (image URL)
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: items.keys.first,
                              height: 20.h,
                              width: 20,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                            ),
                            width(5),
                            Text(items.values.first),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (p0) {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppConstant.commonText(
                      "If ",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
                      height: 20.h,
                      width: 20,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                    AppConstant.commonText(
                      " ETH ",
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    AppConstant.commonText(
                      "had ",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          'https://academy.cryptowebacademy.com/wp-content/uploads/2023/12/bitcoin_logo-1-768x768-1.png',
                      height: 20.h,
                      width: 20,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                    AppConstant.commonText(
                      " Bitcoin ",
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    AppConstant.commonText(
                      "market cap of ",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    AppConstant.commonText(
                      "\$1.0T,",
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppConstant.commonText(
                      "1 XMR would be worth",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    AppConstant.commonText(
                      " \$56.3k ",
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    AppConstant.commonText(
                      ", an upside of 451x",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
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
                          name: "Market Cap", value: "301.68 B USDT"),
                      _buildColumnText(
                          name: "Volume 24h", value: "7.68 B USDT"),
                      _buildColumnText(name: "Max Supply", value: "--"),
                      _buildColumnText(
                          name: "All Time High", value: "4,890.12 USDT"),
                      _buildColumnText(
                          name: "All Time Low", value: "0.4207 USDT"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildColumnText(
                          name: "Fully Diluted Market Cap",
                          value: "301.68 B USDT"),
                      _buildColumnText(
                          name: "Circulating Supply", value: "120.17 M ETH"),
                      _buildColumnText(
                          name: "Total Supply", value: "120.17 M ETH"),
                      _buildColumnText(name: "Rank", value: "#2"),
                      _buildColumnText(
                          name: "Market Dominance", value: "16.67%"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.grey100, thickness: 1, height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child:
                      _buildColumnText(name: "Whale Holdings", value: "37.85%"),
                ),
                Expanded(
                  child: _buildColumnText(
                      name: "Holding Addresses", value: "112.09 M"),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.grey100, thickness: 1, height: 2),
          height(20),
          AppConstant.commonText("Addresses by Time Held",
              color: AppColors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          Row(
            children: [
              Expanded(
                child: _buildAddressesByTimeHeld(
                    name: "Holder (1y+)",
                    value: "75.27%",
                    color: Theme.of(context).colorScheme.surfaceContainer),
              ),
              Expanded(
                child: _buildAddressesByTimeHeld(
                    name: "Cursier (1-12m)",
                    value: "21.10%",
                    color: AppColors.green),
              ),
              Expanded(
                child: _buildAddressesByTimeHeld(
                    name: "Trader (<1m)",
                    value: "3.63%",
                    color: AppColors.yellow),
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

  _buildColumnText({required String name, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.commonText(name,
              color: AppColors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          AppConstant.commonText(value,
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  _buildAddressesByTimeHeld(
      {required String name, required String value, required Color color}) {
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
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ],
          ),
          AppConstant.commonText(value,
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
