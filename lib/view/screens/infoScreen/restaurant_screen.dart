import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/buttons/custom_icon_button.dart';
import 'package:food_ninja/core/components/category_title_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/productsCubit/products_cubit.dart';
import 'package:food_ninja/view/screens/infoScreen/components/info_tab.dart';
import 'package:food_ninja/view/screens/infoScreen/components/product_badge.dart';
import 'package:food_ninja/view/screens/infoScreen/components/review_box_widget.dart';

import '../../../core/constants/assets.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({
    super.key,
    required this.restaurantImage,
    required this.restaurantName,
    required this.description,
    required this.distance,
  });

  final String restaurantImage;
  final String restaurantName;
  final String description;
  final String distance;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    List<Widget> restaurants =
        context.read<ProductsCubit>().getRestaurants(4, context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight / 2,
            child: Image(
              image: AssetImage(restaurantImage),
              fit: BoxFit.cover,
            ),
          ),
          InfoTab(
            children: [
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
                  restaurantName,
                  style: const TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.blendedGreen,
                    size: 24,
                  ),
                  Text(
                    distance,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.star_half_rounded,
                    color: ColorManager.blendedGreen,
                    size: 27,
                  ),
                  Text(
                    ' 4,8 Rating',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              const CategoryTitleWidget(
                title: 'Popular Menu',
                addTextButton: true,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return restaurants[index];
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 16,
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
            ],
          ),
        ],
      ),
    );
  }
}
