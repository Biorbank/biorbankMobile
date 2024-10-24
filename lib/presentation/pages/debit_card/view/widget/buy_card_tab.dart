import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/debit_card/cubit/debit_card_cubit.dart';
import 'package:biorbank/presentation/pages/debit_card/view/widget/common_filter_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/web_view_widget.dart';

class BuyCardTab extends StatelessWidget {
  const BuyCardTab(
      {super.key,
        this.onTapSortByFilter,
        this.onTapTypeFilter,
        this.onTapOnlineInStoreFilter,
        required this.selectedSortByFilter,
        required this.selectedTypeFilter,
        required this.selectedOnlineInStoreFilter});
  final Function(String)? onTapSortByFilter;
  final Function(String)? onTapTypeFilter;
  final Function(String)? onTapOnlineInStoreFilter;
  final String selectedSortByFilter;
  final String selectedOnlineInStoreFilter;
  final String selectedTypeFilter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(10.h),
          Row(
            children: [
              filterTile(
                  context: context,
                  title: 'Type',
                  onTap: () {
                    commonBottomsheetShow(
                        context: context,
                        filterList: context.read<DebitCardCubit>().typeFilter,
                        selectedFilter: selectedTypeFilter,
                        title: 'Type',
                        onTapFilter: onTapTypeFilter);
                  }),
              width(15.w),
              filterTile(
                  context: context,
                  title: 'Sort By',
                  onTap: () {
                    commonBottomsheetShow(
                        context: context,
                        filterList: context.read<DebitCardCubit>().sortByFilter,
                        selectedFilter: selectedSortByFilter,
                        title: 'Sort By',
                        onTapFilter: onTapSortByFilter);
                  }),
              width(15.w),
              filterTile(
                  context: context,
                  title: 'Online/in-store',
                  onTap: () {
                    commonBottomsheetShow(
                        context: context,
                        filterList:
                        context.read<DebitCardCubit>().onlineOrStoreFilter,
                        selectedFilter: selectedOnlineInStoreFilter,
                        title: 'Online/in-store',
                        onTapFilter: onTapOnlineInStoreFilter);
                  }),
            ],
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 25),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 13,
                  childAspectRatio: 0.98),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondaryFixed)),
                child: cardDetailWidget(
                  context: context,
                  imageUrl: Assets.imagesCardUber,
                  price: 'C\$15 - C\$500',
                  title: 'Uber',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> commonBottomsheetShow(
      {required BuildContext context,
        required List<String> filterList,
        required String selectedFilter,
        required String title,
        required Function(String)? onTapFilter}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      context: context,
      builder: (context) => CommonFilterWidget(
        filterList: filterList,
        title: title,
        selectedFilter: selectedFilter,
        onTapFilter: onTapFilter,
      ),
    );
  }

  Widget cardDetailWidget(
      {required BuildContext context,
        required String imageUrl,
        required String title,
        required String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          // Open WebView on card tap
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  WebViewScreen(url: 'https://www.bitrefill.com/embed'),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(10.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                imageUrl,
                height: 89.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            height(8.h),
            AppConstant.commonText(title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
            height(4.h),
            AppConstant.commonText(price,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSecondaryContainer)
          ],
        ),
      ),
    );
  }

  Widget filterTile(
      {required BuildContext context,
        required String title,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        child: AppConstant.commonText(title,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
    );
  }
}
