import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/api/api_execption.dart';
import 'package:go_event_id/feature/api/api_url.dart';
import 'package:go_event_id/feature/model/pemesanan_model.dart';
import 'package:go_event_id/helpers/res_code.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'pemesanan_event.dart';
part 'pemesanan_state.dart';

ApiUrl apiUrl = ApiUrl();

class PemesananBloc extends Bloc<PemesananEvent, PemesananState> {
  PemesananBloc() : super(PemesananInitial()) {
    on<ResetPemesananEvent>(
      (event, emit) async {
        emit(PemesananInitial());
      },
    );
    on<PostPemesananEvent>((event, emit) async {
      try {
        emit(PemesananLoading());
        final getToken = await SharedPreferences.getInstance();
        final String token = getToken.getString('token') ?? '';
        dynamic pemesananBody = event.pemesananBody;
        final response = await http.post(Uri.parse(apiUrl.pemesanan),
            body: jsonEncode(pemesananBody),
            headers: {
              'token': token,
              HttpHeaders.contentTypeHeader: 'application/json'
            });
        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(PemesananSuccess(
                pemesnanModel: pemesnanModelFromJson(response.body)));
          } else {
            emit(PemesananError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: response.body)));
          }
        } else {
          emit(PemesananError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: response.body)));
        }
      } catch (e) {
        emit(PemesananError(
            apiExeception:
                ApiExeception(statusCode: 500, message: e.toString())));
      }
    });

    on<UpdatePemesananEvent>((event, emit) async {
      try {
        emit(UpdatePemesananLoading());
        final getToken = await SharedPreferences.getInstance();
        final String token = getToken.getString('token') ?? '';
        dynamic updatePemesananBody = event.updatePemesananBody;
        final response = await http.post(Uri.parse(apiUrl.updatePemesanan),
            body: jsonEncode(updatePemesananBody),
            headers: {
              'token': token,
              HttpHeaders.contentTypeHeader: 'application/json'
            });
        if (RespCode(response.body).statusCode == 200 ||
            RespCode(response.body).statusCode == 201) {
          if (RespCode(response.body).statusCode == 200 ||
              RespCode(response.body).statusCode == 201) {
            emit(UpdatePemesananSuccess());
          } else {
            emit(UpdatePemesananError(
                apiExeception: ApiExeception(
                    statusCode: RespCode(response.body).statusCode,
                    message: response.body)));
          }
        } else {
          emit(UpdatePemesananError(
              apiExeception: ApiExeception(
                  statusCode: RespCode(response.body).statusCode,
                  message: response.body)));
        }
      } catch (e) {
        emit(UpdatePemesananError(
            apiExeception:
                ApiExeception(statusCode: 500, message: e.toString())));
      }
    });
  }
}
