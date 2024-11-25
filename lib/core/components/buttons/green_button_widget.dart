import 'package:flutter/material.dart';

import 'package:food_ninja/core/style/color_manager.dart';

class GreenButtonWidget extends StatelessWidget{
  const GreenButtonWidget({super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onTap,
    this.radius = 18,
    this.fontSize = 16,
    this.gradientColor = ColorManager.greenGradient,
  });

  final String text;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final VoidCallback onTap;
  final LinearGradient gradientColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: gradientColor,
        ),
        child: Center(
          child: Text(
            text,
            style:TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: text == '-'?ColorManager.blendedGreen.withOpacity(0.9):Colors.white
            ),
          ),
        ),
      ),
    );
  }

}