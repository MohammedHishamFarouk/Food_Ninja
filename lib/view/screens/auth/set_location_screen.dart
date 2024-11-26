import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/constants/assets.dart';

import '../../../core/components/backgroundPattterns/background_angled_pattern.dart';
import '../../../core/components/buttons/green_button_widget.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

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
                          'Set Your Location ',
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
                //ToDo switch color
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Image(
                                image: ExactAssetImage(
                                  AssetFolder.locationImage,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Your Location',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            child: const SizedBox(
                              width: 70,
                              child: Text(
                                'Set   Location',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
                      onTap: () => Navigator.of(context).pushNamed('setupDone'),
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
