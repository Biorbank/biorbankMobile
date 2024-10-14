import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/common_button.dart';
import '../../../../common/common_outlined_button.dart';

class TimeFrameCalenderView extends StatefulWidget {
  const TimeFrameCalenderView({super.key});

  @override
  State<TimeFrameCalenderView> createState() => _TimeFrameCalenderViewState();
}

class _TimeFrameCalenderViewState extends State<TimeFrameCalenderView> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(15.h),
          Row(
            children: [
              AppConstant.commonText(
                "Today: ${DateFormat('MMMM d, yyyy').format(DateTime.now())}",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.shadow,
              ),
              const Spacer(),
              Image.asset(
                Assets.imagesCalendar,
                height: 25.h,
                width: 25.w,
              ),
            ],
          ),
          Column(
            children: [
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime(1900),
                lastDay: DateTime(5000),
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  cellAlignment: Alignment.center,
                  markersAlignment: Alignment.center,
                  rangeHighlightColor: Theme.of(context)
                      .colorScheme
                      .onSecondaryContainer
                      .withOpacity(0.15),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.shadow,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  titleCentered: true,
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                  weekdayStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                ),
                rowHeight: 45.h,
                rangeStartDay: rangeStart,
                rangeEndDay: rangeEnd,
                rangeSelectionMode: rangeSelectionMode,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(this.selectedDay, selectedDay)) {
                    setState(() {
                      this.selectedDay = selectedDay;
                      this.focusedDay = focusedDay;
                      rangeStart = null;
                      rangeEnd = null;
                      rangeSelectionMode = RangeSelectionMode.toggledOff;
                    });
                  }
                },
                availableGestures: AvailableGestures.horizontalSwipe,
                onRangeSelected: (start, end, focusedDay) {
                  setState(() {
                    selectedDay = null;
                    this.focusedDay = focusedDay;
                    rangeStart = start;
                    rangeEnd = end;
                    rangeSelectionMode = RangeSelectionMode.toggledOn;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, day, focusedDay) =>
                      todayBuilder(date: "${day.day}"),
                  defaultBuilder: (context, day, focusedDay) =>
                      defaultBuilder(date: "${day.day}"),
                  rangeStartBuilder: (context, day, focusedDay) =>
                      rangeSelectBuilder(date: "${day.day}"),
                  rangeEndBuilder: (context, day, focusedDay) =>
                      rangeSelectBuilder(date: "${day.day}"),
                  withinRangeBuilder: (context, day, focusedDay) =>
                      defaultBuilder(date: "${day.day}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: startEndDateView(
                        date: DateFormat('MMM d, yyyy').format(
                          rangeStart ?? DateTime.now(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 1.5.h,
                        width: 10.w,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: startEndDateView(
                        date: DateFormat('MMM d, yyyy').format(
                          rangeEnd ?? DateTime.now(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          height(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: CommonOutlinedButton(
                      height: 45.h,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        setState(() {
                          rangeStart = null;
                          rangeEnd = null;
                          selectedDay = null;
                        });
                      },
                      title: "Reset"),
                ),
                width(18.w),
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    name: "Confirm",
                  ),
                ),
              ],
            ),
          ),
          height(20.h),
        ],
      ),
    );
  }

  startEndDateView({required String date}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: AppConstant.commonText(
        date,
        fontSize: 16.sp,
        color: Theme.of(context).colorScheme.shadow,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  todayBuilder({required String date}) {
    return Container(
      height: 32.h,
      width: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppConstant.commonText(
            date,
            color: Theme.of(context).colorScheme.shadow,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
          Container(
            height: 5.h,
            width: 5.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          height(1.5.h),
        ],
      ),
    );
  }

  rangeSelectBuilder({required String date}) {
    return Container(
      height: 32.h,
      width: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: AppConstant.commonText(
        date,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    );
  }

  defaultBuilder({required String date}) {
    return Container(
      height: 32.h,
      width: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.scrim,
      ),
      child: AppConstant.commonText(
        date,
        color: Theme.of(context).colorScheme.shadow,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    );
  }
}
