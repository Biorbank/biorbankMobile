import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
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
  final Color? itemBackGroundColor;
  final Color? fontColor;
  final Color? arrowColor;
  final Border? border;
  final String? errorMsg;
  final TextStyle? textStyle;
  final bool? isExpanded;
  final double? height;
  final bool isUseBackgroundColor;
  final String? dropDownArrow;
  final String? title;
  final EdgeInsets? dropDownContentPadding;
  const CommonDropdownWidget(
      {super.key,
      required this.labelText,
      required this.items,
      this.value,
      this.itemBackGroundColor,
      this.backGroundColor,
      this.errorMsg,
      this.title,
      this.arrowColor,
      this.dropDownArrow,
      this.borderRadius,
      this.dropDownContentPadding,
      required this.onChanged,
      this.fontColor,
      this.border,
      this.height,
      this.isExpanded = false,
      this.textStyle,
      this.isUseBackgroundColor = true});

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
        Visibility(
          visible: widget.title != null,
          child: AppConstant.commonText(widget.title ?? '',
              fontWeight: FontWeight.w500,
              
              color: Theme.of(context).colorScheme.shadow),
        ),
        height(widget.title != null ? 8.h : 0),
        Container(
          height: widget.height ?? 45.h,
          alignment: Alignment.center,
          // margin: const EdgeInsets.only(top: 6, bottom: 6),
          //padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              color: widget.backGroundColor ??
                  (widget.isUseBackgroundColor
                      ? Theme.of(context).colorScheme.onSurface
                      : null),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
              border: widget.border),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              style: widget.textStyle,
              value: widget.value,
              menuItemStyleData:
                  const MenuItemStyleData(padding: EdgeInsets.only(left: 12)),
              onChanged: widget.onChanged,
              dropdownStyleData: DropdownStyleData(
                  padding: widget.dropDownContentPadding,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.itemBackGroundColor ??
                          Theme.of(context).colorScheme.onSurface)),
              iconStyleData: IconStyleData(
                  icon: Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Transform.rotate(
                    angle: isOpen ? 3.13 : 0,
                    child: Image.asset(
                      widget.dropDownArrow ?? Assets.imagesChevronDown,
                      height: 18,
                      color: widget.arrowColor ??
                          Theme.of(context).colorScheme.shadow,
                    )),
              )
                  // Icon(
                  //     isOpen
                  //         ? Icons.keyboard_arrow_up_rounded
                  //         : Icons.keyboard_arrow_down_rounded,
                  //     color: widget.arrowColor ??Theme.of(context).colorScheme.shadow),
                  ),
              items: widget.items,
              isExpanded: widget.isExpanded ?? false,
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
                child: AppConstant.commonText(widget.errorMsg ?? "",
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.error)),
      ],
    );
  }
}
