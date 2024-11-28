import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_pattern.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/resetPassCubit/reset_pass_cubit.dart';

class ResetSuccessScreen extends StatelessWidget {
  const ResetSuccessScreen({super.key});

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
                  'Password reset successful',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 3,
                ),
                GreenButtonWidget(
                    text: 'Back',
                    height: 60,
                    width: 160,
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('login');
                      context.read<ResetPassCubit>().clearField();
                    }),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
