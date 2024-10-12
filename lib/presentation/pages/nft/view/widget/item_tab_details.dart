import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/common/nft_card_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTabDetails extends StatelessWidget {
  const ItemTabDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextfield(
            title: '',
            hintText: 'Search NFTs by name, token ID',
            prefixWidget: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                Assets.imagesSearch,
                height: 20.h,
                width: 20.w,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ),
          ),
          height(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonDropdownWidget(
                height: 30.h,
                borderRadius: 0,
                value: 'Lowest listing price',
                labelText: '',
                items: ['Lowest listing price']
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: AppConstant.commonText(e,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow)))
                    .toList(),
                onChanged: (value) {},
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.imagesFilter,
                    height: 20,
                    width: 20,
                  ),
                  width(22.w),
                  Image.asset(
                    Assets.imagesCart,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
          height(15.h),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: hooliganCollection.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.78,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            itemBuilder: (context, index) {
              final hooligan = hooliganCollection[index];
              return GestureDetector(
                onTap: () {
                  context.router.push(const NFTDetailsRoute());
                },
                child: nftCardWidget(
                    context: context,
                    imageUrl: hooligan['imageUrl']!,
                    title: hooligan['title']!
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
