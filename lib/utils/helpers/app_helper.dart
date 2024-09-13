import 'dart:io';
import 'package:biorbank/utils/service/wallet_store_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upgrader/upgrader.dart';

enum AppCommand {
  waiting,
  createWallet,
  backupSeedPhrase,
}

enum AppStatus {
  active,
  inactive,
}

class AppHelper {
  static late final String? _applicationPath;
  static late WalletStoreService walletService;
  static late final String? minAppVersion;
  // static final WalletSettingService walletsettingservice =
  //     WalletSettingService();
  static late final String appVersion;
  // static late final DeRecService deRecService;
  static AppCommand command = AppCommand.waiting;
  static AppStatus appStatus = AppStatus.active;
  static Future<String> _getMinimalAppVersion() async {
    return "2.0.0";
  }

  // static WalletAddressService walletservice = WalletAddressService();
  static Future<void> init() async {
    //
    // appVersion = (await SecureStorageManager.setString('appVersion')) ?? "1.0";

    // try {
    //   final upgrader = Upgrader();
    //   await upgrader.initialize();
    // } catch (e) {
    //   if(appVersion != upgrader.)
    // }
    walletService = await WalletStoreService.create();
    // deRecService = await DeRecService.create();

    Directory documentDirectory = await getApplicationDocumentsDirectory();
    _applicationPath = documentDirectory.path;
    minAppVersion = await _getMinimalAppVersion();
  }

  static String get appDir => _applicationPath ?? "";
}
