import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/database_service.dart/database_service.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/chat_cubit.dart';

@RoutePage()
class LinkNewAddressScreen extends StatefulWidget {
  const LinkNewAddressScreen({super.key});

  @override
  State<LinkNewAddressScreen> createState() => _LinkNewAddressScreenState();
}

class _LinkNewAddressScreenState extends State<LinkNewAddressScreen> {
  final FocusNode messageFocusNode = FocusNode();
  bool keyboardVisible = false;
  List<NetworkInformation> networkList = [];
  NetworkInformation? selectedNetwork;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    migration();
  }

  migration() async {
    final List<NetworkInformation> networks =
        await DatabaseService.instance.getAllNetworks;
    setState(() {
      networkList.addAll(networks);
      if (networkList.isNotEmpty) {
        selectedNetwork = networkList.first;
      }
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(14.h),
                      CommonAppbar(
                        fontSize: 20.sp,
                        mainAxisAlignment: MainAxisAlignment.start,
                        titleWidth: 80.w,
                        title: "Link New Address",
                        onTapBack: () {
                          cubit.clearController();
                          Navigator.pop(context);
                        },
                      ),
                      height(25.h),
                      CommonDropdownWidget(
                        isExpanded: true,
                        borderRadius: 12.r,
                        title: 'Crypto currency & blockchain',
                        labelText: '',
                        value: selectedNetwork,
                        items: networkList
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Image.file(
                                      File("${AppHelper.appDir}/${e.logo}"),
                                      width: 25.w,
                                      height: 25.w,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    AppConstant.commonText(
                                      e.name,
                                      fontSize: 14.sp,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        backGroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        onChanged: (val) {
                          setState(() {
                            selectedNetwork = val;
                          });
                        },
                      ),
                      height(25.h),
                      CommonTextfield(
                        borderRadius: 12,
                        controller: cubit.moneyMsgController,
                        title: 'Address',
                        hintText: 'Address 0x',
                        focusNode: messageFocusNode,
                      ),
                      height(15.h),
                      CommonTextfield(
                        borderRadius: 12,
                        title: 'Memo',
                        hintText: 'Memo',
                        errorMsg: "*Optional",
                      ),
                      height(15.h),
                      AppConstant.commonText(
                        "Addresses Linked with this Contract",
                        maxLines: 1,
                        fontWeight: FontWeight.w500,
                        textOverflow: TextOverflow.ellipsis,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                      height(15.h),
                      _buildListTile(
                        context: context,
                        img:
                            "${AppHelper.appDir}/assets/img/cryptoicon/1027.png",
                        title: "EVMs",
                        subTitle: "0xc0ff...d54979",
                      ),
                      height(15.h),
                      _buildListTile(
                        context: context,
                        img: "${AppHelper.appDir}/assets/img/cryptoicon/1.png",
                        title: "BTC",
                        subTitle: "0xc0ff...d54979",
                      ),
                    ],
                  ),
                ),
              ),
              CommonButton(
                name: 'Save Changes',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height(20.h),
            ],
          ),
        ),
      ),
    );
  }

  _buildListTile(
      {required BuildContext context,
      required String img,
      required String title,
      required String subTitle,
      void Function()? onEditTap,
      void Function()? onTrashTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.07),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Image.file(
          File(img),
          height: 30,
          width: 30,
        ),
        title: AppConstant.commonText(title ?? "",
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.shadow),
        subtitle: AppConstant.commonText(subTitle ?? "",
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
        trailing: Wrap(
          spacing: 5.0,
          children: [
            InkWell(
              onTap: onEditTap,
              child: Image.asset(
                Assets.imagesEdit1,
                height: 20.h,
                width: 20.w,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
            InkWell(
              onTap: onTrashTap,
              child: Image.asset(
                Assets.imagesTrash1,
                height: 20.h,
                width: 20.w,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
