import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_text_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/browser/view/widget/browser_card_widget.dart';
import 'package:biorbank/presentation/pages/browser/view/widget/coin_desk_news_card.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class BrowserScreen extends StatelessWidget {
  const BrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        CommonBlueContainer(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(50.h),
                      const CommonSearchAppbar(
                        isVisibleTextField: false,
                      ),
                      height(30.h),
                      AppConstant.commonText('Explore',
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                      height(10.h),
                      CommonTextfield(
                        title: '',
                        isShowSpaceAfterTitle: false,
                        borderRadius: 100,
                        textColor: Theme.of(context).colorScheme.onSurface,
                        cursorColor: Theme.of(context).colorScheme.onSurface,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.12),
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                        prefixWidget: Image.asset(
                          Assets.imagesBrowser,
                          height: 20.h,
                          width: 20.w,
                          scale: 4.6,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        hintText: 'Site URL',
                      ),
                    ]))),
        DraggableScrollableSheet(
          initialChildSize: 0.67,
          minChildSize: 0.3,
          maxChildSize: 0.7,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(10.h),
                        Center(
                          child: Container(
                            height: 4.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                        ),
                        height(20.h),

                        /// trending now
                        const BrowserCardWidget(
                          data: [
                            {
                              'image_url':
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1esj_tH6RZ7q2lXj-LLqfwutnmFVPdZsyOg&s',
                              'name': 'Swell'
                            },
                            {
                              'image_url':
                                  'https://s2.coinmarketcap.com/static/img/coins/200x200/7278.png',
                              'name': 'AAVE'
                            },
                            {
                              'image_url':
                                  'https://s2.coinmarketcap.com/static/img/coins/200x200/7278.png',
                              'name': 'AAVE'
                            },
                            {
                              'image_url':
                                  'https://s2.coinmarketcap.com/static/img/coins/200x200/8085.png',
                              'name': 'Lido Stake'
                            },
                          ],
                          title: 'Trending now',
                        ),
                        height(20.h),

                        /// bookmarks
                        BrowserCardWidget(
                          data: const [
                            {
                              'image_url':
                                  'https://moralis.io/wp-content/uploads/web3wiki/407-defillama/637aeb61cd02c50fc4980893_s1dwgAti0YrSLrnfeP0GNuzkmCR8LOEywkq07NOhriY.jpeg',
                              'name': 'DefiLlama'
                            },
                            {
                              'image_url':
                                  'https://seeklogo.com/images/O/opensea-logo-7DE9D85D62-seeklogo.com.png',
                              'name': 'OpenSea'
                            },
                            {
                              'image_url':
                                  'https://s2.coinmarketcap.com/static/img/coins/200x200/7278.png',
                              'name': 'AAVE'
                            },
                            {
                              'image_url':
                                  'https://pbs.twimg.com/profile_images/1798097577725841408/RapNUw2e_400x400.jpg',
                              'name': 'MagicEden'
                            },
                          ],
                          title: AppStrings.bookMarks,
                          isVisibleBookMark: true,
                        ),
                        height(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppConstant.commonText('Coindesk News',
                                color: Theme.of(context).colorScheme.shadow,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            CommonTextButton(
                              name: 'See All',
                              fontSize: 13.sp,
                              onTap: () {},
                              textColor: Theme.of(context).colorScheme.shadow,
                            )
                          ],
                        ),
                        height(10.h),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 205.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => const CoinDeskNewsCard(
                        imageUrl:
                            'https://cloudfront-us-east-1.images.arcpublishing.com/coindesk/7WCMPV6DSNELBCTVY7HB6GWW7E.png',
                        title: 'Moranbod CEO Est Dr',
                        description:
                            'CEO Est Dr Moranbod CEO Est D rCEO Est Dr Printres',
                      ),
                    ),
                  ),
                  height(30.h),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
