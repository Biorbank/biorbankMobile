import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_text_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/buy_sceen_appbar.dart';
import 'package:biorbank/presentation/pages/p2p/view/widget/image_picker_dialog.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/image_picker_helper/image_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<P2pMarketCubit, P2pMarketState>(
      builder: (context, state) {
        var cubit = context.read<P2pMarketCubit>();
        if (state is PickedImageState) {
          cubit.images.add(state.imageFile);
          cubit.refreshState();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const BuySceenAppbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(20.h),
                      buyActionButton(
                          context: context,
                          onTapFloatingButton: () {},
                          onTapRatioButton: () {}),
                      height(12.h),
                      CommonTextfield(
                          title: 'Trading quantity',
                          inputType: TextInputType.number,
                          hintText: 'Enter trading quantity',
                          suffixWidget: Text.rich(TextSpan(
                              text: 'USDT',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                              children: [
                                WidgetSpan(child: width(12.w)),
                                TextSpan(
                                    text: 'All',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary))
                              ]))),
                      height(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText('Available balance 0.0 USDT',
                              fontSize: 12.sp,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          CommonTextButton(
                            name: 'Transfer',
                            onTap: () {},
                            fontSize: 12.sp,
                            textColor: Theme.of(context).colorScheme.onPrimary,
                          )
                        ],
                      ),
                      height(16.h),
                      CommonDropdownWidget(
                        isExpanded: true,
                        value: 'Private',
                        borderRadius: 12.r,
                        labelText: '',
                        title: 'Market',
                        items: ['Private']
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: AppConstant.commonText(e,
                                    color: Theme.of(context).colorScheme.shadow,
                                    fontSize: 14.sp)))
                            .toList(),
                        backGroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        onChanged: (p0) {},
                      ),
                      height(18.h),
                      CommonDropdownWidget(
                        isExpanded: true,
                        value: 'T+0',
                        borderRadius: 12.r,
                        labelText: '',
                        title: 'Withdrawal restriction',
                        items: ['T+0']
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: AppConstant.commonText(e,
                                    color: Theme.of(context).colorScheme.shadow,
                                    fontSize: 14.sp)))
                            .toList(),
                        backGroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        onChanged: (p0) {},
                      ),
                      height(18.h),
                      AppConstant.commonText('Single order limit',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CommonTextfield(
                                title: '',
                                isShowSpaceAfterTitle: false,
                                inputType: TextInputType.number,
                                hintText: '',
                                suffixWidget: AppConstant.commonText('CAD',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer)),
                          ),
                          width(12.w),
                          Expanded(
                            child: CommonTextfield(
                                title: '',
                                isShowSpaceAfterTitle: false,
                                inputType: TextInputType.number,
                                hintText: '',
                                suffixWidget: AppConstant.commonText('CAD',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer)),
                          ),
                        ],
                      ),
                      height(15.h),
                      CommonDropdownWidget(
                        isExpanded: true,
                        value: '15 Minutes',
                        borderRadius: 12.r,
                        labelText: '',
                        title: 'Payment deadline',
                        items: ['15 Minutes']
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: AppConstant.commonText(e,
                                    color: Theme.of(context).colorScheme.shadow,
                                    fontSize: 14.sp)))
                            .toList(),
                        backGroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        onChanged: (p0) {},
                      ),
                      height(18.h),
                      CommonDropdownWidget(
                        isExpanded: true,
                        borderRadius: 12.r,
                        labelText: 'Choose a payment method',
                        title: 'Payment methods',
                        items: const [],
                        backGroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        onChanged: (p0) {},
                      ),
                      height(18.h),
                      Container(
                        height: 58.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Theme.of(context).colorScheme.errorContainer,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppConstant.commonText(
                                  'Counterparty Trading Requirements',
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                              FlutterSwitch(
                                width: 48.0,
                                height: 26.0,
                                toggleSize: 20.0,
                                inactiveColor:
                                    Theme.of(context).colorScheme.onSurface,
                                toggleColor: const Color(0xFFDFE2E7),
                                activeColor: AppColors.green,
                                value: false,
                                activeToggleColor:
                                    Theme.of(context).colorScheme.onSurface,
                                borderRadius: 25.0,
                                padding: 4,
                                showOnOff: false,
                                onToggle: (val) {
                                  //cubit.toggleFaceIdSwitch(value: val);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      height(16.h),
                      const CommonTextfield(
                        title: 'Trading terms (optional)',
                        inputType: TextInputType.number,
                        maxLines: 4,
                        hintText:
                            'Trading-related requirements or remarks that users can view on the order page.',
                      ),
                      const CommonTextfield(
                        title: 'Welcome message (optional)',
                        inputType: TextInputType.number,
                        maxLines: 4,
                        hintText: 'Auto-send once the user places an order.',
                      ),
                      height(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText('Upload Image',
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          AppConstant.commonText('${cubit.images.length}/2',
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                        ],
                      ),
                      height(20.h),
                      Wrap(
                        spacing: 14,
                        runSpacing: 15,
                        children: [
                          InkWell(
                            onTap: () {
                              if (cubit.images.length >= 2) {
                                AppConstant.showToast(
                                    msg: 'You can pick maximum 2 image only');
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => imagePickDialog(
                                      context: context,
                                      onTapCamera: () async {
                                        Navigator.pop(context);
                                        XFile? file = await ImagePickerHelper
                                            .captureImageFromCamera(
                                                context: context);

                                        if (file != null) {
                                          cubit.onPickImage(file: file);
                                        }
                                      },
                                      onTapGallery: () async {
                                        Navigator.pop(context);

                                        XFile? file = await ImagePickerHelper
                                            .pickImageFromGallery(
                                                context: context);
                                        if (file != null) {
                                          cubit.onPickImage(file: file);
                                        }
                                      }),
                                );
                              }
                            },
                            child: Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .errorContainer,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: const Icon(
                                Icons.add_rounded,
                                size: 35,
                              ),
                            ),
                          ),
                          ...List.generate(
                            cubit.images.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.file(
                                  File(cubit.images[index].path),
                                  width: 80.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      height(20.h),
                      Row(
                        children: [
                          Checkbox(
                            visualDensity: const VisualDensity(horizontal: -4),
                            checkColor: Theme.of(context).colorScheme.onSurface,
                            activeColor:
                                Theme.of(context).colorScheme.onPrimary,
                            side: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)),
                            value: true,
                            onChanged: (value) {},
                          ),
                          width(10.w),
                          Expanded(
                            child: Text.rich(TextSpan(
                                text: 'I acknowledge and understand',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                                children: [
                                  WidgetSpan(child: width(8.w)),
                                  TextSpan(
                                      text: 'Trading Rule',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary))
                                ])),
                          )
                        ],
                      ),
                      height(10.h),
                       CommonButton(
                        name: 'Post',
                        onTap: (){},
                      ),
                      height(20.h),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }

  Widget buyActionButton(
      {required BuildContext context,
      required VoidCallback onTapFloatingButton,
      required VoidCallback onTapRatioButton}) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).colorScheme.errorContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesSwapArrow,
                    height: 20.h,
                    width: 20.w,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                  width(12.w),
                  AppConstant.commonText('Floating Price',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
            ),
          ),
        ),
        width(14.w),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).colorScheme.errorContainer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Enter ratio',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  AppConstant.commonText('%',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
