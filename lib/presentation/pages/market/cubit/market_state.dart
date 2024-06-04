part of 'market_cubit.dart';

@immutable
sealed class MarketState {}

final class MarketInitialState extends MarketState {}


final class ChangeTabBarIndexState extends MarketState{
  final int index;
ChangeTabBarIndexState({required this.index});
}