import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/auth/widgets/common_topview.dart';
import 'package:biorbank/presentation/pages/splash/splash_view.dart';
import 'package:biorbank/utils/Theme/app_colors.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              height(20),
              const AppTopView(),
              height(25),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(Assets.imagesWelcomeImage),
                  const CommonButton(name: "Create New Account",)
                ],
              ),
              height(15),
              CommonButton(name: "Import an Existing Account",buttonColor: Theme.of(context).colorScheme.errorContainer,textColor: Theme.of(context).colorScheme.shadow,),
              height(15),
              CommonButton(name: "Cold Storage",buttonColor: Theme.of(context).colorScheme.errorContainer,textColor: Theme.of(context).colorScheme.shadow,),
              height(10),
              bottomOrWidget(),
              height(10),
              Row(
                children: [
                  Expanded(child: CommonButton(name: "Google",image: Assets.imagesGoogle,buttonColor: Theme.of(context).colorScheme.errorContainer,textColor: Theme.of(context).colorScheme.shadow,),),
                  width(15),
                  Expanded(child: CommonButton(name: "Twitter",image: Assets.imagesTwitter,buttonColor: Theme.of(context).colorScheme.errorContainer,textColor: Theme.of(context).colorScheme.shadow,),),
                ],
              ),
              height(10),
              bottomSignInWidget(),
              height(10),
            ],
          ),
        ),
      ),
    );
  }


  bottomOrWidget(){
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: AppConstant.commonDivider(),),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 15),child: AppConstant.commonText("or continue",color: AppColors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
          Expanded(child: AppConstant.commonDivider(),),
        ],
      ),
    );
  }

  bottomSignInWidget(){
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Already Have an Account? ',
            style: TextStyle(fontWeight: FontWeight.w400,color: AppColors.grey),
          ),
          TextSpan(
            text: 'Login',
            style: TextStyle(fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }

}
