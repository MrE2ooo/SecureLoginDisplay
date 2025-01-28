part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginLoading extends LoginCubitState {}

final class LoginSuccess extends LoginCubitState {
  final List<UserResponse> userDetails;
  LoginSuccess(this.userDetails);
}

final class LoginFailure extends LoginCubitState {
  final String message;
  LoginFailure(this.message);
}