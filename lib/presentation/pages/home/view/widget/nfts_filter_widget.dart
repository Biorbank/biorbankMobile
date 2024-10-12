import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_widgets.dart';
import '../../../../common/common_textfield.dart';

class NFTsFilterWidget extends StatefulWidget {
  const NFTsFilterWidget({super.key});

  @override
  State<NFTsFilterWidget> createState() => _NFTsFilterWidgetState();
}

class _NFTsFilterWidgetState extends State<NFTsFilterWidget> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              children: [
                AppConstant.commonText("Filter",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.shadow),
                const Spacer(),
                InkWell(
                  onTap: () {
                    homeCubit.resetFilter();
                    homeCubit.networkController.clear();
                    homeCubit.collectionController.clear();
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    Assets.imagesClose,
                    height: 12,
                    width: 12,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextfield(
                    controller: homeCubit.networkController,
                    title: '',
                    isShowSpaceAfterTitle: false,
                    borderRadius: 8,
                    textColor: Theme.of(context).colorScheme.shadow,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    hintStyle: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        Assets.imagesSearch,
                        height: 20.h,
                        width: 20.w,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                    hintText: 'Select Network',
                  ),
                  height(8),
                  AppConstant.commonText("Market Status",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.shadow),
                  height(8),
                  ListView.separated(
                    itemCount: homeCubit.marketStatusList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = homeCubit.marketStatusList[index];
                      return _buildCheckBoxView(
                        context: context,
                        imgVisible: false,
                        name: data["name"],
                        value: data["value"],
                        onChanged: (newValue) {
                          setState(() {
                            homeCubit.updateMarketStatusList(
                                index: index, value: newValue ?? false);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => height(5),
                  ),
                  height(15),
                  AppConstant.commonText("Options",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.shadow),
                  height(8),
                  ListView.separated(
                    itemCount: homeCubit.optionsList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = homeCubit.optionsList[index];
                      return _buildCheckBoxView(
                        context: context,
                        imgVisible: false,
                        name: data["name"],
                        value: data["value"],
                        onChanged: (newValue) {
                          setState(() {
                            homeCubit.updateOptionsList(
                                index: index, value: newValue ?? false);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => height(5),
                  ),
                  height(15),
                  AppConstant.commonText("Collections",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.shadow),
                  height(8),
                  CommonTextfield(
                    controller: homeCubit.collectionController,
                    title: '',
                    isShowSpaceAfterTitle: false,
                    borderRadius: 8,
                    textColor: Theme.of(context).colorScheme.shadow,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    hintStyle: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        Assets.imagesSearch,
                        height: 20.h,
                        width: 20.w,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                    hintText: 'Select collections',
                  ),
                  height(8),
                  ListView.separated(
                    itemCount: homeCubit.collectionsList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = homeCubit.collectionsList[index];
                      return _buildCheckBoxView(
                        context: context,
                        imgVisible: true,
                        img: data["img"],
                        name: data["name"],
                        value: data["value"],
                        onChanged: (newValue) {
                          setState(() {
                            homeCubit.updateCollectionsList(
                                index: index, value: newValue ?? false);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => height(5),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
            child: Row(
              children: [
                Expanded(
                  child: CommonOutlinedButton(
                      height: 45,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        setState(() {
                          homeCubit.resetFilter();
                        });
                      },
                      title: "Reset"),
                ),
                width(8),
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    name: "Apply",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCheckBoxView({
    required BuildContext context,
    required bool imgVisible,
    String? img,
    required String name,
    required bool value,
    required void Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        imgVisible
            ? ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CachedNetworkImage(
                  imageUrl: img ?? "",
                  height: 18.h,
                  width: 18.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox.shrink(),
                ),
              )
            : const SizedBox.shrink(),
        width(imgVisible ? 8 : 0),
        AppConstant.commonText(name,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Theme.of(context).colorScheme.outline),
        const Spacer(),
        Checkbox(
          value: value,
          onChanged: onChanged,
          visualDensity: const VisualDensity(vertical: -4),
          side: BorderSide(
            color: value
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondaryContainer,
            width: 1,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          checkColor: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
