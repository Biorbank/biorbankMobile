import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/price_line_chart.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/widget/add_address_dialog.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/widget/carousel_control.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/widget/carousel_images.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/widget/description_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NFTDetailsPage extends StatelessWidget {
  const NFTDetailsPage({
    super.key,
  });
  static List<String> images = [
    'https://img.decrypt.co/insecure/rs:fit:3840:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2023/07/MPH-2-gID_7.jpg@webp',
    'https://cdn.publish0x.com/prod/fs/images/89d99afdbfa537b3e108e202d9524189ffa3c74302d42815e72dc2fc4160ce3b.png',
    'https://pbs.twimg.com/ext_tw_video_thumb/1466059844327247877/pu/img/Fp28ApEpaa4ogvM6?format=jpg&name=4096x4096'
  ];
  static CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        child: DrawerHeader(
            child: AppConstant.commonText('Drawer page',
                color: Theme.of(context).colorScheme.shadow)),
      ),
      resizeToAvoidBottomInset: false,
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
                  height(35.h),
                  CommonSearchAppbar(
                    hintText: 'ID/USDT',
                    onTapBellIcon: () {},
                    textController: TextEditingController(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(18.h),
                        Stack(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryFixed)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Carousel image slider
                                  CarouselImageWidget(
                                      carouselController: carouselController,
                                      images: images),

                                  /// description widget
                                  DescriptionWidget(
                                    title: 'Hooligan #7459',
                                    chain: 'Polygon',
                                    isVisibleAcceptButton: false,
                                    description:
                                        'A CNS or UNS blockchain domain. Use it to resolve your cryptocurrency address and decentralized websites',
                                    contactAddress: 'Oxa9a6a36269932',
                                    tokenId: '2955844746...34016',
                                    tokenStandard: 'ERC721',
                                    onTapExploreButton: () {},
                                  ),
                                  height(20.h),

                                  /// price line chart
                                  const PriceLineChart(),
                                  height(20.h)
                                ],
                              ),
                            ),
                            Positioned(
                              top: 150.h,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: CarouselControl(
                                  onPressed: () {
                                    carouselController.previousPage();
                                  },
                                  child:  Icon(Icons.arrow_back_ios_new,
                                      size: 18, color: Theme.of(context).colorScheme.shadow),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 150.h,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CarouselControl(
                                    onPressed: () =>
                                        carouselController.nextPage(),
                                    child:  Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                        color: Theme.of(context).colorScheme.shadow),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        height(20.h)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 90.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryFixedVariant
                                .withOpacity(0.12),
                            offset: const Offset(0, -4))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesCartFilled,
                                height: 24.h,
                                width: 24.w,
                              ),
                              height(6.h),
                              AppConstant.commonText('Add',
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                        ),
                        width(25.w),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: CommonOutlinedButton(
                                height: 49.h,
                                borderRadius: 16.r,
                                borderColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                textColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onTap: () {},
                                title: 'Make offer',
                              )),
                              width(15.w),
                              Expanded(
                                  child: CommonButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const AddAddressDialog(),
                                  );
                                },
                                name: 'Buy',
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}