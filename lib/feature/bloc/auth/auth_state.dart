part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  ApiExeception? apiExeception;

  RegisterError({required this.apiExeception});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}

class LoginError extends AuthState {
  ApiExeception? apiExeception;

  LoginError({required this.apiExeception});
}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {
  ApiExeception? apiExeception;

  LogoutError({required this.apiExeception});
}
