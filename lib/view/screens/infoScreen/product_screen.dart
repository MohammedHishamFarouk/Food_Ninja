import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/buttons/custom_icon_button.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/components/category_title_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/model/products_model.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';
import 'package:food_ninja/view/screens/infoScreen/components/product_badge.dart';
import 'package:food_ninja/view/screens/infoScreen/components/review_box_widget.dart';

import '../../../core/constants/assets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.description,
    required this.productHinText,
    required this.price,
    this.id,
  });

  final String foodImage;
  final String foodName;
  final String productHinText;
  final double price;
  final String description;
  final int? id;

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
            child: Image(
              image: NetworkImage(foodImage),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            ProductBadge(
                              text: 'Popular',
                              textColor: ColorManager.blendedGreen,
                              backgroundColor: ColorManager.blendedGreen,
                            ),
                            const Spacer(),
                            CustomIconButton(
                              icon: Icons.location_on_rounded,
                              backgroundColor: ColorManager.blendedGreen,
                              iconColor: ColorManager.blendedGreen,
                              onPressed: () {},
                            ),
                            CustomIconButton(
                              icon: Icons.favorite_outline,
                              backgroundColor: Colors.red,
                              iconColor: Colors.red,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          foodName,
                          style: const TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_half_rounded,
                            color: ColorManager.blendedGreen,
                            size: 27,
                          ),
                          Text(
                            ' 4,8 Rating',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: ColorManager.blendedGreen,
                            size: 23,
                          ),
                          Text(
                            ' 2000+ Order',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          description,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const CategoryTitleWidget(title: 'Testimonials'),
                      const ReviewBoxWidget(
                        image: AssetFolder.happyMan,
                        userName: 'happy guy',
                        hintText: '20 April 2021',
                      ),
                      const ReviewBoxWidget(
                        image: AssetFolder.man,
                        userName: 'orange man',
                        hintText: '20 April 2021',
                      ),
                      //used to add space for the button
                      const SizedBox(
                        height: 65,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: GreenButtonWidget(
                text: 'Add To Cart',
                height: 60,
                width: screenWidth - 50,
                onTap: () {
                  context.read<OrderCubit>().addToCart(
                        ProductsModel(
                          foodImage: [foodImage],
                          title: foodName,
                          hintText: productHinText,
                          price: price,
                          description: '',
                          id: id,
                        ),
                      );
                  context.read<OrderCubit>().addPrice(price, id!);
                  Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    );
  }
}
