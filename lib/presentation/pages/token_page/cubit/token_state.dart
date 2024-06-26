import 'package:biorbank/presentation/pages/token_page/model/currency_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/enum/home_page_action_enum.dart';

@immutable
sealed class TokenState {}

class InitialTokenState extends TokenState {}

final class TabBarIndexState extends TokenState {
  final int index;

  TabBarIndexState({required this.index});
}

final class TabCreateBTCIndexChangeState extends TokenState {
  final int index;

  TabCreateBTCIndexChangeState({required this.index});
}

final class TradeOptionChnageState extends TokenState {
  final ActionEnum? value;

  TradeOptionChnageState({required this.value});
}

final class ChangeOverviewDropDown extends TokenState {
  final String value;

  ChangeOverviewDropDown({required this.value});
}

final class ChangeCrossingDropDown extends TokenState {
  final String value;

  ChangeCrossingDropDown({required this.value});
}

final class ChangeCadDropDown extends TokenState {
  final String value;

  ChangeCadDropDown({required this.value});
}

final class ChangeInfoDropDown1 extends TokenState {
  final CurrencyModel2 value;

  ChangeInfoDropDown1({required this.value});
}

final class ChangeInfoDropDown2 extends TokenState {
  final CurrencyModel2 value;

  ChangeInfoDropDown2({required this.value});
}

final class ExploreDropDownValueState extends TokenState {
  final String value;

  ExploreDropDownValueState({required this.value});
}

final class ChainDropDownValueState extends TokenState {
  final String value;

  ChainDropDownValueState({required this.value});
}
