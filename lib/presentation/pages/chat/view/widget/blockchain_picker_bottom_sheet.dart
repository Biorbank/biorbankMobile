import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/Theme/app_colors.dart';
import '../../../../../utils/app_widgets.dart';
import '../../../../../utils/common_spacer.dart';
import '../../../../../utils/routers/auto_app_router.dart';
import '../../../../common/common_textfield.dart';
import '../../cubit/chat_cubit.dart';

class BlockchainPickerBottomSheet extends StatefulWidget {
  const BlockchainPickerBottomSheet({super.key});

  @override
  _BlockchainPickerBottomSheetState createState() => _BlockchainPickerBottomSheetState();
}

class _BlockchainPickerBottomSheetState extends State<BlockchainPickerBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredBlockchains = []; // To hold filtered blockchains

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterBlockchains(String query) {
    final cubit = context.read<ChatCubit>();
    setState(() {
      if (query.isEmpty) {
        _filteredBlockchains = cubit.blockchainList; // Show all if query is empty
      } else {
        _filteredBlockchains = cubit.blockchainList.where((blockchain) {
          final name = blockchain["name"]?.toLowerCase();
          return name!.contains(query.toLowerCase());
        }).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          height(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppConstant.commonText('Pick a Blockchain',
                  fontWeight: FontWeight.w500,
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
          height(15.h),
          // Search Bar
          CommonTextfield(
            title: '',
            controller: _searchController,
            onChanged: (value) {
              _filterBlockchains(value ?? "");
            },
            hintText: 'Search',
            prefixWidget: Icon(Icons.search,
                color: AppColors.black),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: cubit.blockchainList.length,
              itemBuilder: (context, index) {
                final data = cubit.blockchainList[index];
                return _buildListTile(
                  context: context,
                  img: data["img"],
                  title: data["name"],
                  subTitle: data["address"],
                  onTap: () {
                    // context.router.replace(const SendMoneyRoute());
                    Navigator.pop(context);
                  },
                );
              },
              separatorBuilder: (context, index) => width(5),
            ),
          ),
        ],
      ),
    );
  }

  _buildListTile(
      {required BuildContext context,
        String? img,
        String? title,
        String? subTitle,
        void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: Colors.white,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        onTap: onTap,
        leading: Image.asset(
          img ?? "",
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
        trailing: Icon(
            Icons.copy,
            size: 20,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
