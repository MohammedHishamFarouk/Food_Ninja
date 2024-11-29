import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/productButton/product_button.dart';
import 'package:food_ninja/core/constants/test_restaurants.dart';
import 'package:food_ninja/model/products_list_model.dart';
import 'package:food_ninja/model/products_model.dart';
import 'package:food_ninja/view/screens/infoScreen/restaurant_screen.dart';

import '../../core/components/buttons/custom_filled_button.dart';
import '../../core/constants/assets.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.dio) : super(ProductsInitial());

  final Dio dio;

  List<ProductsModel> products = [];
  List<Widget> favourites = [];
  List<int> favouritesId = [];

  List<Widget> getRestaurants(int number, BuildContext context) {
    List<Widget> restaurantsList = [];
    for (int i = 0; i < number; i++) {
      restaurantsList.add(
        CustomFilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RestaurantScreen(
                  restaurantImage: TestRestaurants.restosInterior[i],
                  restaurantName: TestRestaurants.restaurantNames[i],
                  description: AssetFolder.trialDescription,
                  distance: '${TestRestaurants.restaurantDistance[i]} Km',
                ),
              ),
            );
          },
          image: TestRestaurants.restaurantImages[i],
          width: 160,
          height: 200,
          imageHeight: 100,
          text: TestRestaurants.restaurantNames[i],
          hintText: TestRestaurants.restaurantTime[i],
          restaurantDistance: TestRestaurants.restaurantDistance[i],
        ),
      );
    }
    return restaurantsList;
  }

  Future getItemsList() async {
    emit(ProductsLoading());
    try {
      final response = await dio.get(
        'https://api.escuelajs.co/api/v1/products',
      );
      final getProductsModel = ProductsListModel.fromJson(response.data);
      products = getProductsModel.productsList
          .map((e) => ProductsModel.fromJson(e))
          .toList();
      emit(ProductsSuccess());
    } catch (e) {
      emit(ProductsFailure(message: e.toString()));
    }
  }

  List<Widget> listTheProducts(int number) {
    List<Widget> productsList = [];
    for (int i = 0; i < number; i++) {
      productsList.add(
        ProductButton(
          image: products[i]
              .foodImage[0]
              .replaceAll(RegExp(r'[^a-zA-Z0-9:/._-]'), ''),
          productName: products[i].title,
          hintText: products[i].description,
          price: products[i].price,
          description: products[i].description,
          id: products[i].id,
        ),
      );
    }
    return productsList;
  }

  void addToFavourites(ProductButton product, int id) {
    if (!favouritesId.contains(id)) {
      favourites.add(product);
      favouritesId.add(id);
    } else {
      favouritesId.remove(id);
      favourites.remove(product);
    }
    emit(AddedToFavourites());
  }

  bool isFavourite(int id) {
    return favouritesId.contains(id);
  }
}
