part of 'auth_bloc.dart';

abstract class AuthState {}

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  Register? register;
  RegisterSuccess({required this.register});
}

class RegisterError extends AuthState {
  ApiExeception? apiExeception;

  RegisterError({required this.apiExeception});
}
