import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_widgets.dart';
import '../../../../../utils/common_spacer.dart';
import '../../../../../utils/routers/auto_app_router.dart';
import '../../cubit/chat_cubit.dart';

class SendMoneyBottomSheet extends StatelessWidget {
  const SendMoneyBottomSheet({super.key});

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
              AppConstant.commonText('Send Funds via',
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: cubit.sendMoneyTypeList.length,
              itemBuilder: (context, index) {
                final data = cubit.sendMoneyTypeList[index];
                return _buildListTile(
                  context: context,
                  img: data["img"],
                  title: data["title"],
                  subTitle: data["subTitle"],
                  onTap: () {
                    // context.router.replace(const SendMoneyRoute());
                    if (index != 2) {
                      context.router.push(const SendMoneyRoute());
                      return;
                    }
                    context.router.push(const LinkNewAddressRoute());
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
        tileColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.07),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
        trailing: InkWell(
          onTap: onTap,
          child: Image.asset(
            Assets.imagesEdit,
            height: 20.h,
            width: 20.w,
            color: Theme.of(context).colorScheme.shadow,
          ),
        ),
      ),
    );
  }
}
