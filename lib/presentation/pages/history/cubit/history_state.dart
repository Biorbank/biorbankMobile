import 'package:flutter/material.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitialState extends HistoryState {}

final class ChangeFilterLoadingState extends HistoryState {}

final class ChangeFilterValueState extends HistoryState {
  final String value;
  ChangeFilterValueState({required this.value});
}
