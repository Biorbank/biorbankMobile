import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_search_view.dart';
import 'package:biorbank/presentation/pages/auth/view/login_view.dart';
import 'package:biorbank/presentation/pages/auth/view/unlock_pin_view.dart';
import 'package:biorbank/presentation/pages/auth/view/welcome_view.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/defi_detail_screen.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/defi_navigation_screen.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/view/staking_defi_screen.dart';
import 'package:biorbank/presentation/pages/browser/view/browser_view.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_detail_screen.dart';
import 'package:biorbank/presentation/pages/chat/view/chat_view.dart';
import 'package:biorbank/presentation/pages/chat/view/send_money_view.dart';
import 'package:biorbank/presentation/pages/contacts_page/view/contact_view.dart';
import 'package:biorbank/presentation/pages/create_account/view/create_account_view.dart';
import 'package:biorbank/presentation/pages/dashboard/view/dashboard_view.dart';
import 'package:biorbank/presentation/pages/debit_card/view/debit_card_screen.dart';
import 'package:biorbank/presentation/pages/defi/view/defi_view.dart';
import 'package:biorbank/presentation/pages/feedback/view/feedback_screen.dart';
import 'package:biorbank/presentation/pages/help_center/view/help_center_screen.dart';
import 'package:biorbank/presentation/pages/home/view/home_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/connect_hardware_wallet_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/import_exsiting_account_view.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/view/new_account_create_view.dart';
import 'package:biorbank/presentation/pages/market/view/market_view.dart';
import 'package:biorbank/presentation/pages/nft/view/nft_screen.dart';
import 'package:biorbank/presentation/pages/nft/view/widget/nft_details.dart';
import 'package:biorbank/presentation/pages/nft_holding/view/nft_holding_view.dart';
import 'package:biorbank/presentation/pages/p2p/view/buy_screen.dart';
import 'package:biorbank/presentation/pages/p2p/view/buy_usdt_screen.dart';
import 'package:biorbank/presentation/pages/p2p/view/my_order_screen.dart';
import 'package:biorbank/presentation/pages/p2p/view/p2p_market_screen.dart';
import 'package:biorbank/presentation/pages/p2p/view/payment_process_screen.dart';
import 'package:biorbank/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/history/view/history_screen.dart';
import '../../presentation/pages/price_alert/view/price_alert_screen.dart';
import '../../presentation/pages/token_page/view/token_screen.dart';

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
          // AutoRoute(page: DefiRoute.page),
          AutoRoute(page: DefiDetailRoute.page,maintainState: false),
          AutoRoute(page: MarketRoute.page,maintainState: false),
          AutoRoute(page: DefiNavigationRoute.page,
          initial: true,
          maintainState: false,
           children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
              initial: true,
              maintainState: true
            ),
            AutoRoute(
              page: DefiDetailRoute.page,
              maintainState: false,
            ),
             AutoRoute(
              page: NftHoldingRoute.page,
              maintainState: false,
            ),

          ]),
          AutoRoute(page: BrowserRoute.page),
          AutoRoute(page: ChatRoute.page),
          AutoRoute(page: ContactRoute.page, maintainState: false),
          AutoRoute(page: FeedbackRoute.page, maintainState: false),
          AutoRoute(page: DebitCardRoute.page, maintainState: false),
          AutoRoute(page: PriceAlertRoute.page, maintainState: false),
          AutoRoute(page: HelpCenterRoute.page, maintainState: false),
          AutoRoute(page: P2pMarketRoute.page, maintainState: false),
          AutoRoute(page: HistoryRoute.page, maintainState: false),
        ]),

        AutoRoute(page: ImportExistingAccountRoute.page),
        AutoRoute(page: ConnectHardwareWalletRoute.page),
        AutoRoute(page: NewAccountCreateRoute.page),
        AutoRoute(page: CommonSearchRoute.page),
        AutoRoute(page: ChatDetailRoute.page),
        AutoRoute(page: SendMoneyRoute.page),
        AutoRoute(page: ContactRoute.page),
        AutoRoute(page: NftHoldingRoute.page),
        AutoRoute(page: StakingDefiRoute.page),
        AutoRoute(page: NFTRoute.page),
        AutoRoute(page: NFTDetailsRoute.page),
        // AutoRoute(page: P2pMarketRoute.page),
        AutoRoute(page: MyOrderRoute.page),
        AutoRoute(page: BuyUsdtRoute.page),
        AutoRoute(page: PaymentProcessRoute.page),
        AutoRoute(page: BuyRoute.page),
        AutoRoute(page: TokenRoute.page),

      ];
}
