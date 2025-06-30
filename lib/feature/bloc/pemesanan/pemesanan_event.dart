part of 'pemesanan_bloc.dart';

abstract class PemesananEvent {}

class PostPemesananEvent extends PemesananEvent {
  Map<String, dynamic> pemesananBody;

  PostPemesananEvent({required this.pemesananBody});
}

class ResetPemesananEvent extends PemesananEvent {}
