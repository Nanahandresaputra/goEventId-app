import 'dart:convert';

import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/api/api_url.dart';
import 'package:go_event_id/feature/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

ApiUrl apiUrl = ApiUrl();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(RegisterInitial()) {
    on<GetRegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final response = await http.post(Uri.parse(apiUrl.register),
            body: event.registerBody);
        if (response.statusCode == 200) {
          if (_resCode(response.body) == 200) {
            emit(RegisterSuccess(register: registerFromJson(response.body)));
          } else {
            emit(RegisterError(
                apiExeception: ApiExeception(
                    statusCode: response.statusCode, message: response.body)));
          }
        } else {
          emit(RegisterError(
              apiExeception: ApiExeception(
                  statusCode: response.statusCode, message: response.body)));
        }
      } catch (e) {
        emit(RegisterError(
            apiExeception:
                ApiExeception(statusCode: 500, message: e.toString())));
      }
    });
  }
}

int _resCode(String res) {
  var response = json.decode(res);
  return response['statusCode'];
}
