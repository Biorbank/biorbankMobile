import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/nft_card_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/nft_list_widget.dart';
import 'package:biorbank/presentation/pages/home/view/widget/nfts_filter_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NFTsTabWidget extends StatefulWidget {
  const NFTsTabWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<NFTsTabWidget> createState() => _NFTsTabWidgetState();
}

class _NFTsTabWidgetState extends State<NFTsTabWidget> {
  bool isGrid = true;
  bool gridColor = true;
  bool listColor = false;

  List<Map<String, String>> hooliganCollection = [
    {
      "title": "Hooligan #8190",
      "imageUrl": "https://i.seadn.io/s/raw/files/b9e7db073eb5c104232c306aa3accd91.png?auto=format&dpr=1&w=750"
    },
    {
      "title": "Hooligan #2180",
      "imageUrl": "https://i.seadn.io/s/raw/files/7778b5526e5552c5c6c1a0905ab47c2e.png?auto=format&dpr=1&w=750"
    },
    {
      "title": "Hooligan #6539",
      "imageUrl": "https://i.seadn.io/s/raw/files/c66c3e92322c8044504b79226d7ca5e9.png?auto=format&dpr=1&w=750"
    },
    {
      "title": "Hooligan #4120",
      "imageUrl": "https://i.seadn.io/s/raw/files/beac1f64192aa51674d2c224c746c739.png?auto=format&dpr=1&w=750"
    },
    {
      "title": "Hooligan #5692",
      "imageUrl": "https://i.seadn.io/s/raw/files/c2d8d3bd88df96dee357dbdfe645a1ec.png?auto=format&dpr=1&w=750"
    },
    {
      "title": "Hooligan #3599",
      "imageUrl": "https://i.seadn.io/s/raw/files/9430aa2a14a4130dd98b9599df3b33eb.png?auto=format&dpr=1&w=750"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF6F7F9)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGrid = true;
                            gridColor = true;
                            listColor = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: gridColor
                                  ? const Color(0xFFEEEEEE)
                                  : AppColors.transparent),
                          child: Icon(
                            Icons.grid_view_rounded,
                            color: gridColor
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                          ),
                        ),
                      ),
                      width(12.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGrid = false;
                            gridColor = false;
                            listColor = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: listColor
                                  ? const Color(0xFFEEEEEE)
                                  : AppColors.transparent),
                          child: Icon(
                            Icons.menu,
                            color: listColor
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      scrollControlDisabledMaxHeightRatio: 7 / 8,
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      builder: (context) {
                        return const NFTsFilterWidget();
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFF6F7F9)),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          //  color: const Color(0xFFEEEEEE)
                        ),
                        child: Image.asset(
                          Assets.imagesFilter,
                          height: 18.h,
                          width: 18.w,
                        )),
                  ),
                ),
              ],
            ),
            height(12.h),
            isGrid
                ? GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: hooliganCollection.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.78,
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      final hooligan = hooliganCollection[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushRoute(NftHoldingRoute(
                              imageUrl: hooligan['imageUrl']!,
                              title: hooligan['title']!
                          )
                          );
                          // Navigator.pushNamed(context, Routes.nftHoldingRoute,
                          //     arguments: {
                          //       "title": "Hooligan #7459",
                          //       "image_url":
                          //           "https://static.vecteezy.com/system/resources/previews/028/646/618/non_2x/anime-cartoon-character-illustration-manually-created-free-vector.jpg"
                          //     });
                        },
                        child: nftCardWidget(
                            context: context,
                            imageUrl: hooligan['imageUrl']!,
                            title: hooligan['title']!
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return const NftListWidget(
                        img:
                            "https://i.seadn.io/s/raw/files/7778b5526e5552c5c6c1a0905ab47c2e.png?auto=format&dpr=1&w=750",
                        title: 'Hooligan #2180',
                        floorPrice: "0.019",
                        listed: "0/2",
                        cost: "0",
                        estimated: "\$0",
                      );
                    },
                  ),
            height(20.h),
          ],
        ),
      ),
    );
  }
}
