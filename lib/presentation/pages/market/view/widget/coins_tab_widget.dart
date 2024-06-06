import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsTabWidget extends StatefulWidget {
  const CoinsTabWidget({super.key});

  @override
  State<CoinsTabWidget> createState() => _CoinsTabWidgetState();
}

class _CoinsTabWidgetState extends State<CoinsTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      context
          .read<MarketCubit>()
          .onChangeCoinsTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        var cubit = context.read<MarketCubit>();
        if (state is ChangeCoinsTabBarIndexState) {
          cubit.selectedCoinsTabIndex = state.index;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(12.h),
            CommonTabbar(
                onTap: (index) {},
                selectedIndex: cubit.selectedCoinsTabIndex,
                length: 4,
                tabController: tabController,
                tabList: cubit.coinsTabList),
           
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                separatorBuilder: (context, index) => height(20.h),
                itemCount: 14,
                itemBuilder: (context, index) => coinCard(
                    coinName: 'Bitcoin',
                    coinShortName: '\$BTC',
                    differentPercentage: '+1.23%',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                    isProfit: (index % 2) == 0,
                    price: '\$12,584'),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget coinCard(
      {required String differentPercentage,
      required bool isProfit,
      required String imageUrl,
      required String coinName,
      required String coinShortName,
      required String price}) {
    return Row(
      children: [
        CachedNetworkImage(
            imageUrl: imageUrl,
            height: 44.h,
            width: 44.w,
            placeholder: (context, url) => const SizedBox.shrink()),
        width(15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstant.commonText(coinShortName,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
            height(8.h),
            AppConstant.commonText(coinName,
                fontSize: 12.sp, color: Theme.of(context).colorScheme.shadow),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstant.commonText(price,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
            height(8.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              decoration: BoxDecoration(
                color: isProfit
                    ? const Color(0xFFE5FAEE)
                    : const Color(0xFFFDEBEC),
                borderRadius: BorderRadius.circular(100),
              ),
              child: AppConstant.commonText(
                differentPercentage,
                fontSize: 10.sp,
                color: isProfit
                    ? Theme.of(context).colorScheme.onInverseSurface
                    : Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
