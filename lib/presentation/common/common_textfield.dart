import 'package:biorbank/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Theme/app_colors.dart';

class CommonTextfield extends StatelessWidget {
  final String title;
  final bool isRequired;
  final void Function(String?)? onChanged;
  final TextInputType? inputType;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final String? initialVal;
  final TextEditingController? controller;
  final bool? isReadOnly;
  final bool? isShowTitle;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextStyle? hintStyle;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final double? titleFontSize;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final bool? isShowSpaceAfterTitle;
  final GestureTapCallback? textFieldOnTap;
  final bool? isFilled;
  final String? errorMsg;
  final bool enabled;
  final Color? fillColor;
  final VoidCallback? onTapSuffixWidget;
  final Color? cursorColor;
  final Color? textColor;
  final double? verticalPading;
  final Color? focusBorderColor;
  final bool autoFocus;
  final TextStyle? textStyle;
  final double? cursorHeight;
  final double? height;
  const CommonTextfield(
      {super.key,
      required this.title,
      this.onChanged,
      this.borderRadius,
      this.isRequired = false,
      this.hintText = '',
      this.textColor,
      this.inputFormatter,
      this.inputType,
      this.validator,
      this.titleFontSize,
      this.maxLines = 1,
      this.isShowSpaceAfterTitle,
      this.suffixWidget,
      this.obscureText = false,
      this.initialVal,
      this.isReadOnly,
      this.autoFocus = false,
      this.hintStyle,
      this.height,
      this.cursorColor,
      this.maxLength,
      this.isShowTitle,
      this.controller,
      this.textFieldOnTap,
      this.errorMsg,
      this.isFilled,
      this.prefixWidget,
      this.fillColor,
      this.onTapSuffixWidget,
      this.verticalPading,
      this.textStyle,
      this.cursorHeight,
      this.focusBorderColor,
      this.enabled = true});

  Widget _getTitle(BuildContext context) {
    if (title.isNotEmpty) {
      return Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isShowTitle ?? true
                ? Theme.of(context).colorScheme.shadow
                : Colors.transparent),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPading ?? 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTitle(context),
          (isShowSpaceAfterTitle ?? true)
              ? const SizedBox(
                  height: 8.0,
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: height,
            child: TextFormField(
              enabled: enabled,
              controller: controller,
              maxLines: maxLines,
              autofocus: autoFocus,
              onTap: textFieldOnTap ?? () {},
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
            
              },
              
              inputFormatters: inputFormatter,
              obscuringCharacter: '*',
              onTapOutside: (v) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction:
                  maxLines == 1 ? TextInputAction.done : TextInputAction.newline,
              obscureText: obscureText,
              readOnly: isReadOnly ?? false,
              maxLength: maxLength,
              cursorColor: cursorColor,
              cursorHeight:cursorHeight ,
              decoration: InputDecoration(
                errorMaxLines: 3,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: suffixWidget != null
                    ? GestureDetector(
                        onTap: onTapSuffixWidget, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: suffixWidget,
                        ))
                    : null,
                prefixIcon: prefixWidget,
                errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
                hintText: hintText,
                fillColor: fillColor ??
                    ((isFilled ?? false)
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.errorContainer),
                filled: isFilled ?? true,
                hintStyle: hintStyle ??
                    TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp),
                counterText: '',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(0.1)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.onPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                  borderSide: BorderSide(
                      color: focusBorderColor ??
                          Theme.of(context).colorScheme.onPrimary),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: maxLines == 1 ? 0.0 : 8.0,
                  horizontal: 14.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                  borderSide: BorderSide(color: AppColors.transparent),
                ),
              ),
              keyboardType: maxLines == 1 ? inputType : TextInputType.multiline,
              style:textStyle?? TextStyle(
                  fontSize: 15,
                  color: textColor ?? Theme.of(context).colorScheme.shadow),
              onChanged: onChanged,
              initialValue: initialVal,
            ),
          ),
          errorMsg == null || errorMsg == ""
              ? const SizedBox()
              : Container(
                  padding:
                      const EdgeInsets.only(left: 5.0, top: 4.0, bottom: 4),
                  child: AppConstant.commonText(errorMsg ?? "",
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.error)),
        ],
      ),
    );
  }
}
