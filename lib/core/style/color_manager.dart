import 'package:flutter/material.dart';

class ColorManager {
  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF53E88B), // Start color
      Color(0xFF15BE77), // End color
    ],
    stops: [-0.0082, 1.0153],
  );
  static LinearGradient opacGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    // Starting point of the gradient
    end: Alignment.bottomRight,
    // Ending point of the gradient
    colors: [
      const Color(0xFF53E88B).withOpacity(0.5),
      const Color(0xFF15BE77).withOpacity(0.5),
    ],
    stops: const [0.0, 1.0],
    // Equivalent to the percentage stops in CSS
    transform: const GradientRotation(
        98.81 * 3.14159 / 180), // Convert degrees to radians
  );
  static LinearGradient greyGradient = LinearGradient(
    colors: [
      Colors.grey.shade900,
      Colors.grey.shade900,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Color blendedGreen =
      Color.lerp(const Color(0xFF53E88B), const Color(0xFF15BE77), 0.5)!;
  static const Color burntOrange = Color(0xFFDA6317);
  static const Color yellowTint = Color(0xFFFEAD1D);
  static const Color blackShade = Color(0xFF0E1110);
}
