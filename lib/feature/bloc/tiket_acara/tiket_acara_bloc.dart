import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/api/api_url.dart';
import 'package:go_event_id/feature/model/tiket_acara_model.dart';
import 'package:go_event_id/helpers/res_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'tiket_acara_event.dart';
part 'tiket_acara_state.dart';

ApiUrl apiUrl = ApiUrl();

class TiketAcaraBloc extends Bloc<TiketAcaraEvent, TiketAcaraState> {
  TiketAcaraBloc() : super(TiketAcaraInitial()) {
    on<GetTiketAcaraEvent>((event, emit) async {
      try {
        emit(TiketAcaraLoading());

        final getToken = await SharedPreferences.getInstance();
        final String token = getToken.getString('token') ?? '';

        final response = await http.get(Uri.parse(apiUrl.tiketAcara),
            headers: {'token': token, "acara_id": event.acaraId});

        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(TiketAcaraSuccess(
                tiketAcaraModel: tiketAcaraModelFromJson(response.body)));
          } else {
            emit(TiketAcaraError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: RespCode(response.body).message)));
          }
        } else {
          emit(TiketAcaraError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: RespCode(response.body).message)));
        }
      } catch (e) {
        emit(TiketAcaraError(
            apiExeception:
                ApiExeception(statusCode: 500, message: 'Network Error')));
      }
    });
  }
}
