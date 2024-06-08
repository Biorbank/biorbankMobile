import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/pages/chat/view/widget/chat_cout_widget.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_detail_screen.dart';
import 'package:biorbank/presentation/pages/chat/view/widget/chat_info_tile.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonBlueContainer(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              height(40.h),
              CommonSearchAppbar(
                hintText: AppStrings.address,
              ),
              height(10.h),
            ],
          ),
        )),
        height(10.h),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: DefaultTabController(
              length: 3,
              child: TabBar(
                  onTap: (value) {},
                  isScrollable: true,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  labelPadding: const EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                    top: 6,
                  ),
                  controller: tabController,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Row(
                      children: [
                        AppConstant.commonText(
                          'Inbox',
                          fontSize: 16.sp,
                        ),
                        width(10.w),
                        chatCountWidget(
                            fontSize: 10.sp,
                            chatCount: "99+",
                            context: context,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2.5))
                      ],
                    ),
                    Row(
                      children: [
                        AppConstant.commonText(
                          'Unread',
                          fontSize: 16.sp,
                        ),
                        width(10.w),
                        chatCountWidget(
                            chatCount: "99+",
                            fontSize: 10.sp,
                            context: context,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2.5))
                      ],
                    ),
                    Row(
                      children: [
                        AppConstant.commonText(
                          'Transaction',
                          fontSize: 16.sp,
                        ),
                        width(10.w),
                        chatCountWidget(
                            chatCount: "99+",
                            fontSize: 10.sp,
                            context: context,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2.5))
                      ],
                    ),
                  ])),
        ),
        height(15.h),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          Routes.chatDetailRoute);
                    },
                    child: chatInfoTile(
                        profileImage:
                            'https://assets.entrepreneur.com/content/3x2/2000/20191204184811-IMG-5910.jpeg?format=pjeg&auto=webp&crop=1:1',
                        context: context,
                        chatCount: index == 0 ? 30 : null,
                        date: '20:7',
                        lastMsg: 'Thank you!',
                        name: 'Wade Warren'),
                  )),
        ),
      ],
    );
  }
}
