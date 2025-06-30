// To parse this JSON data, do
//
//     final pemesnanModel = pemesnanModelFromJson(jsonString);

import 'dart:convert';

PemesnanModel pemesnanModelFromJson(String str) =>
    PemesnanModel.fromJson(json.decode(str));

String pemesnanModelToJson(PemesnanModel data) => json.encode(data.toJson());

class PemesnanModel {
  String message;
  int statusCode;
  Data data;

  PemesnanModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory PemesnanModel.fromJson(Map<String, dynamic> json) => PemesnanModel(
        message: json["message"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  String token;
  String redirectUrl;

  Data({
    required this.token,
    required this.redirectUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "redirect_url": redirectUrl,
      };
}
