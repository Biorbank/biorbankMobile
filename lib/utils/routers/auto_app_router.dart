import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_search_view.dart';
import 'package:biorbank/presentation/pages/auth/view/login_view.dart';
import 'package:biorbank/presentation/pages/auth/view/unlock_pin_view.dart';
import 'package:biorbank/presentation/pages/auth/view/welcome_view.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/defi_detail_screen.dart';
import 'package:biorbank/presentation/pages/browser/view/browser_view.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_detail_screen.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_view.dart';
import 'package:biorbank/presentation/pages/chat/view/send_money_view.dart';
import 'package:biorbank/presentation/pages/contacts_page/view/contact_view.dart';
import 'package:biorbank/presentation/pages/create_account/view/create_account_view.dart';
import 'package:biorbank/presentation/pages/dashboard/view/dashboard_view.dart';
import 'package:biorbank/presentation/pages/defi/view/defi_view.dart';
import 'package:biorbank/presentation/pages/home/view/home_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/connect_hardware_wallet_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/import_exsiting_account_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/new_account_create_view.dart';
import 'package:biorbank/presentation/pages/market/view/market_view.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/nft_holding_view.dart';
import 'package:biorbank/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

part 'auto_app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: SplashRoute.page,
        ),
        AutoRoute(path: '/welcome', page: WelcomeRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(page: UnlockPinRoute.page),
        AutoRoute(page: CreateAccountRoute.page),
        AutoRoute(path: '/dashboard', page: DashboardRoute.page, children: [
          AutoRoute(page: DefiRoute.page),
          AutoRoute(page: MarketRoute.page),
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: BrowserRoute.page),
          AutoRoute(page: ChatRoute.page),
          AutoRoute(page: ContactRoute.page),
          AutoRoute(page: DefiDetailRoute.page),
        ]),
        AutoRoute(page: ImportExistingAccountRoute.page),
        AutoRoute(page: ConnectHardwareWalletRoute.page),
        AutoRoute(page: NewAccountCreateRoute.page),
        AutoRoute(page: CommonSearchRoute.page),
        AutoRoute(page: ChatDetailRoute.page),
        AutoRoute(page: SendMoneyRoute.page),
        AutoRoute(page: ContactRoute.page),
        AutoRoute(page: NftHoldingRoute.page),
      ];
}
