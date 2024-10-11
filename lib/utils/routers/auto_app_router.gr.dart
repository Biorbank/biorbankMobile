// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AssetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AssetPage(),
      );
    },
    BrowserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BrowserScreen(),
      );
    },
    BuyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BuyScreen(),
      );
    },
    BuyUsdtRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BuyUsdtScreen(),
      );
    },
    ChatDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatDetailScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    CommonSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommonSearchScreen(),
      );
    },
    ConnectHardwareWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConnectHardwareWalletScreen(),
      );
    },
    ContactRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactScreen(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateAccountScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    DebitCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DebitCardScreen(),
      );
    },
    DefiDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DefiDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DefiDetailScreen(
          key: args.key,
          index: args.index,
        ),
      );
    },
    DefiNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefiNavigationScreen(),
      );
    },
    DefiRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefiScreen(),
      );
    },
    FeedbackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedbackScreen(),
      );
    },
    HelpCenterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpCenterScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ImportExistingAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImportExistingAccountScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MarketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MarketScreen(),
      );
    },
    MyAccountsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyAccountsWidget(),
      );
    },
    MyOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyOrderScreen(),
      );
    },
    NFTDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NFTDetailsPage(),
      );
    },
    NFTRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NFTScreen(),
      );
    },
    NewAccountCreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewAccountCreateScreen(),
      );
    },
    NftHoldingRoute.name: (routeData) {
      final args = routeData.argsAs<NftHoldingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NftHoldingScreen(
          key: args.key,
          imageUrl: args.imageUrl,
          title: args.title,
        ),
      );
    },
    P2pMarketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const P2pMarketScreen(),
      );
    },
    PaymentProcessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentProcessScreen(),
      );
    },
    PriceAlertRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PriceAlertScreen(),
      );
    },
    SendMoneyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendMoneyScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StakingDefiRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StakingDefiScreen(),
      );
    },
    TokenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TokenScreen(),
      );
    },
    UnlockPinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnlockPinScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AssetPage]
class AssetRoute extends PageRouteInfo<void> {
  const AssetRoute({List<PageRouteInfo>? children})
      : super(
          AssetRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BrowserScreen]
class BrowserRoute extends PageRouteInfo<void> {
  const BrowserRoute({List<PageRouteInfo>? children})
      : super(
          BrowserRoute.name,
          initialChildren: children,
        );

