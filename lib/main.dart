import 'package:biorbank/utils/Theme/primary_theme.dart';
import 'package:biorbank/utils/bloc_provider_binding.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/app_router.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupPreferences();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = PrimaryTheme().primaryTheme;
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProviderList(
          child: MaterialApp(
        title: 'Biorbank',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: theme,
        initialRoute: Routes.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      )),
    );
  }
}
