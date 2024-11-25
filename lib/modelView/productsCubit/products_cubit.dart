import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/productButton/product_button.dart';
import 'package:food_ninja/model/local_Data.dart';
import 'package:food_ninja/model/products_list_model.dart';
import 'package:food_ninja/model/products_model.dart';
import 'package:food_ninja/model/restaurant_model.dart';
import 'package:food_ninja/view/screens/infoScreen/restaurant_screen.dart';

import '../../core/components/buttons/custom_filled_button.dart';
import '../../core/constants/assets.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.dio) : super(ProductsInitial());

  final Dio dio;

  List<RestaurantModel> restaurants = [];
  List<ProductsModel> products = [];

  void getRestaurants() {
    emit(RestaurantsLoading());
    List<String> restaurantImages = [
      AssetFolder.veganResto,
      AssetFolder.healthyResto,
      AssetFolder.faceResto,
      AssetFolder.fourColorResto,
      AssetFolder.hatResto,
      AssetFolder.breadResto
    ];

    List<String> restaurantNames = [
      'Vegan Resto',
      'Healthy Food',
      'Good Food',
      'Smart Resto',
      'Bread Resto',
      'Hat Resto'
    ];
    List<String> restaurantTime = [
      '12 Mins',
      '8 Mins',
      '20 Mins',
      '1 Mins',
      '5 Mins',
      '40 Mins'
    ];
    List<int> restaurantDistance = [1, 5, 20, 1, 19, 40];

    for (int i = 0; i < restaurantNames.length; i++) {
      restaurants.add(
        RestaurantModel(
          restaurantName: restaurantNames[i],
          restaurantImage: restaurantImages[i],
          restaurantTime: restaurantTime[i],
          restaurantDistance: restaurantDistance[i],
        ),
      );
    }
    emit(RestaurantsSuccess());
  }

  List<Widget> listTheRestaurants(int number, BuildContext context) {
    List<Widget> restaurantsList = [];
    for (int i = 0; i < number; i++) {
      restaurantsList.add(
        CustomFilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RestaurantScreen(
                  restaurantImage: restaurants[i].restaurantImage,
                  restaurantName: restaurants[i].restaurantName,
                  description: AssetFolder.trialDescription,
                  distance: '${restaurants[i].restaurantDistance} Km',
                ),
              ),
            );
          },
          image: restaurants[i].restaurantImage,
          width: 160,
          height: 200,
          imageHeight: 100,
          text: restaurants[i].restaurantName,
          hintText: restaurants[i].restaurantTime,
          restaurantDistance: restaurants[i].restaurantDistance,
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
      final List<ProductsModel> products = getProductsModel.productsList
          .map((e) => ProductsModel.fromJson(e))
          .toList();
      LocalData.productsList = products;
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
          image: LocalData.productsList[i].foodImage[0],
          productName: LocalData.productsList[i].title,
          hintText: LocalData.productsList[i].description,
          price: LocalData.productsList[i].price,
          description: LocalData.productsList[i].description,
          id: LocalData.productsList[i].id,
        ),
      );
    }
    return productsList;
  }
}
