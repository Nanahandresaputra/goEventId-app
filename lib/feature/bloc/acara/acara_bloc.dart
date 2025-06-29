import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/api/api_url.dart';
import 'package:go_event_id/feature/model/acara_model.dart';
import 'package:go_event_id/helpers/get_token.dart';
import 'package:go_event_id/helpers/res_code.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'acara_event.dart';
part 'acara_state.dart';

ApiUrl apiUrl = ApiUrl();

class AcaraBloc extends Bloc<AcaraEvent, AcaraState> {
  AcaraBloc() : super(AcaraInitial()) {
    on<AcaraEvent>((event, emit) async {
      try {
        emit(AcaraLoading());

        final getToken = await SharedPreferences.getInstance();
        final String token = getToken.getString('token') ?? '';

        final response =
            await http.get(Uri.parse(apiUrl.acara), headers: {'token': token});

        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(AcaraSuccess(
                acaraModel: listAcaraModelFromJson(response.body)));
          } else {
            emit(AcaraError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: RespCode(response.body).message)));
          }
        } else {
          emit(AcaraError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: RespCode(response.body).message)));
        }
      } catch (e) {
        emit(AcaraError(
            apiExeception:
                ApiExeception(statusCode: 500, message: 'Network Error')));
      }
    });
  }
}
