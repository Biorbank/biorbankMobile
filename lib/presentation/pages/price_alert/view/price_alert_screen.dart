import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/pages/price_alert/cubit/price_alert_cubit.dart';
import 'package:biorbank/presentation/pages/price_alert/cubit/price_alert_state.dart';
import 'package:biorbank/presentation/pages/price_alert/view/widget/price_alert_list_tile_widget.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_widgets.dart';

@RoutePage()
class PriceAlertScreen extends StatelessWidget {
  const PriceAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceAlertCubit, PriceAlertState>(
      builder: (context, state) {
        // var cubit = context.read<PriceAlertCubit>();
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          body: Column(
            children: [
              height(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Global.controller.showDrawer();
                        // Global.scaffoldKey.currentState?.openDrawer();
                        Navigator.of(context).pop();
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 50),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          // Icons.sort,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                      ),
                    ),
                    width(MediaQuery.of(context).size.width * 0.25),
                    AppConstant.commonText(
                      "Price Alert",
                      color: Theme.of(context).colorScheme.shadow,
                      fontSize: 18.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              height(15),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PriceAlertListTileWidget(
                      img:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png",
                      title: "\$BTC",
                      titleType: "Bitcoin",
                      subTitle: "MOON alert",
                      type: "BTC",
                      amount: "\$50,998.40",
                      onTap: () {},
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 16.h,
                  bottom: 24.h,
                ),
                color: Theme.of(context).colorScheme.onSurface,
                child: CommonButton(
                  name: "Add new price alert",
                  onTap: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
