import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/presentation/pages/splash/splash_view.dart';
import 'package:biorbank/utils/Theme/primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = PrimaryTheme().primaryTheme;
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(),
      ),
    ], child: MaterialApp(
        title: 'Biorbank',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: theme,
        home: SplashScreen()));
  }
}
