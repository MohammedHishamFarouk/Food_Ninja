part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class AddToCartLoading extends OrderState {}

final class AddToCartSuccess extends OrderState {}

final class AddToCartFailure extends OrderState {}

final class ChangeCountState extends OrderState {}

final class PaymentMethodEdited extends OrderState {}