  static const String name = 'BrowserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BuyScreen]
class BuyRoute extends PageRouteInfo<void> {
  const BuyRoute({List<PageRouteInfo>? children})
      : super(
          BuyRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BuyUsdtScreen]
class BuyUsdtRoute extends PageRouteInfo<void> {
  const BuyUsdtRoute({List<PageRouteInfo>? children})
      : super(
          BuyUsdtRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyUsdtRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatDetailScreen]
class ChatDetailRoute extends PageRouteInfo<void> {
  const ChatDetailRoute({List<PageRouteInfo>? children})
      : super(
          ChatDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CommonSearchScreen]
class CommonSearchRoute extends PageRouteInfo<void> {
  const CommonSearchRoute({List<PageRouteInfo>? children})
      : super(
          CommonSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommonSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConnectHardwareWalletScreen]
class ConnectHardwareWalletRoute extends PageRouteInfo<void> {
  const ConnectHardwareWalletRoute({List<PageRouteInfo>? children})
      : super(
          ConnectHardwareWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectHardwareWalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactScreen]
class ContactRoute extends PageRouteInfo<void> {
  const ContactRoute({List<PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateAccountScreen]
class CreateAccountRoute extends PageRouteInfo<void> {
  const CreateAccountRoute({List<PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DebitCardScreen]
class DebitCardRoute extends PageRouteInfo<void> {
  const DebitCardRoute({List<PageRouteInfo>? children})
      : super(
          DebitCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DebitCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DefiDetailScreen]
class DefiDetailRoute extends PageRouteInfo<DefiDetailRouteArgs> {
  DefiDetailRoute({
    Key? key,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          DefiDetailRoute.name,
          args: DefiDetailRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'DefiDetailRoute';

  static const PageInfo<DefiDetailRouteArgs> page =
      PageInfo<DefiDetailRouteArgs>(name);
}

class DefiDetailRouteArgs {
  const DefiDetailRouteArgs({
    this.key,
    required this.index,
  });

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'DefiDetailRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [DefiNavigationScreen]
class DefiNavigationRoute extends PageRouteInfo<void> {
  const DefiNavigationRoute({List<PageRouteInfo>? children})
      : super(
          DefiNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DefiNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DefiScreen]
class DefiRoute extends PageRouteInfo<void> {
  const DefiRoute({List<PageRouteInfo>? children})
      : super(
          DefiRoute.name,
          initialChildren: children,
        );

  static const String name = 'DefiRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedbackScreen]
class FeedbackRoute extends PageRouteInfo<void> {
  const FeedbackRoute({List<PageRouteInfo>? children})
      : super(
          FeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedbackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpCenterScreen]
class HelpCenterRoute extends PageRouteInfo<void> {
  const HelpCenterRoute({List<PageRouteInfo>? children})
      : super(
          HelpCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpCenterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImportExistingAccountScreen]
class ImportExistingAccountRoute extends PageRouteInfo<void> {
  const ImportExistingAccountRoute({List<PageRouteInfo>? children})
      : super(
          ImportExistingAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImportExistingAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MarketScreen]
class MarketRoute extends PageRouteInfo<void> {
  const MarketRoute({List<PageRouteInfo>? children})
      : super(
          MarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyAccountsWidget]
class MyAccountsRoute extends PageRouteInfo<void> {
  const MyAccountsRoute({List<PageRouteInfo>? children})
      : super(
          MyAccountsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyOrderScreen]
class MyOrderRoute extends PageRouteInfo<void> {
  const MyOrderRoute({List<PageRouteInfo>? children})
      : super(
          MyOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NFTDetailsPage]
class NFTDetailsRoute extends PageRouteInfo<void> {
  const NFTDetailsRoute({List<PageRouteInfo>? children})
      : super(
          NFTDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NFTDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NFTScreen]
class NFTRoute extends PageRouteInfo<void> {
  const NFTRoute({List<PageRouteInfo>? children})
      : super(
          NFTRoute.name,
          initialChildren: children,
        );

  static const String name = 'NFTRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewAccountCreateScreen]
class NewAccountCreateRoute extends PageRouteInfo<void> {
  const NewAccountCreateRoute({List<PageRouteInfo>? children})
      : super(
          NewAccountCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewAccountCreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NftHoldingScreen]
class NftHoldingRoute extends PageRouteInfo<NftHoldingRouteArgs> {
  NftHoldingRoute({
    Key? key,
    required String imageUrl,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          NftHoldingRoute.name,
          args: NftHoldingRouteArgs(
            key: key,
            imageUrl: imageUrl,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'NftHoldingRoute';

  static const PageInfo<NftHoldingRouteArgs> page =
      PageInfo<NftHoldingRouteArgs>(name);
}

class NftHoldingRouteArgs {
  const NftHoldingRouteArgs({
    this.key,
    required this.imageUrl,
    required this.title,
  });

  final Key? key;

  final String imageUrl;

  final String title;

  @override
  String toString() {
    return 'NftHoldingRouteArgs{key: $key, imageUrl: $imageUrl, title: $title}';
  }
}

/// generated route for
/// [P2pMarketScreen]
class P2pMarketRoute extends PageRouteInfo<void> {
  const P2pMarketRoute({List<PageRouteInfo>? children})
      : super(
          P2pMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'P2pMarketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentProcessScreen]
class PaymentProcessRoute extends PageRouteInfo<void> {
  const PaymentProcessRoute({List<PageRouteInfo>? children})
      : super(
          PaymentProcessRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentProcessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PriceAlertScreen]
class PriceAlertRoute extends PageRouteInfo<void> {
  const PriceAlertRoute({List<PageRouteInfo>? children})
      : super(
          PriceAlertRoute.name,
          initialChildren: children,
        );

  static const String name = 'PriceAlertRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SendMoneyScreen]
class SendMoneyRoute extends PageRouteInfo<void> {
  const SendMoneyRoute({List<PageRouteInfo>? children})
      : super(
          SendMoneyRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendMoneyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StakingDefiScreen]
class StakingDefiRoute extends PageRouteInfo<void> {
  const StakingDefiRoute({List<PageRouteInfo>? children})
      : super(
          StakingDefiRoute.name,
          initialChildren: children,
        );

  static const String name = 'StakingDefiRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TokenScreen]
class TokenRoute extends PageRouteInfo<void> {
  const TokenRoute({List<PageRouteInfo>? children})
      : super(
          TokenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TokenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UnlockPinScreen]
class UnlockPinRoute extends PageRouteInfo<void> {
  const UnlockPinRoute({List<PageRouteInfo>? children})
      : super(
          UnlockPinRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnlockPinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
