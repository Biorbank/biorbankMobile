import 'package:biorbank/presentation/pages/token_page/view/widget/news_tab_widget/news_read_screen.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/token_cubit.dart';

class NewsTabScreen extends StatelessWidget {
  const NewsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TokenCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            cubit.newsData.length,
            (index) {
              final data = cubit.newsData[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsReadScreen(newsData: data),
                    ),
                  );
                },
                child: _buildNewsRow(
                    context: context,
                    newsImg: data.img ?? "",
                    name: data.name ?? "",
                    type: data.newsType ?? "",
                    seenTime: data.seenTime ?? ""),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildNewsRow({
    required BuildContext context,
    required String name,
    required String newsImg,
    required String type,
    required String seenTime,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: newsImg ?? '',
              height: 50.h,
              width: 50.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          width(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.commonText(name,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.shadow),
                height(10),
                Row(
                  children: [
                    AppConstant.commonText(type,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.shadow),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondaryFixed,
                      ),
                    ),
                    AppConstant.commonText(seenTime,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
