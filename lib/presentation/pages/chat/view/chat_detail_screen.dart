import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/chat/cubit/chat_cubit.dart';
import 'package:biorbank/presentation/pages/chat/view/widget/message_bubble_widget.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              Assets.imagesBackArrow,
              height: 24.h,
            ),
          ),
        ),
        titleSpacing: 6,
        toolbarHeight: 70.h,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.transparent,
              backgroundImage: const CachedNetworkImageProvider(
                  'https://randomuser.me/api/portraits/women/44.jpg'),
            ),
            SizedBox(width: 10.w),
            AppConstant.commonText('Kristin Watson',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => height(6.h),
                itemCount: context.read<ChatCubit>().chatData.length,
                itemBuilder: (context, index) {
                  var data = context.read<ChatCubit>().chatData[index];
                  if (data["type"] == "date") {
                    return dateWidget(
                        date: data["date"] ?? '', context: context);
                  }
                  return ChatMessageWidget(
                    isMyMessage: data["isSentByMe"] == "true",
                    message: data["message"] ?? '',
                    time: data["time"] ?? '',
                    amount: data["amount"] ?? '',
                    status: data["status"] ?? '',
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: CommonOutlinedButton(
                            height: 50.h,
                            borderColor:
                                Theme.of(context).colorScheme.onPrimary,
                            textColor: Theme.of(context).colorScheme.onPrimary,
                            onTap: () {},
                            borderRadius: 16,
                            fontSize: 14.sp,
                            icon: Image.asset(
                              Assets.imagesArrowDown,
                              height: 18.h,
                              width: 18.w,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            title: 'Request')),
                    width(8.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.router.push(const SendMoneyRoute());

                          // Navigator.pushNamed(
                          // context,
                          // Routes.sendMoneyRoute);
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Theme.of(context).colorScheme.onPrimary,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.onPrimary,
                                spreadRadius: -2,
                                blurRadius: 12,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppConstant.commonText("Send",
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                              width(10.w),
                              Image.asset(
                                Assets.imagesArrowUp,
                                height: 18.h,
                                width: 18.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                height(1.h),
                CommonTextfield(
                  title: '',
                  borderRadius: 12.r,
                  hintText: 'Write a message..',
                  suffixWidget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      Assets.imagesShare,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dateWidget({required BuildContext context, required String date}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.onSurface),
          child: AppConstant.commonText(date,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ),
    );
  }
}
