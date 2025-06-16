import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String message;
  int statusCode;

  Register({
    required this.message,
    required this.statusCode,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
      };
}
