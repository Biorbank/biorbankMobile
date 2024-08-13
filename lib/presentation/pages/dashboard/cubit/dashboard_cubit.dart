import 'package:biorbank/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(HomeInitialState());

  int selectedBottomTabIndex = 4;

  // List<Widget> bottomTabViews = [
  //   const DefiScreen(),
  //   const MarketScreen(),
  //   const BrowserScreen(),
  //   const ChatScreen(),
  //   const HomeScreen(),
  // ];

  bool isBackUp = true;

  void toggleBackUp({required bool value}) {
    isBackUp = value;
    emit(BackUp(isBackUp: value));
  }

  List<Map<String, dynamic>> navigationItems = [
    {
      'icon': Assets.imagesDefi,
      'active_icon': Assets.imagesDefiSelected,
      'title': 'DeFi'
    },
    {
      'icon': Assets.imagesChart,
      'active_icon': Assets.imagesChartSelected,
      'title': 'Market'
    },
    {
      'icon': Assets.imagesBrowser,
      'active_icon': Assets.imagesBrowserSelected,
      'title': 'Browser'
    },
    {
      'icon': Assets.imagesMessage,
      'active_icon': Assets.imagesMessageSelected,
      'title': 'Chat'
    },
  ];

  void onChnageBottomNavigationIndex({required int index}) {
    emit(BottomNavigationIndexChangeState(index: index));
  }
}
