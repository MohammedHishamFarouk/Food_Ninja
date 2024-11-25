import 'package:flutter/material.dart';

import 'package:food_ninja/core/style/color_manager.dart';

class SignUpIconButtons extends StatelessWidget {
  const SignUpIconButtons({super.key, required this.text, required this.changeIcon, required this.onPressed});
  final String text;
  final bool changeIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: changeIcon
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: ColorManager.blendedGreen,
                      ),
                      const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: Colors.white,
                      )
                    ],
                  )
                : const Icon(Icons.circle_outlined)),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
