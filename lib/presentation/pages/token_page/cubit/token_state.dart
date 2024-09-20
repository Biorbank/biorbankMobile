import 'package:biorbank/presentation/pages/token_page/model/currency_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/enum/home_page_action_enum.dart';

@immutable
sealed class TokenState {}

class InitialTokenState extends TokenState {}

//TabBar Screen
final class TabBarIndexState extends TokenState {
  final int index;

  TabBarIndexState({required this.index});
}

// OverView Tab Screen
final class ChangeOverviewDropDown extends TokenState {
  final String value;

  ChangeOverviewDropDown({required this.value});
}

final class TradeOptionChnageState extends TokenState {
  final ActionEnum? value;

  TradeOptionChnageState({required this.value});
}

// Info Tab Screen
final class ChangeInfoDropDown1 extends TokenState {
  final CurrencyModel2 value;

  ChangeInfoDropDown1({required this.value});
}

final class ChangeInfoDropDown2 extends TokenState {
  final CurrencyModel2 value;

  ChangeInfoDropDown2({required this.value});
}

// Social Tab Screen
final class ExploreDropDownValueState extends TokenState {
  final String value;

  ExploreDropDownValueState({required this.value});
}

final class ChainDropDownValueState extends TokenState {
  final String value;

  ChainDropDownValueState({required this.value});
}

// Create Alert on BTC popup

final class ChangeCrossingDropDown extends TokenState {
  final String value;

  ChangeCrossingDropDown({required this.value});
}

final class ChangeCadDropDown extends TokenState {
  final String value;

  ChangeCadDropDown({required this.value});
}

final class TabCreateBTCIndexChangeState extends TokenState {
  final int index;

  TabCreateBTCIndexChangeState({required this.index});
}

final class SelectedTimeState extends TokenState {
  final String time;

  SelectedTimeState({required this.time});
}
