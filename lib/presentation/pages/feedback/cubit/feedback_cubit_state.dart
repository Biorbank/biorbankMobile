part of 'feedback_cubit_cubit.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}
final class IncludedScreenshotState extends FeedbackState {
  final bool value;
  IncludedScreenshotState({required this.value});
}
final class ChangeNotLikeTabIndexState extends FeedbackState {
  final int index;
  ChangeNotLikeTabIndexState({required this.index});
}
