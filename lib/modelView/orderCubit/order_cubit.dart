import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/productButton/product_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/model/products_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  final List<double> cartProductsPrices = [];
  final List<int> cartProductsId = [];
  final List<Widget> listOfProcessBtn = [];
  final List<Widget> processBtnHistory = [
    const ProductButton(
      image: AssetFolder.creamCake,
      productName: 'soup',
      hintText: 'asjkfasjfm',
      price: 12,
      description: 'mkasfnajkfnaf',
      id: 100000,
      addButton: true,
      countButtons: false,
      buttonText: 'Reorder',
    ),
    const ProductButton(
      image: AssetFolder.soup,
      productName: 'soup',
      hintText: 'asjkfasjfm',
      price: 45,
      description: 'mkasfnajkfnaf',
      id: 100000,
      addButton: true,
      countButtons: false,
      buttonText: 'Reorder',
    ),
    const ProductButton(
      image: AssetFolder.mozarella,
      productName: 'soup',
      hintText: 'asjkfasjfm',
      price: 30,
      description: 'mkasfnajkfnaf',
      id: 100000,
      addButton: true,
      countButtons: false,
      buttonText: 'Reorder',
    )
  ];

  final Set<Widget> cartProducts = {
    const ProductButton(
      image: AssetFolder.soup,
      productName: 'soup',
      hintText: 'asjkfasjfm',
      price: 27,
      description: 'mkasfnajkfnaf',
      id: 100000,
    )
  };
  String defaultPaymentMethod = AssetFolder.paypal;
  double defaultImageScale = 1.5;

  void addToCart(ProductsModel productsModel) {
    if (!cartProductsId.contains(productsModel.id)) {
      listOfProcessBtn.add(
        ProductButton(
          image: productsModel.foodImage.first,
          productName: productsModel.title,
          hintText: productsModel.hintText,
          price: productsModel.price,
          description: productsModel.description,
          addButton: true,
          countButtons: false,
          id: productsModel.id,
        ),
      );
      cartProducts.add(
        ProductButton(
          image: productsModel.foodImage.first,
          productName: productsModel.title,
          hintText: productsModel.hintText,
          price: productsModel.price,
          description: productsModel.description,
          addButton: true,
          id: productsModel.id,
        ),
      );
    } else {
      cartProductsPrices.remove(productsModel.price);
      cartProductsId.remove(productsModel.id);
    }
    emit(AddToCartSuccess());
  }

  void addPrice(double price, int id) {
    cartProductsPrices.add(price);
    cartProductsId.add(id);
    emit(ChangeCountState());
  }

  int changeCount(int id) {
    int count = 0;
    for (var i in cartProductsId) {
      if (i == id) {
        count++;
      }
    }
    return count;
  }

  void removePrice(int id, double price) {
    if (changeCount(id) != 1) {
      cartProductsId.remove(id);
      cartProductsPrices.remove(price);
    }
    emit(AddToCartSuccess());
  }

  num subTotal() {
    return cartProductsPrices.fold(0, (p, c) => p + c);
  }

  void editPayment(String newPayment, double imageScale) {
    defaultPaymentMethod = newPayment;
    defaultImageScale = imageScale;
    emit(PaymentMethodEdited());
  }
}
