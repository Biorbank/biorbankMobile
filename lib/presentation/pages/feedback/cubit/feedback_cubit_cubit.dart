import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'feedback_cubit_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(FeedbackInitial());

  bool isIncludedScreenshot = true;
  int notLikeTabIndex=0;
  List<Map<String, dynamic>> categoriesList = [
    {'title': "Protocol Request", 'value': 134},
    {'title': "Features", 'value': 54},
    {'title': "Protocol Request", 'value': 87},
    {'title': "Reported Bugs", 'value': 124},
    {'title': "Chain Request", 'value': 104},
  ];

  void toggleIncludedScreenshotSwitch({required bool value}) {
    emit(IncludedScreenshotState(value: value));
  }
  void changeNotLikeTabIndex({required int value}) {
    emit(ChangeNotLikeTabIndexState(index: value));
  }
}
