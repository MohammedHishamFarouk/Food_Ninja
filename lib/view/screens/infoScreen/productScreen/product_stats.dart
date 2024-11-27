import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';

class ProductStats extends StatelessWidget {
  const ProductStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_half_rounded,
          color: ColorManager.blendedGreen,
          size: 27,
        ),
        Text(
          ' 4,8 Rating',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: ColorManager.blendedGreen,
          size: 23,
        ),
        Text(
          ' 2000+ Order',
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
