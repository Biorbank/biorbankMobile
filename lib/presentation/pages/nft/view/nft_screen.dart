import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/activity_tab_details.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/item_tab_details.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/nft_profile_details.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/nft_volume_details.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NFTScreen extends StatefulWidget {
  const NFTScreen({super.key});

  @override
  State<NFTScreen> createState() => _NFTScreenState();
}

class _NFTScreenState extends State<NFTScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonBlueContainer(
            height: 120.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(45.h),
                  CommonSearchAppbar(
                    hintText: 'ID/USDT',
                    onTapBellIcon: () {},
                    textController: TextEditingController(),
                  ),
                ],
              ),
            ),
          ),
          NftProfileDetails(
            backgroundImage:
                'https://assets-prd.ignimgs.com/2023/09/26/mypethooligancinematictrailer-ign-blogroll-1695754280536.jpg',
            nftImage:
                'https://pbs.twimg.com/profile_images/1568887348917846016/CKyNyac-_400x400.jpg',
            title: 'My Pet Hooligan',
            items: '8.88K',
            onTapCollectOffer: () {},
            royalty: '0%',
          ),
          height(20.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NftVolumeDetails(
                    bestOffer: '0.9101',
                    totalVolume: '23.8K',
                    floorPrice: '0.977',
                    listed: '3.4%',
                    totalOwner: '3,649',
                    uniqueOwners: '41.41%',
                  ),
                  height(10.h),
                  CommonTabbar(
                      isShowBackground: true,
                      indicatorColor: Theme.of(context).colorScheme.onPrimary,
                      labelPadding:
                          const EdgeInsets.only(bottom: 10, top: 6, right: 30),
                      isScrollable: true,
                      padding: const EdgeInsets.only(left: 20),
                      tabBarIndicatorSize: TabBarIndicatorSize.label,
                      tabAlignment: TabAlignment.start,
                      selectedIndex: 0,
                      labelFontWight: FontWeight.w500,
                      length: 2,
                      onTap: (index) {},
                      tabController: tabController,
                      tabList: const ['Items', 'Activity']),
                  SizedBox(
                    height: MediaQuery.of(context).size.height + 60,
                    child:
                        TabBarView(controller: tabController, children: const [
                      ItemTabDetails(),
                      ActivityTabDetails(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
