import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodSheet extends StatefulWidget {
  const PaymentMethodSheet({super.key});

  @override
  State<PaymentMethodSheet> createState() => _PaymentMethodSheetState();
}

class _PaymentMethodSheetState extends State<PaymentMethodSheet>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context
          .read<P2pMarketCubit>()
          .onChangePaymentMethodTabIndex(tabIndex: tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<P2pMarketCubit, P2pMarketState>(
          builder: (context, state) {
            var cubit = context.read<P2pMarketCubit>();
            if (state is PaymentMethodTabIndexState) {
              cubit.selectedPaymentMethodTabIndex = state.index;
            } else if (state is PaymentMethodSelectedState) {
              cubit.selectedPaymentMethod = state.index;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                height(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppConstant.commonText('Payment Method',
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_outlined,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    )
                  ],
                ),
                height(14.h),
                CommonTabbar(
                    selectedIndex: cubit.selectedPaymentMethodTabIndex,
                    length: 2,
                    backgroundContainerMargin: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    tabAlignment: TabAlignment.fill,
                    isScrollable: false,
                    labelTextBackgroundPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    labelColor: Theme.of(context).colorScheme.shadow,
                    isShowBackgroundShadow: true,
                    onTap: (index) {},
                    tabController: tabController,
                    tabList: const ['Online', 'Cash']),
                CommonTextfield(
                  title: '',
                  borderRadius: 100,
                  hintText: 'Search payment method..',
                  controller: cubit.searchPaymenyMethodController,
                  prefixWidget: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset(
                      Assets.imagesSearch,
                      height: 20.h,
                      width: 20.w,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
                height(10.h),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: cubit.paymentMethodList.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (157.w) / (44.h),
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      var data = cubit.paymentMethodList[index];
                      return InkWell(
                        onTap: () {
                          cubit.onSelectPaymentMethod(index: index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                  color: cubit.selectedPaymentMethod == index
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                              color:
                                  Theme.of(context).colorScheme.errorContainer),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    width(10.w),
                                    Visibility(
                                        visible: data['image'].isNotEmpty,
                                        child: CachedNetworkImage(
                                          imageUrl: data['image'],
                                          height: 16.h,
                                          width: 16.w,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const SizedBox.shrink(),
                                        )),
                                    width(data['image'].isNotEmpty ? 10.w : 0),
                                    Expanded(
                                      child: AppConstant.commonText(data['name'],
                                          fontWeight: FontWeight.w500,
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible:
                                        cubit.selectedPaymentMethod == index,
                                    child: Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                      child: Icon(
                                        Icons.check,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  width(8.w)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
