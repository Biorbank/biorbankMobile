
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/market_detail_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            CommonBlueContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    height(40.h),
                    CommonSearchAppbar(
                      hintText: 'Search or enter URL',
                      textController:
                          context.read<MarketCubit>().searchTextController,
                    ),
                    height(70.h),
                  ],
                ),
              ),
            ),
            height(60.h),
           
          ],
        ),
        Positioned(
          top: 130.h,
          left: 0,
          right: 0,
          child:const MarketDetailsWidget(),
        ),
      ],
    );
  }
}

