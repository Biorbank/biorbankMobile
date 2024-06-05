import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderWidget extends StatelessWidget {
  const RangeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        var cubit = context.read<MarketCubit>();
        if (state is RangeSliderState) {
          cubit.sliderValues = state.value!;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
                tooltipBackgroundColor: Theme.of(context).colorScheme.shadow,
                tooltipTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                inactiveLabelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w500),
                activeLabelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w500)),
            child: SfRangeSlider(
              enableTooltip: true,
              showLabels: true,
              startThumbIcon: Container(
                height: 8.h,
                width: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Container(
                  margin: const EdgeInsets.all(3.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              tooltipTextFormatterCallback: (actualValue, formattedText) =>
                  '$formattedText%',
              showDividers: true,
              stepSize: 25,
              labelFormatterCallback: (actualValue, formattedText) {
                return '$formattedText%';
              },
              endThumbIcon: Container(
                height: 8.h,
                width: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Container(
                  margin: const EdgeInsets.all(3.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              //shouldAlwaysShowTooltip: true,

              activeColor: Theme.of(context).colorScheme.onPrimary,
              inactiveColor: Theme.of(context).colorScheme.onPrimaryContainer,
              thumbShape: const SfThumbShape(),
              values: cubit.sliderValues,
              onChanged: (value) {
                cubit.onChangeRangeSliderValue(value: value);
              },
              min: 0.0,
              max: 100,
              interval: 25,
              dragMode: SliderDragMode.onThumb,
              minorTicksPerInterval: 0,
            ),
          ),
        );
      },
    );
  }
}
