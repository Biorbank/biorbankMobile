import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_description_widget.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class BuyUsdtScreen extends StatelessWidget {
  const BuyUsdtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<P2pMarketCubit, P2pMarketState>(
        builder: (context, state) {
          var cubit = context.read<P2pMarketCubit>();
          if (state is PaymentMethodDropDownState) {
            cubit.currentPaymentMethod = state.paymentMethod;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonBlueContainer(
                  height: 104.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 25.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.router.back();
                          },
                          child: Image.asset(
                            Assets.imagesBackArrow,
                            height: 26.h,
                            width: 26.w,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: AppConstant.commonText('Buy USDT',
                                fontSize: 16.sp,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(20.h),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Theme.of(context).colorScheme.onSurface,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(2, 4),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.15))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 13,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryFixed,
                                        child: AppConstant.commonText('E',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                      ),
                                      width(10.w),
                                      AppConstant.commonText(
                                          'Elite Integrity Grp',
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow),
                                    ],
                                  ),
                                  Image.asset(
                                    Assets.imagesArrowRight,
                                    height: 18.h,
                                    width: 18.w,
                                    color: Theme.of(context).colorScheme.shadow,
                                  )
                                ],
                              ),
                              height(14.h),
                              AppConstant.commonDivider(),
                              height(14.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  commonTitleWidget(
                                      context: context,
                                      title: 'CS',
                                      value: '1.36'),
                                  commonTitleWidget(
                                      context: context,
                                      title: 'Ads Available',
                                      value: '0.977'),
                                  commonTitleWidget(
                                      context: context,
                                      title: 'Pay Within',
                                      value: '15 Minute(s)'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      height(25.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonDropdownWidget(
                              labelText: '',
                              value: cubit.currentPaymentMethod,
                              isExpanded: true,
                              borderRadius: 0,
                              arrowColor: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              dropDownContentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              backGroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.shadow,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                              items: cubit.paymentMethods
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: CachedNetworkImage(
                                                imageUrl: e.url,
                                                height: 20.h,
                                                width: 20.w,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    const SizedBox.shrink(),
                                              ),
                                            ),
                                            width(10.w),
                                            AppConstant.commonText(e.name,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .shadow),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                cubit.onChangePaymentMethod(payment: value);
                              },
                            ),
                            height(4.h),
                            CommonTextfield(
                              title: '',
                              borderRadius: 12.r,
                              hintText: 'Min. 400',
                              suffixWidget: Text.rich(TextSpan(
                                  text: 'CAD',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  children: [
                                    WidgetSpan(child: width(8.w)),
                                    TextSpan(
                                        text: 'Max',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .shadow))
                                  ])),
                            ),
                            height(6.h),
                            Text.rich(TextSpan(
                                text: 'Limit C\$400 - C\$1,900',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                                children: [
                                  WidgetSpan(child: width(8.w)),
                                  TextSpan(
                                      text: '3.000.000 USDT',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow))
                                ])),
                            height(20.h),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstant.commonText('Advertiser Terms',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                    height(6.h),
                                    commonDescriptionWidget(
                                        context: context,
                                        description:
                                            'Lorem ipsum dolor sit amet, sit vulputate contentiones ut, vis ei atqui maiorum, labores habemus nusquam ea nec. Eam falli moderatius ex, eu eos odio vivendum appellantur, ius ad altera deserunt. Sed legimus electram cu, tollit aliquando appellantur vix id. Instructior contentiones qui ea, duo diceret nominati et. Veri scripta vis at. Et ius case aeterno elaboraret, vidit invidunt dissentias quo an, nam vocibus maiestatis eu. Illud malorum adipiscing cu pro, has at unum clita singulis.')
                                  ],
                                ),
                              ),
                            ),
                            height(20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CommonButton(
                    name: 'Buy USDT with 0 Fees',
                    onTap: () {
                      context.router.push(const PaymentProcessRoute());
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget commonTitleWidget({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.commonText(title,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          height(6.h),
          AppConstant.commonText(value,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
