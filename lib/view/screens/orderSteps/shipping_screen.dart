import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/view/screens/orderSteps/components/order_button_widget.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 38, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomBackButton(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                  child: Text(
                    'Shipping',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const OrderButtonWidget(
                  addHeader: true,
                  hintTitle: 'Order Location',
                  text: AssetFolder.newLocation,
                ),
                OrderButtonWidget(
                  addHeader: true,
                  text: AssetFolder.defaultLocation,
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
