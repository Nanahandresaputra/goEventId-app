import 'dart:convert';

class RespCode {
  String response;

  RespCode(this.response);

  late int statusCode = json.decode(response)['statusCode'];
  late String message = json.decode(response)['message'];
  // return response['statusCode'];
}
