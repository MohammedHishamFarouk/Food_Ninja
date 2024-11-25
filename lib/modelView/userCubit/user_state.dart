part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class SignUpLoading extends UserState {}
final class SignUpSuccess extends UserState {}
final class SignUpFailure extends UserState {
  final String message;
  SignUpFailure({required this.message});
}

final class IconButtonPressed extends UserState {}

final class ChangeProfileImage extends UserState {}
