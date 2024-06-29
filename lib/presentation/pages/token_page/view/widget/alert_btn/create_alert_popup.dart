import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/token_page/view/widget/alert_btn/time_picker_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/app_strings.dart';
import '../../../../../common/common_button.dart';
import '../../../../../common/common_outlined_button.dart';
import '../../../../../common/common_tabbar.dart';
import '../../../cubit/token_cubit.dart';

class CreateAlertPopup extends StatefulWidget {
  final Function(String?) onChangedCrossing;
  final Function(String?) onChangedCad;
  final TokenCubit cubit;

  // final ValueChanged<int> hourOnSelectedItemChanged;
  // final ValueChanged<int> minuteOnSelectedItemChanged;
  // final ValueChanged<int> amPmOnSelectedItemChanged;
  final Function() selectedTime;

  const CreateAlertPopup({
    super.key,
    required this.cubit,
    required this.onChangedCrossing,
    required this.onChangedCad,
    required this.selectedTime,
  });

  @override
  State<CreateAlertPopup> createState() => _CreateAlertPopupState();
}

class _CreateAlertPopupState extends State<CreateAlertPopup>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context
          .read<TokenCubit>()
          .changeCreateBTCTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      insetPadding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(20),
              Row(
                children: [
                  Expanded(
                    child: AppConstant.commonText(
                      "Create Alert on BTC",
                      textAlign: TextAlign.center,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 22,
                    ),
                  ),
                ],
              ),
              height(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildName(name: "Condition", context: context),
                      CommonTextfield(
                        title: "",
                        hintText: "BTC",
                        isShowSpaceAfterTitle: false,
                        borderRadius: 12,
                        prefixWidget: Container(
                          height: 22.h,
                          width: 22,
                          padding: const EdgeInsets.all(10),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png",
                          ),
                        ),
                      ),
                      CommonDropdownWidget(
                        labelText: "Crossing",
                        dropDownContentPadding:
                            const EdgeInsets.symmetric(vertical: 0),
                        borderRadius: 12,
                        value: widget.cubit.crossingValue,
                        items: widget.cubit.crossingItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: AppConstant.commonText(
                              items,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.shadow,
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
                        backGroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        onChanged: widget.onChangedCrossing,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: CommonTextfield(
                              title: "",
                              borderRadius: 12,
                              isShowSpaceAfterTitle: false,
                              hintText: "BTC",
                            ),
                          ),
                          width(8),
                          Expanded(
                            child: CommonDropdownWidget(
                              labelText: "5852.26  CAD",
                              textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.shadow),
                              height: 48,
                              dropDownContentPadding:
                                  const EdgeInsets.symmetric(vertical: 0),
                              borderRadius: 12,
                              value: widget.cubit.cadValue,
                              items: widget.cubit.cadItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: AppConstant.commonText(
                                    items,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).colorScheme.shadow,
                                  ),
                                );
                              }).toList(),
                              isExpanded: true,
                              backGroundColor:
                                  Theme.of(context).colorScheme.errorContainer,
                              onChanged: widget.onChangedCad,
                            ),
                          ),
                        ],
                      ),
                      _buildName(name: "Trigger", context: context),
                      CommonTabbar(
                        selectedIndex: widget.cubit.tabCreateBTCIndex,
                        length: 2,
                        backgroundContainerMargin: 0,
                        labelContainerRadius: 6,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        tabAlignment: TabAlignment.fill,
                        isScrollable: false,
                        labelTextBackgroundPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 4),
                        labelColor: Theme.of(context).colorScheme.shadow,
                        isShowBackgroundShadow: true,
                        isShowBackground: true,
                        onTap: (index) {},
                        tabController: tabController,
                        tabList: [AppStrings.onlyOnce, AppStrings.everyTime],
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.loose(
                          Size.fromHeight(
                              MediaQuery.of(context).size.height * 0.055),
                        ),
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            _buildTabBarView(
                                description:
                                    "The alert will only trigger once and will not be repeated",
                                context: context),
                            _buildTabBarView(
                                description:
                                    "The alert will only trigger Every Time",
                                context: context),
                          ],
                        ),
                      ),
                      CommonTextfield(
                        title: "Expiration",
                        isShowTitle: true,
                        hintText:
                            DateFormat('MMMM d, yyyy').format(DateTime.now()),
                        suffixWidget: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            Assets.imagesCalendar,
                            height: 20,
                            width: 20,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                        ),
                      ),
                      CommonTextfield(
                        controller: widget.cubit.selectTimeCtrl,
                        title: "",
                        isShowTitle: false,
                        isShowSpaceAfterTitle: false,
                        hintText: DateFormat('HH:mm').format(DateTime.now()),
                        suffixWidget: InkWell(
                          onTap: () {
                            widget.cubit.showTimePicker(
                              context: context,
                              timePicker: TimePickerWidget(
                                cubit: widget.cubit,
                                selectedTime: widget.selectedTime,
                              ),
                            );
                          },
                          child: Image.asset(
                            Assets.imagesClock,
                            height: 20,
                            width: 20,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                        ),
                      ),
                      CommonTextfield(
                        title: AppStrings.alertName,
                        isShowTitle: true,
                        hintText: AppStrings.alertName,
                      ),
                      CommonTextfield(
                        title: AppStrings.message,
                        isShowTitle: true,
                        hintText: AppStrings.message,
                        maxLines: 3,
                      ),
                      _buildTabBarView(
                          description:
                              "You can use special placeholders such as {{close}}, {{time}}. {{[lot_0}}, etc.",
                          context: context),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    Expanded(
                        child: CommonOutlinedButton(
                            height: 50,
                            borderColor:
                                Theme.of(context).colorScheme.onPrimary,
                            textColor: Theme.of(context).colorScheme.onPrimary,
                            onTap: () {},
                            title: 'Reset')),
                    width(20.w),
                    Expanded(
                      child: SizedBox(
                        child: CommonButton(
                          name: 'Confirm',
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildName({required String name, required BuildContext context}) {
    return AppConstant.commonText(
      name,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.shadow,
    );
  }

  _buildTabBarView(
      {required String description, required BuildContext context}) {
    return AppConstant.commonText(description,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: Theme.of(context).colorScheme.onSecondaryContainer);
  }
}
