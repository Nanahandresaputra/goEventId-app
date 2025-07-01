part of 'pemesanan_bloc.dart';

abstract class PemesananState {}

class PemesananInitial extends PemesananState {}

class PemesananLoading extends PemesananState {}

class PemesananSuccess extends PemesananState {
  PemesnanModel pemesnanModel;
  PemesananSuccess({required this.pemesnanModel});
}

class PemesananError extends PemesananState {
  ApiExeception? apiExeception;

  PemesananError({required this.apiExeception});
}

class UpdatePemesananLoading extends PemesananState {}

class UpdatePemesananSuccess extends PemesananState {}

class UpdatePemesananError extends PemesananState {
  ApiExeception? apiExeception;

  UpdatePemesananError({required this.apiExeception});
}
