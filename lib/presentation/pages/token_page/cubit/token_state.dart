import 'package:flutter/cupertino.dart';

import '../../../../utils/enum/home_page_action_enum.dart';
import '../../market/cubit/market_cubit.dart';

@immutable
sealed class TokenState {}

class InitialTokenState extends TokenState {}

final class TabBarIndexState extends TokenState {
  final int index;
  TabBarIndexState({required this.index});
}

final class TradeOptionChnageState extends TokenState {
  final ActionEnum? value;
  TradeOptionChnageState({required this.value});
}


final class ChangeOverviewDropDown extends TokenState{
  final String value;
  ChangeOverviewDropDown({required this.value});
}


final class ChangeInfoDropDown1 extends TokenState{
  final CurrencyModel value;
  ChangeInfoDropDown1({required this.value});
}

final class ChangeInfoDropDown2 extends TokenState{
  final CurrencyModel value;
  ChangeInfoDropDown2({required this.value});
}

final class ExploreDropDownValueState extends TokenState{
  final String value;
  ExploreDropDownValueState({required this.value});
}
final class ChainDropDownValueState extends TokenState{
  final String value;
  ChainDropDownValueState({required this.value});
}