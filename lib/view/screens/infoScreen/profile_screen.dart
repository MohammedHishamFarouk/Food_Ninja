import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/category_title_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/productsCubit/products_cubit.dart';
import 'package:food_ninja/modelView/userCubit/user_cubit.dart';
import 'package:food_ninja/view/screens/infoScreen/components/product_badge.dart';

import '../../../core/constants/assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Mohamed Hisham',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: ExactAssetImage(
                                  AssetFolder.editIcon,
                                  scale: 0.95,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20),
                        child: Text(
                          'mohamedhis36@gmail.com',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(AssetFolder.voucherIcon),
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'You Have 3 Vouchers',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      const CategoryTitleWidget(title: 'Favorite'),
                      if (context.read<ProductsCubit>().favourites.isEmpty)
                        const Center(
                          child: Image(
                            image: AssetImage(AssetFolder.empty),
                          ),
                        ),
                      ...context.read<ProductsCubit>().favourites,
                      const SizedBox(
                        height: 60,
                      )
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
