import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/api/api_url.dart';
import 'package:go_event_id/feature/model/auth_model.dart';
import 'package:go_event_id/helpers/res_code.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

ApiUrl apiUrl = ApiUrl();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<GetRegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final response = await http.post(Uri.parse(apiUrl.register),
            body: event.registerBody);
        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(RegisterSuccess());
          } else {
            emit(RegisterError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: response.body)));
          }
        } else {
          emit(RegisterError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: response.body)));
        }
      } catch (e) {
        emit(RegisterError(
            apiExeception:
                ApiExeception(statusCode: 500, message: e.toString())));
      }
    });
    on<GetLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final response =
            await http.post(Uri.parse(apiUrl.login), body: event.loginBody);

        print('state api login --> ${response.body}');

        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(LoginSuccess(loginModel: loginModelFromJson(response.body)));
          } else {
            emit(LoginError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: response.body)));
          }
        } else {
          emit(LoginError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: response.body)));
        }
      } catch (e) {
        emit(LoginError(
            apiExeception:
                ApiExeception(statusCode: 500, message: 'Network Error')));
      }
    });
  }
}
