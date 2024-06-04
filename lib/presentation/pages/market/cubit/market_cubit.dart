

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'market_state.dart';
class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketInitialState());

  TextEditingController searchTextController =TextEditingController();

  int selectedTabIndex=0;


  void onChangeTabIndex({required int index}){
    emit(ChangeTabBarIndexState(index: index));
  }
}