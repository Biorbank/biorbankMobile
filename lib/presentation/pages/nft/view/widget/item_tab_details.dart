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
          Expanded(
            child: GridView.builder(
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
                  return GestureDetector(
                    onTap: () {
                     context.router.push(const NFTDetailsRoute());
                    },
                    child: nftCardWidget(
                        context: context,
                        imageUrl:
                            'https://lh3.googleusercontent.com/IKACYcRzfRafyywq-i3QKWM3CALwdOTVC3q5Ka8WrrOgDp0Oq2OIhz2OwNMTZGkQWihNNjImu0r9KraSaWpVlhqGJ-l4NtTReol-Zg',
                        title: 'Hooligan #7459'),
                  );
                },
              ),
          ),
          
        ],
      ),
    );
  }
}
