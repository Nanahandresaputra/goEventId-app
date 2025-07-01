part of 'pemesanan_bloc.dart';

abstract class PemesananEvent {}

class PostPemesananEvent extends PemesananEvent {
  Map<String, dynamic> pemesananBody;

  PostPemesananEvent({required this.pemesananBody});
}

class UpdatePemesananEvent extends PemesananEvent {
  Map<String, String> updatePemesananBody;

  UpdatePemesananEvent({required this.updatePemesananBody});
}

class ResetPemesananEvent extends PemesananEvent {}
