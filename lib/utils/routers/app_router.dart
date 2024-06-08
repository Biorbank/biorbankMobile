import 'package:biorbank/presentation/common/common_search_view.dart';
import 'package:biorbank/presentation/pages/auth/view/welcome_view.dart';
import 'package:biorbank/presentation/pages/auth/view/login_view.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_detail_screen.dart';
import 'package:biorbank/presentation/pages/chat/view/send_money_view.dart';
import 'package:biorbank/presentation/pages/create_account/view/create_account_view.dart';
import 'package:biorbank/presentation/pages/dashboard/view/dashboard_view.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/nft_holding_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/connect_hardware_wallet_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/import_exsiting_account_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/new_account_create_view.dart';
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
      case Routes.dashboardRoute:
        return MaterialPageRoute(
          builder: (_) => const DashboardView(),
        );
      case Routes.importExistingAccountRoute:
        return MaterialPageRoute(
          builder: (_) => const ImportExistingAccountView(),
        );
      case Routes.connectHardwareWalletRoute:
        return MaterialPageRoute(
          builder: (_) => const ConnectHardwareWalletView(),
        );
      case Routes.newAccountCreateRoute:
        return MaterialPageRoute(
          builder: (_) => const NewAccountCreateView(),
        );
      case Routes.nftHoldingRoute:
        return MaterialPageRoute(
          builder: (_) {
            String imageUrl = (settings.arguments as Map)['image_url'] ?? '';
            String title = (settings.arguments as Map)['title'] ?? '';
            return NftHoldingView(
              imageUrl: imageUrl,
              title: title,
            );
          },
        );
      case Routes.serachViewRoute:
        return MaterialPageRoute(
          builder: (_) => const CommonSearchView(),
        );
      case Routes.chatDetailRoute:
        return MaterialPageRoute(
          builder: (_) => const ChatDetailScreen(),
        );
      case Routes.sendMoneyRoute:
        return MaterialPageRoute(
          builder: (_) => const SendMoneyView(),
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
