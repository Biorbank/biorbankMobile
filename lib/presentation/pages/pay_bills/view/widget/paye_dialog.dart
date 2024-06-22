import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayeDialog extends StatelessWidget {
  const PayeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(10.h),
                      Row(
                        children: [
                          width(40.w),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: AppConstant.commonText('Paye',
                                  fontSize: 14.sp,
                                  textAlign: TextAlign.right,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ))
                        ],
                      ),
                      height(12.h),
                      const CommonTextfield(
                        title: 'The Rent',
                        hintText: '65562314656262',
                      ),
                      height(6.h),
                      AppConstant.commonDivider(),
                      height(10.h),
                      const CommonTextfield(
                        title: 'Videotron Ltee',
                        hintText: '65562314656262',
                      ),
                      height(6.h),
                      AppConstant.commonDivider(),
                      height(10.h),
                      const CommonTextfield(
                        title: 'The Rent',
                        hintText: '65562314656262',
                      ),
                      height(6.h),
                      AppConstant.commonDivider(),
                      height(10.h),
                      const CommonTextfield(
                        title: 'Videotron Ltee',
                        hintText: '65562314656262',
                      ),
                      height(12.h),
                      CommonButton(
                        name: 'Add paye',
                        onTap: () {},
                      ),
                      height(15.h),
                    ]))));
  }
}
