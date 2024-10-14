import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/app_widgets.dart';
import '../../../../../utils/common_spacer.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_outlined_button.dart';
import '../../cubit/history_cubit.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HistoryCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(20),
          Row(
            children: [
              AppConstant.commonText("Filter",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.shadow),
              const Spacer(),
              InkWell(
                onTap: () {
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
          height(10),
          Column(
            children: [
              CommonDropdownWidget(
                labelText: "All Accounts",
                items: const [],
                onChanged: (p0) {},
                title: "Account",
                fontColor: Theme.of(context).colorScheme.onSecondaryContainer,
                backGroundColor: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.1),
                height: 35,
              ),
              height(10),
              CommonDropdownWidget(
                labelText: "All Networks",
                items: const [],
                onChanged: (p0) {},
                title: "Network",
                fontColor: Theme.of(context).colorScheme.onSecondaryContainer,
                backGroundColor: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.1),
                height: 35,
              ),
              height(10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CommonTextfield(
                      controller: cubit.minimumPerTransCtrl,
                      title: "Minimum per transaction",
                      height: 40.h,
                      hintText: "\$ 0",
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(0.1),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
          height(8),
          Row(
            children: [
              Expanded(
                child: CommonOutlinedButton(
                    height: 45,
                    borderColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      cubit.minimumPerTransCtrl.clear();
                    },
                    title: "Reset"),
              ),
              width(8),
              Expanded(
                child: CommonButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  name: "Confirm",
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
