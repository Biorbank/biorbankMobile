import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/cubit/import_exsiting_account_cubit.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
@RoutePage()

class NewAccountCreateScreen extends StatelessWidget {
  const NewAccountCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:
            BlocBuilder<ImportExsitingAccountCubit, ImportExsitingAccountState>(
          builder: (context, state) {
            var cubit = context.read<ImportExsitingAccountCubit>();
           if(state is ChainChangeState){
            cubit.selectedChainIndex=state.index;
           }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(14.h),
                CommonAppbar(
                  title: AppStrings.createNewAccount,
                ),
                height(25.h),
                AppConstant.commonText(
                    'Select which chains you’d like to enable on your account',
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                CommonTextfield(
                  title: '',
                  hintText: 'Search Networks',
                  prefixWidget: Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                height(14.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, index) => height(10.h),
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          cubit.changeChainIndex(index: index);
                        },
                        leading: Container(
                          height: 34.h,
                          width: 34.w,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(Assets.imagesUser),
                        ),
                        title: AppConstant.commonText('Networks name',
                            color: Theme.of(context).colorScheme.shadow),
                        trailing: Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: cubit.selectedChainIndex == index
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondaryFixed)),
                          child: Container(
                            height: 10.h,
                            width: 10.h,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cubit.selectedChainIndex == index
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : AppColors.transparent),
                          ),
                        ));
                  },
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
