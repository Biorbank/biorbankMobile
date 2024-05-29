import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/create_account/cubit/create_account_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordSelectorDialog extends StatelessWidget {
  const WordSelectorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor:Theme.of(context).colorScheme.onSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
          builder: (context, state) {
            var cubit = context.read<CreateAccountCubit>();
            if (state is FetchWordSuccessState) {
              if (state.selectedeString.trim() == cubit.word) {
                cubit.isValidWordSelction = true;
                AppConstant.showToast(msg: 'Success!');
                cubit.refreshState();
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            AppConstant.commonText(
                                'Write the following to continue',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow),
                            const Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  alignment: Alignment.centerRight,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: AppColors.grey,
                                  )),
                            )
                          ],
                        ),
                        height(14.h),
                        AppConstant.commonText(" ''${cubit.word}'' ",
                            textAlign: TextAlign.center,
                            color: Theme.of(context).colorScheme.shadow,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        height(30.h),
                        AppConstant.commonText(cubit.selectedWords.join(''),
                            color: Theme.of(context).colorScheme.shadow,
                            fontSize: 16),
                        height(5.h),
                        AppConstant.commonDivider(color: AppColors.grey100),
                        height(25.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 3.5,
                            mainAxisSpacing: 15.0,
                          ),
                          itemCount: cubit.wordData.length,
                          itemBuilder: (context, index) {
                            var data = cubit.wordData[index];
                            return GestureDetector(
                              onTap: () {
                                cubit.onSelectWord(word: data);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.grey100),
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: AppColors.blue20),
                                child: Center(
                                  child: AppConstant.commonText(data,
                                      color: AppColors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          },
                        ),
                        height(25.h),
                      ],
                    ),
                  ),
                ),
                CommonButton(
                  name: 'Next',
                  onTap: () {
                    if (cubit.isValidWordSelction) {
                      Navigator.pop(context);
                    } else {
                      AppConstant.showToast(msg: 'Please select correct words');
                    }
                  },
                ),
                height(25.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
