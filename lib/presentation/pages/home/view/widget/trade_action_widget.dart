import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/enum/home_page_action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeActionWidget extends StatelessWidget {
  const TradeActionWidget({super.key,required this.onTap,required this.tradeOptionsList,this.selectedOption});
final Function(int) onTap;
final List<Map<String, dynamic>> tradeOptionsList;
final   ActionEnum? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                tradeOptionsList.length,
                (index) => GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedOption ==
                                  tradeOptionsList[index]['type']
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.2)),
                        child: Image.asset(tradeOptionsList[index]['icon'],
                            color: selectedOption ==
                                  tradeOptionsList[index]['type']
                                ? Theme.of(context).colorScheme.shadow
                                : null),
                      ),
                      height(8.h),
                      AppConstant.commonText(tradeOptionsList[index]['title'],
                          color: Theme.of(context).colorScheme.onSurface)
                    ],
                  ),
                ),
              ),
            )
         );
  }
}
