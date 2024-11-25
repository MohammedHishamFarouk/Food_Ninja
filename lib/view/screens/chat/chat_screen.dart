import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/view/screens/chat/component/contact_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Chat',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ContactButton(
                        image: AssetFolder.happyMan,
                        name: 'Anamwp',
                        id: 1,
                      ),
                      ContactButton(
                        image: AssetFolder.man,
                        name: 'Guy Hawkins',
                        id: 2,
                      ),
                      ContactButton(
                        image: AssetFolder.happyGuy2,
                        name: 'Andrew Roy',
                        id: 0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
