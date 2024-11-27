import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight / 2.3),
        child: Container(
          width: screenWidth,
          decoration: const BoxDecoration(
            color: ColorManager.blackShade,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: screenWidth / 7,
                    child: ClipOval(
                      child: Divider(
                        color: Colors.grey[800],
                        thickness: 6,
                      ),
                    ),
                  ),
                ),
                ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}
