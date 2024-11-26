import 'package:flutter/material.dart';
import 'package:food_ninja/core/constants/assets.dart';

class BackGroundPatternWidget extends StatelessWidget {
  const BackGroundPatternWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 2.5,
          width: MediaQuery.sizeOf(context).width,
          child: const Image(
            image: ExactAssetImage(AssetFolder.pattern),
            fit: BoxFit.cover,
          ),
        ),
        //ToDo ColorSwitching
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.2),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
