import 'package:biorbank/presentation/pages/token_page/cubit/token_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../common/common_button.dart';

class CustomCalendarDatePicker extends StatefulWidget {
  final TokenCubit cubit;
  final Function(DateTime) onDateSelected;

  const CustomCalendarDatePicker({
    super.key,
    required this.onDateSelected,
    required this.cubit,
  });

  @override
  CustomCalendarDatePickerState createState() =>
      CustomCalendarDatePickerState();
}

class CustomCalendarDatePickerState extends State<CustomCalendarDatePicker> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            height(8),
            _buildDaysOfWeek(),
            _buildCalendarGrid(),
            height(8),
            SizedBox(
              child: CommonButton(
                name: 'Set',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            size: 24,
          ),
          onPressed: () {
            setState(() {
              focusedDate = DateTime(focusedDate.year, focusedDate.month - 1);
            });
          },
        ),
        AppConstant.commonText(DateFormat.yMMMM().format(focusedDate),
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.shadow,
            fontWeight: FontWeight.w500),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            size: 24,
          ),
          onPressed: () {
            setState(() {
              focusedDate = DateTime(focusedDate.year, focusedDate.month + 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek() {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: daysOfWeek.map((day) {
        return Expanded(
          child: Center(
            child: AppConstant.commonText(day,
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w400),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth =
        DateTime(focusedDate.year, focusedDate.month + 1, 0).day;
    final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    final lastDayOfMonth =
        DateTime(focusedDate.year, focusedDate.month, daysInMonth);

    final daysBefore = (firstDayOfMonth.weekday + 6) % 7;
    final daysAfter = (7 - lastDayOfMonth.weekday) % 7;

    final totalDays = daysBefore + daysInMonth + daysAfter;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: totalDays,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemBuilder: (context, index) {
        if (index < daysBefore || index >= daysBefore + daysInMonth) {
          return const SizedBox();
        }

        final day = index - daysBefore + 1;
        final date = DateTime(focusedDate.year, focusedDate.month, day);

        final isSelected = date ==
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
            widget.onDateSelected(date);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.scrim,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: AppConstant.commonText(day.toString(),
                  fontSize: 14.sp,
                  color: isSelected
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.shadow,
                  fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}
