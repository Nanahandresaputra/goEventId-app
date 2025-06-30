import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  ApiUrl() {
    print('base uri --> $baseUrl');
  }

  dynamic baseUrl = dotenv.env['BASE_API_URL'];

// product
  // late String products = '$baseUrl/produk';
  // late String productFindOne = '$baseUrl/product';

  // String productFind(int? dataId) {
  //   return dataId != null ? '$products/$dataId' : products;
  // }

// auth
  late String register = '$baseUrl/auth/register';
  late String login = '$baseUrl/auth/login';

// Acara
  late String acara = '$baseUrl/acara';
  late String tiketAcara = '$baseUrl/tiket-acara';

// Pemesanan
  late String pemesanan = '$baseUrl/pemesanan';
}
