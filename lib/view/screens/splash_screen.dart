import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_pattern.dart';
import 'package:food_ninja/view/screens/onboarding/onboarding_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen1()));
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackGroundPatternWidget(),
          Center(
            child: Image.asset('assets/Logo1.png'),
          )
        ],
      ),
    );
  }
}
