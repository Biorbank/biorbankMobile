import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/create_account/cubit/create_account_cubit.dart';
import 'package:biorbank/presentation/pages/create_account/widget/word_selector_dialog.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_strings.dart';
import '../../../common/common_appbar.dart';
import '../widget/create_account_field_view.dart';
import '../widget/recovery_parse_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CreateAccountCubit>().shuffleList();
        showDialog(
          context: context,
          builder: (context) {
            return const WordSelectorDialog();
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountCubit, CreateAccountState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CreateAccountCubit>(context);
        return PopScope(
          canPop: cubit.isShowRecoveryPharseView,
          onPopInvoked: (didPop) {
            if (!cubit.isShowRecoveryPharseView) {
              cubit.updateView(
                  value: cubit.isShowRecoveryPharseView ? false : true);
            }
          },
          child: Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(14.h),
                  CommonAppbar(
                    onTapBack: () {
                      if (cubit.isShowRecoveryPharseView) {
                        Navigator.pop(context);
                      }
                      if (!cubit.isShowRecoveryPharseView) {
                        cubit.updateView(
                            value:
                                cubit.isShowRecoveryPharseView ? false : true);
                      }
                    },
                    title: AppStrings.createNewAccount,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cubit.isShowRecoveryPharseView
                                  ? const RecoveryParseView()
                                  : const CreateAccountFieldView(),
                          
                          height(25.h),
                        ],
                      ),
                    ),
                  ),
                  CommonButton(
                    name: 'Next',
                    onTap: () {
                      if (cubit.isShowRecoveryPharseView) {
                        cubit.cleanTextFiledData();
                        cubit.updateView(
                            value:
                                cubit.isShowRecoveryPharseView ? false : true);
                      } else {
                        if (cubit.formKey.currentState?.validate() ?? false) {
                          UserPreferences.setUserData(
                              value: cubit.createPasswordController.text);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.dashboardRoute,
                            (route) => false,
                          );
                        }
                      }
                    },
                  ),
                  height(10.h),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
