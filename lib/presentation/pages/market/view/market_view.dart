import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/market/view/widget/market_detail_widget.dart';
import 'package:biorbank/presentation/pages/market/view/widget/market_tabbar.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
@RoutePage()

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 245.h,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonBlueContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          height(40.h),
                          CommonSearchAppbar(
                            hintText: 'Search or enter URL',
                            textController: context
                                .read<MarketCubit>()
                                .searchTextController,
                                // onTapTextField: (){
                                //   context.router.push(const CommonSearchRoute());
                                //  // Navigator.pushNamed(context, Routes.serachViewRoute);
                                // },
                          ),
                          height(76.h),
                        ],
                      ),
                    ),
                  ),
                  // height(60.h),

                  /// tabbar
                ],
              ),
              Positioned(
                top: 130.h,
                left: 0,
                right: 0,
                child: const MarketDetailsWidget(),
              ),
            ],
          ),
        ),
        const Expanded(child: MarketTabbar()),
      ],
    );
  }
}
