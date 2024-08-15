import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_crypto_detail_tile.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CommonSearchScreen extends StatefulWidget {
  const CommonSearchScreen({super.key});

  @override
  State<CommonSearchScreen> createState() => _CommonSearchViewState();
}

class _CommonSearchViewState extends State<CommonSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(15.h),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        Assets.imagesBackArrow,
                        height: 27.h,
                      )),
                  width(16.w),
                  Expanded(
                      child: CommonTextfield(
                    isShowSpaceAfterTitle: false,
                    borderRadius: 30,
                    title: '',
                    autoFocus: true,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        Assets.imagesSearch,
                        height: 20.h,
                        width: 20.w,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    hintText: 'Search token name..',
                  )),
                ],
              ),
              height(10.h),
              CommonTabbar(
                  padding: const EdgeInsets.only(left: 8),
                  selectedIndex: 0,
                  length: 5,
                  onTap: (index) {},
                  tabController: tabController,
                  tabList: const ['All', 'Native', 'ETH', 'BRC-20', 'Cosmos']),
              height(8.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => height(6.h),
                  itemCount: 10,
                  itemBuilder: (context, index) => CommonCryptoDetailTile(
                      context: context,
                      onTap: () {},
                      contentPadding: const EdgeInsets.only(left: 8),
                      coinName: 'Ethereum',
                      coinImageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU',
                      coinShortName: '\$ETH'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
