

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitialState());

  int tabIndex=0;


  void changeTabIndex({required int index}){
    emit(ContactTabIndexChangeState(index: index));
  }


}