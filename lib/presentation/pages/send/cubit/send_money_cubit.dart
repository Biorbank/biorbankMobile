import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'send_money_state.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit() : super(SendMoneyInitial());

  int sendTabIndex = 0;
  String? selectedAccount;
  String? selectedReceipent;
  int activeStepIndex = 0;
  List<String> accountList = ['Account 1', 'Account 2', 'Account 3'];
  List<String> receipentList = ['Receipent 1', 'Receipent 2', 'Receipent 3'];
  TextEditingController recipientAddressController = TextEditingController();
  TextEditingController withdrawAmountController = TextEditingController();

  void onChangeTabIndex({required int index}) {
    emit(SendMoneyTabIndexState(index: index));
  }

  void onChangeAccount({required String value}) {
    emit(SelectedAccountState(account: value));
  }

  void onChangeReceipent({required String value}) {
    emit(SelectedReceipentState(account: value));
  }

  void onChangeStepperIndex({required int index}) {
    emit(StepperIndexState(index: index));
  }
}
