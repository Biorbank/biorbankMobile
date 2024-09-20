part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class HomeInitialState extends DashboardState {}

final class BottomNavigationIndexChangeState extends DashboardState {
  final int index;

  BottomNavigationIndexChangeState({required this.index});
}

final class BackUp extends DashboardState {
  final bool isBackUp;

  BackUp({required this.isBackUp});
}
