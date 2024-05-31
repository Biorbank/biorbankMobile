import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NFTsTabWidget extends StatelessWidget {
  const NFTsTabWidget({super.key,required this.scrollController});
final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
 controller: scrollController,
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
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xFFEEEEEE)),
                          child: const Icon(
                            Icons.grid_view_rounded,
                          ),
                        ),
                      ),
                      width(12.w),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            //  color: const Color(0xFFEEEEEE)
                          ),
                          child: Icon(
                            Icons.menu,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.78,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                return nftCardWidget(
                    context: context,
                    imageUrl:
                        'https://static.vecteezy.com/system/resources/previews/028/646/618/non_2x/anime-cartoon-character-illustration-manually-created-free-vector.jpg',
                    title: 'Hooligan #7459');
              },
            ),
                        height(20.h),

          ],
        ),
      ),
    );
  }

  Widget nftCardWidget(
      {required BuildContext context,
      required String imageUrl,
      required String title}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF6F5FA),
          border: Border.all(color: const Color(0xFFE9E9E9))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 145.h,
              width: 145.w,
              fit: BoxFit.cover,
            ),
          ),
          height(12.h),
          AppConstant.commonText(title,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.shadow)
        ],
      ),
    );
  }
}
