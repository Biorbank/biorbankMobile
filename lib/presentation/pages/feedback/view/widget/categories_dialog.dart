import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/feedback/cubit/feedback_cubit_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesDialog extends StatelessWidget {
  const CategoriesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  height(20.h),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: AppConstant.commonText('Categories',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            Assets.imagesClose,
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      )
                    ],
                  ),
                  height(20.h),
                  ListView.separated(
                    itemCount: context.read<FeedbackCubit>().categoriesList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    separatorBuilder: (context, index) =>
                        AppConstant.commonDivider(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data=context.read<FeedbackCubit>().categoriesList[index];
                      return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstant.commonText(data['title'],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow),
                          AppConstant.commonText(data['value'].toString(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ],
                      ),
                    );
                    }
                  ),
                  height(20.h),
                  CommonButton(
                    name: 'Add Paye',
                    onTap: () {},
                  ),
                  height(15.h),
                ]))));
  }
}
