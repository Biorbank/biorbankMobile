import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StakingDetailsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> positions = [
    {
      'name': 'ETH',
      'platform': 'Swell',
      'network': 'Ethereum',
      'amount': '\$18,907.73',
      'reward': '\$3,029.07',
      'icon': 'assets/img/cryptoicon/1027.png',
      'category': 'PoS'
    },
    {
      'name': 'BTC',
      'platform': 'Thorchain',
      'network': 'Bitcoin',
      'amount': '\$21,203.83',
      'reward': '\$3,029.07',
      'icon': 'assets/img/cryptoicon/1.png',
      'category': 'Savings'
    },
    {
      'name': 'ATOM',
      'platform': 'stake',
      'network': 'Cosmos Hub',
      'amount': '\$10,540.83',
      'reward': '\$3,029.07',
      'icon': 'assets/img/cryptoicon/3794.png',
      'category': 'PoS'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title row
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Positions',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Holdings',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  SizedBox(width: 2), // Space between the heading and the arrow
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 24, // Adjust size as needed
                    color: Colors.grey, // Set color to black
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: positions.length,
            separatorBuilder: (context, index) {
              return const Divider(
                // Add a divider as separator
                color: Colors.grey,
                thickness: 0.2,
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      child: Image.asset(positions[index]['icon']),
                    ),
                  ],
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppConstant.commonText(positions[index]['name'],
                                  fontSize: 16.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                              AppConstant.commonText(
                                  ' • ' + positions[index]['platform'],
                                  fontSize: 16.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Assets.imagesEmptyWallet,
                                height: 16.h,
                                width: 16.w,
                              ),
                              width(10.w),
                              AppConstant.commonText(
                                  positions[index]['network'],
                                  fontSize: 14.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                borderRadius: BorderRadius.circular(12)),
                            child: AppConstant.commonText('PoS',
                                fontSize: 12.sp,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                          )
                        ],
                      ),
                    ),
                    width(10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppConstant.commonText(positions[index]['amount'],
                              fontSize: 16.sp,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.shadow),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppConstant.commonText(positions[index]['reward'],
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                              width(6.w),
                              Image.asset(
                                Assets.imagesGift,
                                height: 16.h,
                                width: 16.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
