part of 'acara_bloc.dart';

abstract class AcaraState {}

class AcaraInitial extends AcaraState {}

class AcaraLoading extends AcaraState {}

class AcaraSuccess extends AcaraState {
  ListAcaraModel acaraModel;
  AcaraSuccess({required this.acaraModel});
}

class AcaraError extends AcaraState {
  ApiExeception? apiExeception;

  AcaraError({required this.apiExeception});
}
