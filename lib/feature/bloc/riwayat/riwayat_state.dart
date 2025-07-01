part of 'riwayat_bloc.dart';

abstract class RiwayatState {}

class RiwayatInitial extends RiwayatState {}

class RiwayatLoading extends RiwayatState {}

class RiwayatSuccess extends RiwayatState {
  RiwayatModel riwayatModel;
  RiwayatSuccess({required this.riwayatModel});
}

class RiwayatError extends RiwayatState {
  ApiExeception? apiExeception;

  RiwayatError({required this.apiExeception});
}
