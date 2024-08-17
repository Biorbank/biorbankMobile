import 'package:biorbank/utils/Theme/primary_theme.dart';
import 'package:biorbank/utils/bloc_provider_binding.dart';
import 'package:biorbank/utils/db/db_wallet.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupPreferences();
  await setupDatabase();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = PrimaryTheme().primaryTheme;
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProviderList(
          child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Biorbank',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: theme,
        // initialRoute: Routes.initialRoute,
        // onGenerateRoute: AppAllRouter.generateRoute,
      )),
    );
  }
}
