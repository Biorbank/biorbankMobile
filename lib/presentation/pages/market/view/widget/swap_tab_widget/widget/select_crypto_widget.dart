import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_crypto_detail_tile.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCryptoWidget extends StatefulWidget {
  const SelectCryptoWidget({super.key});

  @override
  State<SelectCryptoWidget> createState() => _SelectCryptoWidgetState();
}

class _SelectCryptoWidgetState extends State<SelectCryptoWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      context
          .read<MarketCubit>()
          .onChangeSelectedCryptoTabIndex(index: tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: BlocBuilder<MarketCubit, MarketState>(
        builder: (context, state) {
          var cubit = context.read<MarketCubit>();
          if (state is ChangeSelectedCryptoTabState) {
            cubit.selectedCryptoTabIndex = state.index;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(18.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText(AppStrings.selectCrypto,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    Assets.imagesClose,
                                    height: 14.w,
                                    width: 14.w,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    height(5.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CommonTextfield(
                        title: '',
                        borderRadius: 100,
                        prefixWidget: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            Assets.imagesSearch,
                            height: 20.h,
                            width: 20.w,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        hintText: AppStrings.searchTokenName,
                      ),
                    ),
                    CommonTabbar(
                      onTap: (index) {},
                      selectedIndex: cubit.selectedCryptoTabIndex,
                      length: 4,
                      tabController: tabController,
                      tabList: const ['All', 'Native', 'ETH', 'Cosmos', 'Other'],
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        separatorBuilder: (context, index) => height(6.h),
                        itemCount: 10,
                        itemBuilder: (context, index) => CommonCryptoDetailTile(
                            context: context,
                            secondCoinUrl: index == 0
                                ? 'https://thumbs.dreamstime.com/b/ethereum-coin-isolated-one-shiny-golden-eth-physical-over-white-background-digital-blockchain-cryptocurrency-118284096.jpg'
                                : null,
                            coinName: 'Ethereum',
                            coinImageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU',
                            coinShortName: '\$ETH'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 22, bottom: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: const Offset(0, -4),
                          color: const Color(0xFF000000).withOpacity(0.12))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CommonButton(
                    name: AppStrings.unlockToken,
                    onTap: () {
                     
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

 
}
