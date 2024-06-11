
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part  'defi_detail_state.dart';

class DefiDetailCubit extends Cubit<DefiDetailState> {
  DefiDetailCubit() : super(DefiDetailInitialState());

  int selectedTabIndex=0;
  int selectedLoanTabIndex=0;


  void onChangeTabIndex({required int index}){

    emit(DefiDetailTabIndexChange(index: index));
  }
  void onChangeLoanTabIndex({required int index}){

    emit(DefiDetailLoanTabIndexChange(index: index));
  }
}