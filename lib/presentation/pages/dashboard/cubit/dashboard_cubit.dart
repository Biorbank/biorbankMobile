import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/pages/browser/view/browser_view.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_view.dart';
import 'package:biorbank/presentation/pages/defi/view/defi_view.dart';
import 'package:biorbank/presentation/pages/home/view/home_view.dart';
import 'package:biorbank/presentation/pages/market/view/market_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(HomeInitialState());

  int selectedBottomTabIndex = 4;

  List<Widget> bottomTabViews = [
    const DefiScreen(),
    const MarketScreen(),
    const BrowserScreen(),
    const ChatScreen(),
    const HomeScreen(),
  ];

  List<Map<String, dynamic>> navigationItems = [
    {
      'icon': Assets.imagesdefi,
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
