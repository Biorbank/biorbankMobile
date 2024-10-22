import 'dart:convert';
import 'dart:io';

import 'package:biorbank/utils/Theme/primary_theme.dart';
import 'package:biorbank/utils/bloc_provider_binding.dart';
import 'package:biorbank/utils/db/db_wallet.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:biorbank/utils/service/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:is_first_run/is_first_run.dart';

Future<void> copyAssets(String assetPath) async {
  // const assetPath = '/assets/img/cryptoicons';

  // Create the folder if it does not exist
  final myFolder = Directory(AppHelper.appDir + assetPath);
  if (!await myFolder.exists()) {
    await myFolder.create(recursive: true);
    String assetsPath = await rootBundle.loadString('AssetManifest.json');
    Map<String, dynamic> manifestMap = json.decode(assetsPath);
    List<String> paths = manifestMap.keys.toList();
    for (String path in paths) {
      File newFile = File('${AppHelper.appDir}/$path');
      if (!await newFile.exists()) {
        ByteData data = await rootBundle.load(path);
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await newFile.create(recursive: true);
        await newFile.writeAsBytes(bytes);
      }
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupPreferences();
  await setupDatabase();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  bool isFirstRun = await IsFirstRun.isFirstRun();
  if (isFirstRun) {
    // clear auth storage
    // PrefixSecureStorageManager secureStorageManager =
    //     PrefixSecureStorageManager("authBox");
    // await secureStorageManager.clearAll();

    // clear wallet storage
    // PrefixSecureStorageManager walletStorageManager =
    //     PrefixSecureStorageManager("walletBox_v2");
    // await walletStorageManager.clearAll();
  }
  await AppHelper.init();
  await copyAssets('/assets/img/cryptoicons');

  CryptoDBRepositoryImpl db = CryptoDBRepositoryImpl.create();

  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.db});
  final _appRouter = AppRouter();
  final CryptoDBRepositoryImpl db;

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = PrimaryTheme().primaryTheme;
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProviderList(
        db: db,
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: 'Biorbank',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: theme,

          // initialRoute: Routes.initialRoute,
          // onGenerateRoute: AppAllRouter.generateRoute,
        ),
      ),
    );
  }
}
