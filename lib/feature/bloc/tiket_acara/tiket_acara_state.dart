part of 'tiket_acara_bloc.dart';

abstract class TiketAcaraState {}

class TiketAcaraInitial extends TiketAcaraState {}

class TiketAcaraLoading extends TiketAcaraState {}

class TiketAcaraSuccess extends TiketAcaraState {
  TiketAcaraModel tiketAcaraModel;
  TiketAcaraSuccess({required this.tiketAcaraModel});
}

class TiketAcaraError extends TiketAcaraState {
  ApiExeception? apiExeception;

  TiketAcaraError({required this.apiExeception});
}
