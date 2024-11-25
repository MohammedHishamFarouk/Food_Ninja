import 'package:flutter/material.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/view/screens/orderSteps/components/order_fees_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 15,
      right: 15,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          gradient: ColorManager.greenGradient,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(AssetFolder.checkoutPattern),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: OrderFeesWidget(
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
