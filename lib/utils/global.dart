import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Global {
  static List<String> recoveryPhraseList = [
    'sample',
    'give',
    'route',
    'vast',
    'urban',
    'borrow',
    'muscle',
    'catch',
    'grass',
    'main',
    'answer',
    'lazy'
  ];
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static final AdvancedDrawerController controller = AdvancedDrawerController();
  static bool drawerOpen = false;
}
