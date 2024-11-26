part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsSuccess extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});
}

final class RestaurantsSuccess extends ProductsState {}

final class RestaurantsLoading extends ProductsState {}

final class AddedToFavourites extends ProductsState {}
