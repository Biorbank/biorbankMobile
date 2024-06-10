
part of 'defi_detail_cubit.dart';

@immutable
sealed class DefiDetailState {}

final class DefiDetailInitialState extends DefiDetailState {}
final class DefiDetailTabIndexChange extends DefiDetailState {
  final int index;
  DefiDetailTabIndexChange({required this.index});
}
