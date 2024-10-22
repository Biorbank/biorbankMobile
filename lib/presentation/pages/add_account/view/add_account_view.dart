import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_appbar.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends State<AddAccountScreen> with Validation {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(14.h),
              CommonAppbar(
                onTapBack: () {
                  context.back();
                },
                title: AppStrings.createNewAccount,
              ),
              height(20.h),
              CommonTextfield(
                title: 'Account Name',
                hintText: 'Enter your account name',
                validator: (value) =>
                    nameValidation(value: value, slug: 'account'),
                onChanged: (value) {},
              ),
              Expanded(child: Container()),
              CommonButton(
                name: "Next",
                onTap: () async {},
              ),
              height(25.h),
            ],
          ),
        ),
      ),
    );
  }

  _buildArrow({
    required BuildContext context,
    required String icon,
    double? height,
    double? width,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        icon,
        height: height ?? 24.h,
        width: width ?? 24.w,
        color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
      ),
    );
  }
}
