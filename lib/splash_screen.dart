import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/home_page.dart';
import 'package:project/main.dart';
import 'package:project/onboarding_screen.dart';
import 'package:project/styles/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = auth.currentUser;

  @override
  void initState() {
    super.initState();

    debugPrint(user.toString());

    if (user != null) {
      Timer(const Duration(milliseconds: 5000), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomePage(callbackIndex: 0,)),
            (route) => false);
      });
    } else {
      Timer(const Duration(milliseconds: 5000), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const OnboardingScreen()),
            (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          AppAssets.icLogo,
          height: 128,
          width: 128,
        ),
      ),
    );
  }
}
