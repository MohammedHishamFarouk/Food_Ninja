import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/view/screens/homePageSections/all_resto_sec.dart';
import 'package:food_ninja/view/screens/homePageSections/popular_menu_sec.dart';

import '../../../core/components/category_title_widget.dart';
import '../../../core/constants/assets.dart';
import '../../../modelView/productsCubit/products_cubit.dart';

List<Widget> _products = [];

class MainHomeSec extends StatelessWidget {
  const MainHomeSec({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    List<Widget> restaurants =
        context.read<ProductsCubit>().getRestaurants(4, context);
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsSuccess) {
          _products = context.read<ProductsCubit>().listTheProducts(4);
        }
      },
      builder: (context, state) {
        return state is ProductsLoading
            ? Column(
                children: [
                  SizedBox(
                    height: screenHeight / 4,
                  ),
                  const CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                ],
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      Container(
                        height: 175,
                        width: 420,
                        decoration: BoxDecoration(
                          gradient: ColorManager.greenGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            SizedBox(
                              height: 175,
                              width: 420,
                              child: Image.asset(
                                AssetFolder.sidePattern,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Image(
                              image: ExactAssetImage(
                                AssetFolder.iceCreamImage,
                                scale: 0.95,
                              ),
                            ),
                            Row(
                              children: [
                                const Spacer(
                                  flex: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 150,
                                      child: Text(
                                        'Special Deal For October',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: FilledButton(
                                        onPressed: () {},
                                        style: FilledButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          'Buy Now',
                                          style: TextStyle(
                                            color: ColorManager.blendedGreen,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const CategoryTitleWidget(
                        title: 'Nearest Restaurant',
                        addTextButton: true,
                        newSection: AllRestoSec(),
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
                      const CategoryTitleWidget(
                        title: 'Popular Menu',
                        addTextButton: true,
                        newSection: PopularMenuSec(),
                      ),
                      ..._products,
                      const SizedBox(
                        height: 90,
                      )
                    ],
                  );
                },
              );
      },
    );
  }
}
