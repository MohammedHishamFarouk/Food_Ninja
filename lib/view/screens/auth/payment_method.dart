import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/components/buttons/custom_filled_button.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Payment Method',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            'This data will be displayed in your account profile for security',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomFilledButton(
                    image: AssetFolder.paypal,
                    onPressed: () {},
                    imageScale: 0.8,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: CustomFilledButton(
                    image: AssetFolder.visa,
                    onPressed: () {},
                    imageScale: 0.8,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: CustomFilledButton(
                    image: AssetFolder.payoneer,
                    onPressed: () {},
                    imageScale: 0.8,
                  ),
                ),
                const Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: GreenButtonWidget(
                      text: 'Next',
                      height: 60,
                      width: 160,
                      onTap: () =>
                          Navigator.of(context).pushNamed('uploadPhoto'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
