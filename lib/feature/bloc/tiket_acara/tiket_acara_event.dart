part of 'tiket_acara_bloc.dart';

abstract class TiketAcaraEvent {}

class GetTiketAcaraEvent extends TiketAcaraEvent {
  String acaraId;

  GetTiketAcaraEvent({required this.acaraId});
}
