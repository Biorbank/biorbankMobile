import 'package:biorbank/presentation/pages/token_page/view/widget/history_tab_widget/transaction_detail_screen.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/assets.dart';

class HistoryTabScreen extends StatelessWidget {
  const HistoryTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(16),
          Row(
            children: [
              Expanded(
                child: _buildAvgContainer(
                    name: "Avg Buy Price",
                    value: "\$472.50",
                    imgUrl:
                        "https://imgs.search.brave.com/J5cMUhqWSq4jrcl3ZZWptzsj07r1ayFtbSYkh2rHN_Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvcHJldmll/dy0xeC83Mi8wNC9j/b2luLXdpdGgtZG9s/bGFyLXNpZ24taW4t/Ymx1ZS1jaXJjbGUt/c2ltcGxlLWljb24t/dmVjdG9yLTI5MDA3/MjA0LmpwZw",
                    context: context),
              ),
              width(11),
              Expanded(
                child: _buildAvgContainer(
                    name: "Avg Sell Price",
                    value: "\$472.50",
                    imgUrl:
                        "https://imgs.search.brave.com/J5cMUhqWSq4jrcl3ZZWptzsj07r1ayFtbSYkh2rHN_Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvcHJldmll/dy0xeC83Mi8wNC9j/b2luLXdpdGgtZG9s/bGFyLXNpZ24taW4t/Ymx1ZS1jaXJjbGUt/c2ltcGxlLWljb24t/dmVjdG9yLTI5MDA3/MjA0LmpwZw",
                    context: context),
              ),
            ],
          ),
          height(28),
          _buildDateText(text: "12/31/2023", context: context),
          _buildRow(
              imgT: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionDetailScreen(),
                  ),
                );
              },
              icon: Assets.imagesArrowUp,
              typeName: "Sent",
              time: "3:48 PM",
              result: "-0.0922076 ETH",
              value: "-CAS280.44",
              context: context),
          _buildRow(
              imgT: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionDetailScreen(),
                  ),
                );
              },
              icon: Assets.imagesArrowDown,
              typeName: "Recivied",
              time: "3:48 PM",
              result: "+99.7830 FLIP",
              value: "-CAS280.44",
              context: context),
          height(12),
          _buildDateText(text: "12/24/2023", context: context),
          _buildRow(
              imgT: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionDetailScreen(),
                  ),
                );
              },
              img:
                  "https://imgs.search.brave.com/gJJ2DXf7c2YPd4ycahYNJL8VPVNJzfps-iiLDeecNPw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/cG5nLXZlY3Rvci8y/MDIzMTIwMi9vdXJt/aWQvcG5ndHJlZS1y/b3VuZGVkLXJhc3Rl/ci1pY29uLW9mLWEt/c21vb3RoLWJsdWUt/ZG9sbGFyLXN5bWJv/bC1pbi1wbmctaW1h/Z2VfMTA4NTA0MTYu/cG5n",
              typeName: "Fees",
              time: "3:48 PM",
              result: "-0.0922076 ETH",
              value: "-CAS280.44",
              context: context),
          _buildRow(
              imgT: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionDetailScreen(),
                  ),
                );
              },
              icon: Assets.imagesArrowDown,
              typeName: "Recivied",
              time: "3:48 PM",
              result: "+99.7830 FLIP",
              value: "-CAS280.44",
              context: context),
          _buildRow(
              imgT: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionDetailScreen(),
                  ),
                );
              },
              icon: Assets.imagesArrowUp,
              typeName: "Sent",
              time: "3:48 PM",
              result: "-0.0922076 ETH",
              value: "-CAS280.44",
              context: context),
        ],
      ),
    );
  }

  _buildAvgContainer(
      {required String name,
      required String value,
      required String imgUrl,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onSurface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: imgUrl,
                    height: 20.h,
                    width: 20,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                  ),
                  width(6),
                  AppConstant.commonText(name,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
            ],
          ),
          height(12),
          AppConstant.commonText(value,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow),
        ],
      ),
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
