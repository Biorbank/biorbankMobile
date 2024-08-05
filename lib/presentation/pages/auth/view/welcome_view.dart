import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/auth/widgets/common_topview.dart';
import 'package:biorbank/presentation/pages/create_account/cubit/create_account_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trustdart/trustdart.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void generateTrustMnemonic(
      {required CreateAccountCubit cubit,
      required BuildContext context}) async {
    String result = await Trustdart.generateMnemonic("");
    cubit.setMnemonic(value: result);
    context.router.push(const CreateAccountRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountCubit, CreateAccountState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CreateAccountCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    height(20.h),
                    const AppTopView(),
                    height(25.h),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(Assets.imagesWelcomeImage),
                        CommonButton(
                          name: "Create New Account",
                          onTap: () {
                            generateTrustMnemonic(
                                cubit: cubit, context: context);
                            // context.router.push(const CreateAccountRoute());

                            // Navigator.pushNamed(context, Routes.createAccountRoute);
                          },
                        )
                      ],
                    ),
                    height(15),
                    CommonButton(
                      name: "Import an Existing Account",
                      buttonColor: Theme.of(context).colorScheme.errorContainer,
                      textColor: Theme.of(context).colorScheme.shadow,
                      onTap: () {
                        context.router.push(const ImportExistingAccountRoute());

                        // Navigator.pushNamed(
                        //     context, Routes.importExistingAccountRoute);
                      },
                    ),
                    height(15),
                    CommonButton(
                      name: "Cold Storage",
                      buttonColor: Theme.of(context).colorScheme.errorContainer,
                      textColor: Theme.of(context).colorScheme.shadow,
                      onTap: () {
                        context.router.push(const TokenRoute());
                      },
                    ),
                    height(10),
                    bottomOrWidget(),
                    height(10),
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            name: "Google",
                            image: Assets.imagesGoogle,
                            buttonColor:
                                Theme.of(context).colorScheme.errorContainer,
                            textColor: Theme.of(context).colorScheme.shadow,
                          ),
                        ),
                        width(15),
                        Expanded(
                          child: CommonButton(
                            name: "Twitter",
                            image: Assets.imagesTwitter,
                            buttonColor:
                                Theme.of(context).colorScheme.errorContainer,
                            textColor: Theme.of(context).colorScheme.shadow,
                          ),
                        ),
                      ],
                    ),
                    height(10),
                    bottomSignInWidget(),
                    height(10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bottomOrWidget() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AppConstant.commonDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AppConstant.commonText("or continue",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          Expanded(
            child: AppConstant.commonDivider(),
          ),
        ],
      ),
    );
  }

  bottomSignInWidget() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Already Have an Account? ',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 14.sp),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.push(const LoginRoute());
                // Navigator.pushNamed(context, Routes.loginScreenRoute);
              },
            text: 'Login',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
