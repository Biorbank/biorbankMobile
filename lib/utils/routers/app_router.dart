import 'package:biorbank/presentation/pages/auth/view/welcome_view.dart';
import 'package:biorbank/presentation/pages/auth/view/login_view.dart';
import 'package:biorbank/presentation/pages/create_account/view/create_account_view.dart';
import 'package:biorbank/presentation/pages/home/view/home_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/connect_hardware_wallet_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/import_exsiting_account_view.dart';
import 'package:biorbank/presentation/pages/splash/splash_view.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/auth/view/unlock_pin_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.welcomeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );

      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.pinScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const UnlockPinView(),
        );
      case Routes.createAccountRoute:
        return MaterialPageRoute(
          builder: (_) => const CreateAccountView(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.importExistingAccountRoute:
        return MaterialPageRoute(
          builder: (_) => const ImportExistingAccountView(),
        );
      case Routes.connectHardwareWalletRoute:
        return MaterialPageRoute(
          builder: (_) => const ConnectHardwareWalletView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
