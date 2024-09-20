import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_balance_widget.dart';
import 'package:biorbank/presentation/pages/defi/cubit/defi_cubit.dart';
import 'package:biorbank/presentation/pages/defi/view/widget/defi_details_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DefiScreen extends StatelessWidget {
  const DefiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonBlueContainer(
          height: 244.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                height(40.h),
                CommonSearchAppbar(
                  hintText: 'ID/USDT',
                  textController:
                      context.read<DefiCubit>().searchTextController,
                  onTapTextField: () {
                    context.router.push(const CommonSearchRoute());
                    //Navigator.pushNamed(context, Routes.serachViewRoute);
                  },
                ),
                height(10.h),
                const CommonBalanceWidget(
                  amount: '\$75,630.90',
                  currentRate: 'CA \$0.00 (0.00%)',
                  isShowBalanceWidget: true,
                ),
              ],
            ),
          ),
        ),
        height(20.h),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => height(10.h),
            itemCount: 3,
            itemBuilder: (context, index) => const DeFiDetailsWidget(),
          ),
        ),
      ],
    );
  }
}
