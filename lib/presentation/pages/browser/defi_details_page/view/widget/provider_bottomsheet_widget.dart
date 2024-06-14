import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderBottomsheetWidget extends StatelessWidget {
  const ProviderBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DefiDetailCubit, DefiDetailState>(
      builder: (context, state) {
        var cubit=context.read<DefiDetailCubit>();
        if(state is SelectedProviderState){
          cubit.selectedProvider=state.index;
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    height(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstant.commonText('Providers',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.shadow),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_outlined,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        )
                      ],
                    ),
                    height(12.h),
                    AppConstant.commonText('Active',
                        fontSize: 12.sp,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    height(10.h),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => height(10.h),
                        itemCount: 10,
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            cubit.onSelectProviderState(index: index);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 44.h,
                                    width: 44.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer),
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://cdn-images-1.medium.com/max/1200/1*IU4pmuywV8Dsqy0dBg6-DA.png',
                                        height: 24.h,
                                        placeholder: (context, url) =>
                                            const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                  width(12.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppConstant.commonText('Trust Nodes',
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow),
                                      height(4.h),
                                      Row(
                                        children: [
                                          AppConstant.commonText('APR',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer),
                                          width(8.w),
                                          AppConstant.commonText('12.5%',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onInverseSurface),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Visibility(
                                visible: cubit.selectedProvider==index,
                                child: Image.asset(
                                  Assets.imagesTickCircle,
                                  height: 24.h,
                                  width: 24.w,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    height(15.h)
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, -4),
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryFixedVariant
                            .withOpacity(0.12))
                  ]),
              child: CommonButton(
                name: 'Confirm',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
