import 'package:flutter/material.dart';
import 'package:food_ninja/core/constants/assets.dart';

class BackGroundAngledPattern extends StatelessWidget{
  const BackGroundAngledPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const ExactAssetImage(
        AssetFolder.angledPattern,
        scale: 0.5,
      ),
      color: Colors.green.withOpacity(0.2),
    );
  }

}