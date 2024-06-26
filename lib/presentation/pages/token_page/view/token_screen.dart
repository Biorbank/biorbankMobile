import 'package:auto_route/annotations.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/tab_bar.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/app_strings.dart';
import '../../../common/common_appbar.dart';

@RoutePage()
class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CommonAppbar(
                title: AppStrings.token,
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
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      // onTap: ,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
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
              const TabBarViewScreen(),
            ],
          ),
        ),
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
