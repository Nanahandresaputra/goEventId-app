import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  int statusCode;
  String token;

  LoginModel({
    required this.message,
    required this.statusCode,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        statusCode: json["statusCode"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "token": token,
      };
}
