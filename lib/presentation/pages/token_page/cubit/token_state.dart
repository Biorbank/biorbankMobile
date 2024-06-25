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
