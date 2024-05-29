import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/utils/preferences.dart';
import 'package:biorbank/utils/routers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        String userData = UserPreferences.getUserData();
        if (userData.isNotEmpty) {
       Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);
        } else {
          Navigator.pushReplacementNamed(context, Routes.welcomeScreenRoute);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E31B7), Color(0xFF1C1460)],
            // Adjust the colors to match your design
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(Assets.svgsSplashIcon),
        ),
      ),
    );
  }
}
