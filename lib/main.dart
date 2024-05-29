import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/utils/Theme/primary_theme.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/app_router.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/pages/create_account/cubit/create_account_cubit.dart';

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
      designSize:  Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (BuildContext context) => AuthCubit(),
            ),
            BlocProvider<CreateAccountCubit>(
              create: (BuildContext context) => CreateAccountCubit(),
            ),
          ],
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
