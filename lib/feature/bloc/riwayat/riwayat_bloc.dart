import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/api/api_url.dart';
import 'package:go_event_id/feature/model/riwayat_model.dart';
import 'package:go_event_id/helpers/res_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'riwayat_event.dart';
part 'riwayat_state.dart';

ApiUrl apiUrl = ApiUrl();

class RiwayatBloc extends Bloc<RiwayatEvent, RiwayatState> {
  RiwayatBloc() : super(RiwayatInitial()) {
    on<GetRiwayatEvent>((event, emit) async {
      try {
        emit(RiwayatLoading());

        final getToken = await SharedPreferences.getInstance();
        final String token = getToken.getString('token') ?? '';

        final response = await http
            .get(Uri.parse(apiUrl.riwayat), headers: {'token': token});

        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(RiwayatSuccess(
                riwayatModel: riwayatModelFromJson(response.body)));
          } else {
            emit(RiwayatError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: RespCode(response.body).message)));
          }
        } else {
          emit(RiwayatError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: RespCode(response.body).message)));
        }
      } catch (e) {
        emit(RiwayatError(
            apiExeception:
                ApiExeception(statusCode: 500, message: 'Network Error')));
      }
    });
  }
}
