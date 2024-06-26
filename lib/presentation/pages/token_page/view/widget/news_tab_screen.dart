import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTabScreen extends StatelessWidget {
  const NewsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildNewsRow(
              context: context,
              notes:
                  "Ledn launches ether-backend loans as it perps to onboard former Celsius users",
              type: "The Block",
              time: "3 hours ago"),
          _buildNewsRow(
              context: context,
              notes:
                  "Ledn launches ether-backend loans as it perps to onboard former Celsius users",
              type: "The Block",
              time: "3 hours ago"),
          _buildNewsRow(
              context: context,
              notes:
                  "Ledn launches ether-backend loans as it perps to onboard former Celsius users",
              type: "The Block",
              time: "3 hours ago"),
          _buildNewsRow(
              context: context,
              notes:
                  "Ledn launches ether-backend loans as it perps to onboard former Celsius users",
              type: "The Block",
              time: "3 hours ago"),
          _buildNewsRow(
              context: context,
              notes:
                  "Ledn launches ether-backend loans as it perps to onboard former Celsius users",
              type: "The Block",
              time: "3 hours ago"),
        ],
      ),
    );
  }

  _buildNewsRow({
    required BuildContext context,
    required String notes,
    required String type,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.onSecondaryFixed,
            ),
          ),
          width(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText(notes,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.shadow),
                height(10),
                Row(
                  children: [
                    AppConstant.commonText(type,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.shadow),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondaryFixed,
                      ),
                    ),
                    AppConstant.commonText(time,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
