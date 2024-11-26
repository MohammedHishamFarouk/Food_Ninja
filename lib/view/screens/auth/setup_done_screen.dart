import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_pattern.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/core/style/color_manager.dart';

class SetupDoneScreen extends StatelessWidget {
  const SetupDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundPatternWidget(),
          Center(
            child: Column(
              children: [
                const Spacer(flex: 3),
                Image(
                  image: ExactAssetImage(AssetFolder.doneImage,
                      scale: MediaQuery.sizeOf(context).width / 400),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Congrats',
                    style: TextStyle(
                      fontSize: 40,
                      color: ColorManager.blendedGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Your Profile Is Ready To Use',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 3,
                ),
                GreenButtonWidget(
                  text: 'Try Order',
                  height: 60,
                  width: 160,
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      'navigationBarScreen', (Route<dynamic> route) => false),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
