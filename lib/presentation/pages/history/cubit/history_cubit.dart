import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitialState());

  final List<String> transactionTypes = [
    'Send',
    'Receive',
    'Swap',
    'Purchase',
    'Sell',
    'Increased wallet balance',
    'Decreased wallet balance',
  ];
  String selectedValue = "Send";

  final minimumPerTransCtrl = TextEditingController();

  changeFilterValue({required String value}) {
    emit(ChangeFilterLoadingState());
    emit(ChangeFilterValueState(value: value));
  }
}
