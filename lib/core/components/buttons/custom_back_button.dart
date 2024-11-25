import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';

import '../../constants/assets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: FilledButton(
          onPressed: () => Navigator.pop(context),
          style: FilledButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: ColorManager.burntOrange.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Image(
            image: ExactAssetImage(AssetFolder.backArrowIcon),
          )),
    );
  }
}
