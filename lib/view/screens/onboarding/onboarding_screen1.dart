import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset(
              'assets/dark_mode/onboarding/Illustartion-1.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 200,
              child: Text(
                'Find your  Comfort Food here',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 280,
              child: Text(
                'Here You Can find a chef or dish for every taste and color.Enjoy!',
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
                Navigator.of(context).pushReplacementNamed('onboarding2');
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
