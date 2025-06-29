import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/model/tiket_acara_model.dart';

part 'tiket_acara_event.dart';
part 'tiket_acara_state.dart';

class TiketAcaraBloc extends Bloc<TiketAcaraEvent, TiketAcaraState> {
  TiketAcaraBloc() : super(TiketAcaraInitial()) {
    on<TiketAcaraEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
