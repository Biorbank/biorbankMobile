import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'pay_bills_state.dart';

class PayBillsCubit extends Cubit<PayBillsState> {
  PayBillsCubit() : super(PayBillsInitialState());


  String? formattedDate;
  DateTime? selectedDate;
  String formatDate({required DateTime date}){
    String formattedDate = DateFormat('MMM dd, yyyy').format(date);
    emit(FormattedDateState(dateTime: formattedDate));
   return formattedDate;
  }

  
}
