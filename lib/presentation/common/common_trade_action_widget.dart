import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_widgets.dart';
import '../../utils/common_spacer.dart';
import '../../utils/enum/home_page_action_enum.dart';

class CommonTradeActionWidget extends StatelessWidget {
  final Function(int) onTap;
  final List<Map<String, dynamic>> tradeOptionsList;
  final ActionEnum? selectedOption;
  final bool colorSelect;

  const CommonTradeActionWidget(
      {super.key,
      required this.onTap,
      required this.tradeOptionsList,
      this.selectedOption,
      required this.colorSelect});

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
                        color: selectedOption == tradeOptionsList[index]['type']
                            ? colorSelect
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                            : colorSelect
                                ? Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                    .withOpacity(0.2)
                                : Theme.of(context).colorScheme.onPrimaryContainer),
                    child: Image.asset(tradeOptionsList[index]['icon'],
                        color: selectedOption == tradeOptionsList[index]['type']
                            ? colorSelect
                                ? Theme.of(context).colorScheme.shadow
                                : Theme.of(context).colorScheme.onPrimary
                            : colorSelect
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onPrimary),
                  ),
                  height(8.h),
                  AppConstant.commonText(tradeOptionsList[index]['title'],
                      color: colorSelect
                          ? Theme.of(context).colorScheme.onSurface
                          : AppColors.black)
                ],
              ),
            ),
          ),
        ));
  }
}
