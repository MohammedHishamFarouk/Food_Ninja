import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset(
              'assets/dark_mode/onboarding/Illustration-2.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 330,
              child: Text(
                'Food Ninja is Where Your Comfort Food Lives',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 250,
              child: Text(
                'Enjoy a fast and smooth food delivery at your doorstep',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            GreenButtonWidget(
              text: 'Next',
              height: 60,
              width: 160,
              onTap: () {
                Navigator.of(context).pushReplacementNamed('login');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
