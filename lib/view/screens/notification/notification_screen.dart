import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/view/screens/notification/notification_pop_up.dart';

import '../../../core/constants/assets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundAngledPattern(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                NotificationPopUp(
                  image: AssetFolder.doneNotification,
                  productName: 'Your order has been taken by the driver',
                  hintText: '22 June 2021',
                ),
                NotificationPopUp(
                  image: AssetFolder.moneyNotification,
                  productName: r'Topup for $100 was successful',
                  hintText: '22 June 2021',
                ),
                NotificationPopUp(
                  image: AssetFolder.cancelNotification,
                  productName: 'Your order has been canceled',
                  hintText: '22 June 2021',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
