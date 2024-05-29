import 'package:biorbank/utils/common_spacer.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/Theme/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_widgets.dart';
import '../../../../utils/global.dart';
import '../cubit/create_account_cubit.dart';
import 'instruction_widget.dart';

class RecoveryParseView extends StatelessWidget {
  const RecoveryParseView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CreateAccountCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height(10.h),
        AppConstant.commonText(AppStrings.recoveryPhrase,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black),
        height(20.h),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: const Color(0xFFF6F5FA)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 3.5,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: Global.recoveryPhraseList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey100),
                        borderRadius: BorderRadius.circular(100.r),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: Center(
                      child: AppConstant.commonText(
                          '${index + 1}. ${Global.recoveryPhraseList[index]}',
                          color: AppColors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              height(25.h),
              BlocBuilder<CreateAccountCubit, CreateAccountState>(
                builder: (context, state) {
                  if (state is RecoveryPhraseSelectedState) {
                    FlutterClipboard.copy(state.phraseData).then((_) {
                      AppConstant.showToast(msg: 'Copied');
                    });
                    cubit.refreshState();
                  }
                  return GestureDetector(
                    onTap: () {
                      cubit.copyToClipboard();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppConstant.commonText('Copy to clipboard',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary),
                        width(8.w),
                        Image.asset(
                          Assets.imagesCopy,
                          height: 20.h,
                        )
                      ],
                    ),
                  );
                },
              ),
              height(5.h),
            ],
          ),
        ),
        height(25.h),
        const InstructionWidget(),
      ],
    );
  }
}
