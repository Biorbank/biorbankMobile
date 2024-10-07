import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/chat_cubit.dart';

@RoutePage()
class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final FocusNode messageFocusNode = FocusNode();
  bool keyboardVisible = false;

  @override
  void dispose() {
    messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return Scaffold(
      body: SafeArea(
        child: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            if (messageFocusNode.hasFocus && isKeyboardVisible) {
              keyboardVisible = false;
            } else {
              keyboardVisible = true;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          height(14.h),
                          CommonAppbar(
                            fontSize: 20.sp,
                            mainAxisAlignment: MainAxisAlignment.start,
                            titleWidth: 80.w,
                            title: AppStrings.sendMoney,
                            onTapBack: () {
                              cubit.clearController();
                              Navigator.pop(context);
                            },
                          ),
                          height(40.h),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 10, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                  width(10.w),
                                  AppConstant.commonText('Kristin Watson',
                                      fontSize: 16.sp,
                                      color:
                                          Theme.of(context).colorScheme.shadow)
                                ],
                              ),
                            ),
                          ),
                          height(40.h),
                          ValueListenableBuilder(
                            valueListenable: cubit.moneyController,
                            builder: (context, value, child) => SizedBox(
                              width: cubit.moneyController.text.length <= 4
                                  ? 150.w
                                  : 200.w,
                              height: 80.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppConstant.commonText('\$',
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                                  width(8.w),
                                  Expanded(
                                    child: CommonTextfield(
                                      isFilled: true,
                                      autoFocus: true,
                                      isReadOnly: true,
                                      showCursor: true,
                                      controller: cubit.moneyController,
                                      inputType: TextInputType.number,
                                      verticalPading: 0,
                                      title: '',
                                      textStyle: TextStyle(
                                          fontSize: cubit.moneyController.text
                                                      .length <=
                                                  4
                                              ? 40.sp
                                              : cubit.moneyController.text
                                                          .length <=
                                                      10
                                                  ? 25.sp
                                                  : 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow),
                                      focusBorderColor: AppColors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          height(16.h),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppConstant.commonText('Main',
                                    fontSize: 14.sp,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                                width(10.w),
                                Container(
                                  height: 4.h,
                                  width: 4.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer
                                        .withOpacity(0.5),
                                  ),
                                ),
                                CommonDropdownWidget(
                                  labelText: '',
                                  value: '\$30.0',
                                  isExpanded: false,
                                  height: 30.h,
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                  backGroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  items: ['\$30.0']
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: AppConstant.commonText(e,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .shadow),
                                          ))
                                      .toList(),
                                  onChanged: (p0) {},
                                )
                              ],
                            ),
                          ),
                          height(25.h),
                          CommonTextfield(
                            borderRadius: 12,
                            controller: cubit.moneyMsgController,
                            title: 'Message',
                            hintText: 'Write a message',
                            focusNode: messageFocusNode,
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: keyboardVisible,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2.0,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: cubit.numberKeys.length,
                        itemBuilder: (context, index) {
                          String key = cubit.numberKeys[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: key == 'delete'
                                  ? Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.07)
                                  : Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => cubit.onKeyTap(key),
                              child: Center(
                                child: key == 'delete'
                                    ? Icon(Icons.backspace,
                                        size: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)
                                    : Text(
                                        key,
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: key == 'delete'
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .shadow,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  CommonButton(
                    name: 'Send',
                    onTap: () {
                      cubit.clearController();
                      Navigator.pop(context);
                    },
                  ),
                  height(20.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
