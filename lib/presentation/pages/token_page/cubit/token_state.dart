import 'package:flutter/cupertino.dart';

import '../../../../utils/enum/home_page_action_enum.dart';

@immutable
sealed class TokenState {}

class InitialTokenState extends TokenState {}

final class ChangeTabBarIndexState extends TokenState {
  final int index;
  ChangeTabBarIndexState({required this.index});
}

final class TradeOptionChnageState extends TokenState {
  final ActionEnum? value;
  TradeOptionChnageState({required this.value});
}


final class ChangeOverviewDropDown extends TokenState{
  final String value;
  ChangeOverviewDropDown({required this.value});
}

class CurrencyModel {
  final String url;
  final String name;
  CurrencyModel({required this.name, required this.url});
}

final class ChangeInfoDropDown1 extends TokenState{
  final CurrencyModel value;
  ChangeInfoDropDown1({required this.value});
}

final class ChangeInfoDropDown2 extends TokenState{
  final CurrencyModel value;
  ChangeInfoDropDown2({required this.value});
}

