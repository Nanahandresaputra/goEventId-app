import 'package:shared_preferences/shared_preferences.dart';

class GetToken {
  late Map<String, String> data = {"token": ""};

  Future<String> prefs() async {
    final getToken = await SharedPreferences.getInstance();
    final String token = getToken.getString('token') ?? '';

    data = {"token": token};
    return token;
  }

  late Map<String, String> getData = data;

  GetToken();
}
