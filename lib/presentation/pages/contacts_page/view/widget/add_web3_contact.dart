import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common_tabbar.dart';
import '../../../chat/view/widget/blockchain_picker_bottom_sheet.dart';
import '../../../chat/view/widget/network_picker_blockchain_list.dart';
import '../../../token_page/view/widget/alert_btn/create_alert_popup.dart';
import '../../cubit/contact_cubit.dart';

class AddWeb3ContactWidget extends StatefulWidget {
  const AddWeb3ContactWidget({super.key});

  @override
  State<AddWeb3ContactWidget> createState() => _AddWeb3ContactWidget();
}

class _AddWeb3ContactWidget extends State<AddWeb3ContactWidget>
    with SingleTickerProviderStateMixin {
  List<Widget> columnWidgets = []; // List to store widgets

  void _addWidget() {
    setState(() {
      columnWidgets.add(
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextfield(
                title: "Network",
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                borderRadius: 12.r,
                textColor: Theme.of(context).colorScheme.onSurface,
                cursorColor: Theme.of(context).colorScheme.onSurface,
                hintText: 'Ethereum',
              ),
              CommonTextfield(
                title: AppStrings.address,
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                borderRadius: 12.r,
                textColor: Theme.of(context).colorScheme.onSurface,
                cursorColor: Theme.of(context).colorScheme.onSurface,
                hintText: 'Address 0x...',
              ),
              height(10.h),
            ],
          ),
        ),
      );
    });
  }

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context.read<ContactCubit>().changeTabIndex(index: tabController.index);
    });
    WidgetsBinding.instance.addPostFrameCallback((t) {
      context.read<ContactCubit>().changeTabIndex(index: 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        var cubit = context.read<ContactCubit>();
        if (state is ContactTabIndexChangeState) {
          cubit.tabIndex = state.index;
        }
        return Container(
          height: 600.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText(
                    AppStrings.createNewAccount,
                    textAlign: TextAlign.start,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              CommonTabbar(
                  selectedIndex: cubit.tabIndex,
                  length: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  tabAlignment: TabAlignment.fill,
                  isScrollable: false,
                  labelTextBackgroundPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  labelColor: Theme.of(context).colorScheme.shadow,
                  isShowBackgroundShadow: true,
                  onTap: (index) {},
                  tabController: tabController,
                  tabList: const ['Web3', 'Web2']),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextfield(
                            title: '',
                            borderRadius: 12.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            cursorColor:
                            Theme.of(context).colorScheme.onSurface,
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp),
                            prefixWidget: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Image.asset(
                                Assets.imagesSearch,
                                height: 20.h,
                                width: 20.w,
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                            ),
                            hintText: AppStrings.searchForUser,
                          ),
                          CommonTextfield(
                            title: AppStrings.userName,
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp),
                            borderRadius: 12.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            cursorColor:
                            Theme.of(context).colorScheme.onSurface,
                            hintText: AppStrings.giveThemAusername,
                          ),
                          CommonTextfield(
                              title: "Network",
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp),
                              borderRadius: 12.r,
                              textColor:
                              Theme.of(context).colorScheme.onSurface,
                              cursorColor:
                              Theme.of(context).colorScheme.onSurface,
                              hintText: 'Ethereum',
                              prefixWidget: Image.asset(
                                Assets.imagesEth,
                                scale: 3,
                              ),
                              suffixWidget: SizedBox(
                                width: 50,
                                child: Row(
                                  children: [
                                    const Text(
                                      "ETH",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    width(3.w),
                                    Image.asset(
                                      Assets.imagesArrowDownOutline,
                                      scale: 30,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              onTapSuffixWidget: () => showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.7,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: const NetworkPickerBlockchainList(),
                                  ),
                                ),
                              )),
                          CommonTextfield(
                            title: AppStrings.address,
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp),
                            borderRadius: 12.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            cursorColor:
                            Theme.of(context).colorScheme.onSurface,
                            hintText: 'Address 0x...',
                          ),
                          height(10.h),
                          Column(
                            children: columnWidgets,
                          ),
                          GestureDetector(
                            onTap:
                            _addWidget, // Correctly call the function here
                            child: Row(
                              children: [
                                Container(
                                  height: 18.h,
                                  width: 18.w,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.add,
                                    size: 15,
                                    color:
                                    Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                AppConstant.commonText('Add Network',
                                    color:
                                    Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                          height(20.h),
                          CommonButton(
                            name: AppStrings.confirm,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height(10.h),
                          CommonTextfield(
                            title: 'Name',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp),
                            borderRadius: 12.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            cursorColor:
                            Theme.of(context).colorScheme.onSurface,
                            hintText: 'Enter contact name',
                          ),
                          CommonTextfield(
                            title: 'Email',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp),
                            borderRadius: 12.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            cursorColor:
                            Theme.of(context).colorScheme.onSurface,
                            hintText: 'Enter contacts email address',
                          ),
                          CommonTextfield(
                            title: 'Mobile',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp),
                            borderRadius: 12.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                            cursorColor:
                            Theme.of(context).colorScheme.onSurface,
                            hintText: 'Enter contact mobile number',
                          ),
                          height(10.h),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Theme.of(context)
                                    .colorScheme
                                    .errorContainer,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer
                                        .withOpacity(0.2))),
                            padding: const EdgeInsets.all(10),
                            child: Text.rich(TextSpan(
                                text:
                                'By continuing, you agrre that have the contact’s consent to use their information for the',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                                children: [
                                  WidgetSpan(child: width(4.w)),
                                  TextSpan(
                                      text: 'Interac',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer,
                                          fontStyle: FontStyle.italic)),
                                  WidgetSpan(child: width(5.w)),
                                  TextSpan(
                                      text: 'e-Transfer service',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      )),
                                ])),
                          ),
                          height(25.h),
                          CommonButton(
                            name: AppStrings.confirm,
                            onTap: () {},
                          ),
                          height(20.h),
                        ],
                      ),
                    ),
                    //SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
