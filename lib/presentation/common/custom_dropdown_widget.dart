import 'package:biorbank/utils/app_widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonDropdownWidget<T> extends StatefulWidget {
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?) onChanged;
  final double? borderRadius;
  final Color? backGroundColor;
  final Color? fontColor;
  final Color? arrowColor;
  final Border? border;
  final String? errorMsg;
  final TextStyle? textStyle;

  const CommonDropdownWidget({
    super.key,
    required this.labelText,
    required this.items,
    this.value,
    this.backGroundColor,
    this.errorMsg,
    this.arrowColor,
    this.borderRadius,
    required this.onChanged,
    this.fontColor,
    this.border,
    this.textStyle
  });

  @override
  State<CommonDropdownWidget<T>> createState() =>
      _CommonDropdownWidgetState<T>();
}

class _CommonDropdownWidgetState<T> extends State<CommonDropdownWidget<T>> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45.h,
          alignment: Alignment.center,
          // margin: const EdgeInsets.only(top: 6, bottom: 6),
          //padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              color: widget.backGroundColor ?? Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
              border: widget.border),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              style: widget.textStyle,
              value: widget.value,            
              onChanged: widget.onChanged,
              dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.backGroundColor ?? Theme.of(context).colorScheme.onSurface)),
              iconStyleData: IconStyleData(
                icon: Icon(
                    isOpen
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: widget.arrowColor ??Theme.of(context).colorScheme.shadow),
              ),
              items: widget.items,
             // isExpanded: true,
              onMenuStateChange: (open) {
                setState(() {
                  isOpen = open;
                });
              },
              hint: Text(
                widget.labelText,
                style: TextStyle(
                    fontSize: 13,
                    color: widget.fontColor,
                    // color: colorController.hintTextColor.value,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        widget.errorMsg == null || widget.errorMsg == ""
            ? const SizedBox()
            : Container(
                padding: const EdgeInsets.only(left: 15.0, top: 3.0, bottom: 4),
                child: AppConstant.commonText(widget.errorMsg ?? "",fontSize: 10.sp,color: Theme.of(context).colorScheme.error)),
      ],
    );
  }
}
