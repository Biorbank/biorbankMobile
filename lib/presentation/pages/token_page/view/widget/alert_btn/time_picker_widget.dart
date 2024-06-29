import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/common_button.dart';
import '../../../cubit/token_cubit.dart';

class TimePickerWidget extends StatefulWidget {
  final TokenCubit cubit;
  final Function() selectedTime;

  const TimePickerWidget({
    super.key,
    required this.cubit,
    required this.selectedTime,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 0),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWheel(
                  context: context,
                  controller: widget.cubit.hourController,
                  items: widget.cubit.hour,
                  selectedItem: widget.cubit.selectedHour,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      widget.cubit.selectedHour = widget.cubit.hour[value];
                    });
                  },
                ),
                _buildWheel(
                  context: context,
                  controller: widget.cubit.minuteController,
                  items: widget.cubit.min,
                  selectedItem: widget.cubit.selectedMinute,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      widget.cubit.selectedMinute = widget.cubit.min[value];
                    });
                  },
                ),
                _buildWheel(
                  context: context,
                  controller: widget.cubit.amPmController,
                  items: widget.cubit.amPm,
                  selectedItem: widget.cubit.selectedAmPm,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      widget.cubit.selectedAmPm = widget.cubit.amPm[value];
                    });
                  },
                ),
              ],
            ),
            height(8),
            CommonButton(
              name: 'Set',
              onTap: () {
                widget.cubit.selectedTime =
                    "${widget.cubit.selectedHour.padLeft(2, '0')}:${widget.cubit.selectedMinute.padLeft(2, '0')} ${widget.cubit.selectedAmPm}";
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWheel({
    required FixedExtentScrollController controller,
    required List<String> items,
    required String selectedItem,
    required ValueChanged<int> onSelectedItemChanged,
    required BuildContext context,
  }) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildDivider(context: context),
        ),
        SizedBox(
          height: 100,
          width: 80,
          child: ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 30,
            onSelectedItemChanged: onSelectedItemChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final isSelected = items[index] == selectedItem;
                return Center(
                  child: AppConstant.commonText(
                    items[index],
                    fontSize: isSelected ? 14.sp : 12.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? Theme.of(context).colorScheme.shadow
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildDivider(context: context),
        ),
      ],
    );
  }

  _buildDivider({required BuildContext context}) {
    return Divider(
      color: Theme.of(context).colorScheme.onSecondaryFixed.withOpacity(0.5),
      height: 4,
      thickness: 1.5,
    );
  }
}
