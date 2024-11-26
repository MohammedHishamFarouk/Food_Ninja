import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/view/screens/orderSteps/components/order_button_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundAngledPattern(),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 38, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomBackButton(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OrderButtonWidget(
                  text: '2121 6352 8465 ****',
                  hintTitle: 'Payment Method',
                  image: AssetFolder.paypal,
                  imageScale: 1.5,
                ),
                OrderButtonWidget(
                  text: '2121 6352 8465 ****',
                  hintTitle: 'Payment Method',
                  image: AssetFolder.visa,
                  imageScale: 1.2,
                ),
                OrderButtonWidget(
                  text: '2121 6352 8465 ****',
                  hintTitle: 'Payment Method',
                  image: AssetFolder.payoneer,
                  imageScale: 1.2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
