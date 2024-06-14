import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(HelpCenterInitial());
}
