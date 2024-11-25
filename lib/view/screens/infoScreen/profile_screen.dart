import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/userCubit/user_cubit.dart';
import 'package:food_ninja/view/screens/infoScreen/components/product_badge.dart';

import '../../../core/constants/assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  final String profileImage = '';
  final String name = '';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight / 2,
            child: context.read<UserCubit>().profileImage == null
                ? const Image(
                    image: AssetImage(AssetFolder.defaultProfilePic),
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(context.read<UserCubit>().profileImage!.path),
                    fit: BoxFit.cover,
                  ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight / 2.3),
              child: Container(
                width: screenWidth,
                constraints: BoxConstraints(
                  minHeight: screenHeight / 1.4,
                ),
                decoration: const BoxDecoration(
                  color: ColorManager.blackShade,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            ProductBadge(
                              text: 'Member Gold ',
                              textColor: ColorManager.yellowTint,
                              backgroundColor: ColorManager.yellowTint,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Penjel Hisham',
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
