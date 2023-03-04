part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;
  AuthError(this.errorMessage);
}

class AuthLoginSuccess extends AuthState {
  final LoginResponse dataLogin;
  AuthLoginSuccess(this.dataLogin);
}
