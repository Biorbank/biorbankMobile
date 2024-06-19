import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_outlined_button.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/widget/fill_amount_dialog.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressDialog extends StatelessWidget {
  const AddAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  AppConstant.commonText('Choose Address',
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
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        )),
                  )
                ],
              ),
              AppConstant.commonText('To',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.shadow),
              const CommonTextfield(
                title: '',
                hintText: 'Recipient address',
              ),
              height(12.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppConstant.commonText('CONTACT NAME',
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, 8),
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 22,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -6),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 22,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        AppConstant.commonText('LAST UPDATED',
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, 8),
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 22,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -6),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 22,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                title: AppConstant.commonText('Goatskey',
                    color: Theme.of(context).colorScheme.shadow),
                subtitle: AppConstant.commonText('EVM1:0xa1e..800496',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 12.sp),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppConstant.commonText('2023/12/29',
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 12.sp),
                    AppConstant.commonText('13:49',
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 12.sp),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: CommonOutlinedButton(
                          height: 48,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: 'Cancel')),
                  width(12.w),
                  Expanded(
                    child: CommonButton(
                      name: 'Next',
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => const FillAmountDialog(isShowPriceDetails: false,),
                        );
                      },
                    ),
                  )
                ],
              ),
              height(16.h)
            ],
          ),
        ));
  }
}
