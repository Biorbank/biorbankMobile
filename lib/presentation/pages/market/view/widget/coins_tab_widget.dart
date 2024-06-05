import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
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
            DefaultTabController(
                length: 4,
                child: TabBar(
                    indicatorColor: AppColors.transparent,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(
                      bottom: 10,
                      top: 6,
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    splashFactory: NoSplash.splashFactory,
                    tabAlignment: TabAlignment.start,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: cubit.coinsTabList.map((e) {
                      int index = cubit.coinsTabList.indexOf(e);
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: cubit.selectedCoinsTabIndex == index
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                gradient: cubit.selectedCoinsTabIndex == index
                                    ? LinearGradient(colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.onPrimary,
                                      ])
                                    : null),
                            child: AppConstant.commonText(e,
                                fontWeight: FontWeight.w500,
                                color: cubit.selectedCoinsTabIndex == index
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer)),
                      );
                    }).toList())),
           // height(15.h),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                separatorBuilder: (context, index) => height(20.h),
                itemCount: 14,
                itemBuilder: (context, index) => coinCard(
                    coinName: 'Bitcoin',
                    coinShortName: '\$BTC',
                    differentPercentage: '+1.23%',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png',
                    isProfit: (index %2)==0,
                    price: '\$12,584'
                    ),
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
      required String price
      }) {
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