import 'dart:io';

import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPriceAlertWidget extends StatefulWidget {
  const CreateNewPriceAlertWidget({super.key});

  @override
  State<CreateNewPriceAlertWidget> createState() =>
      _CreateNewPriceAlertWidgetState();
}

class _CreateNewPriceAlertWidgetState extends State<CreateNewPriceAlertWidget>
    with SingleTickerProviderStateMixin {
  List<CryptoAssetRepositoryImpl> assetList = [];
  List<String> typeList = ["Crossing"], priceList = ["5852.26 CAD"];
  String? selectedType, selectedPrice;
  CryptoAssetRepositoryImpl? selectedAsset;
  int sendTabIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        sendTabIndex = tabController.index;
      });
    });
    super.initState();
    migration();
  }

  migration() {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    setState(() {
      assetList.addAll(db.state.assetList);
      if (db.state.assetList.isNotEmpty) {
        selectedAsset = db.state.assetList.first;
      }
      if (typeList.isNotEmpty) {
        selectedType = typeList.first;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              width(40.w),
              AppConstant.commonText("Create new price alert",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.shadow),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              )
            ],
          ),
          height(25.h),
          Text(
            "Condition",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ),
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            labelText: '',
            value: selectedAsset,
            items: assetList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          Image.file(
                            File("${AppHelper.appDir}/${e.getAsset().logo}"),
                            width: 25.w,
                            height: 25.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          AppConstant.commonText(e.getAsset().name,
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.shadow),
                        ],
                      ),
                    ))
                .toList(),
            backGroundColor: Theme.of(context).colorScheme.errorContainer,
            onChanged: (val) {
              setState(() {
                selectedAsset = val;
              });
            },
          ),
          height(10.h),
          CommonDropdownWidget(
            isExpanded: true,
            borderRadius: 12.r,
            labelText: '',
            value: selectedType,
            items: typeList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          AppConstant.commonText(e,
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.shadow),
                        ],
                      ),
                    ))
                .toList(),
            backGroundColor: Theme.of(context).colorScheme.errorContainer,
            onChanged: (val) {
              setState(() {
                selectedType = val;
              });
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CommonTextfield(
                  title: "",
                  isShowSpaceAfterTitle: false,
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp),
                  borderRadius: 12.r,
                  textColor: Theme.of(context).colorScheme.onSurface,
                  cursorColor: Theme.of(context).colorScheme.onSurface,
                  hintText: "Price",
                ),
              ),
              width(10.w),
              Expanded(
                child: CommonDropdownWidget(
                  isExpanded: true,
                  borderRadius: 12.r,
                  labelText: '',
                  value: selectedPrice,
                  items: priceList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                AppConstant.commonText(e,
                                    fontSize: 14.sp,
                                    color:
                                        Theme.of(context).colorScheme.shadow),
                              ],
                            ),
                          ))
                      .toList(),
                  backGroundColor: Theme.of(context).colorScheme.errorContainer,
                  onChanged: (val) {
                    setState(() {
                      selectedPrice = val;
                    });
                  },
                ),
              ),
            ],
          ),
          height(10.h),
          Text(
            "Trigger",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ),
          height(10.h),
          CommonTabbar(
            backgroundContainerMargin: 0,
            selectedIndex: sendTabIndex,
            length: 2,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            labelTextBackgroundPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            labelColor: Theme.of(context).colorScheme.shadow,
            isShowBackgroundShadow: true,
            onTap: (index) {},
            tabController: tabController,
            tabList: const ['Only Once', 'Every Time'],
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "This alert will be trigger once and will not be repeated",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    height(10.w),
                    CommonTextfield(
                      title: 'Alert Name',
                      borderRadius: 12.r,
                      textColor: Theme.of(context).colorScheme.onSurface,
                      cursorColor: Theme.of(context).colorScheme.onSurface,
                      hintStyle: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                      hintText: "Alert Name",
                    ),
                    height(10.w),
                    CommonTextfield(
                      title: 'Message',
                      borderRadius: 12.r,
                      maxLines: 2,
                      textColor: Theme.of(context).colorScheme.onSurface,
                      cursorColor: Theme.of(context).colorScheme.onSurface,
                      hintStyle: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                      hintText: "Message",
                    ),
                    Text(
                      "You can use special placeholders such as {{close}}, {{time}}. {{[lot_0}}, etc.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox.shrink(),
            ]),
          ),
          height(10.h),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  name: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              width(20.w),
              Expanded(
                child: CommonButton(
                  name: "Create",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          height(20.h),
        ],
      ),
    );
  }
}
