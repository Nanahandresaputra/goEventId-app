class ApiExeception implements Exception {
  final int? statusCode;
  final String? message;

  ApiExeception({this.statusCode, this.message});

  factory ApiExeception.fromMap(Map<String, dynamic> errorMssg) =>
      ApiExeception(
          statusCode: errorMssg['statusCode'], message: errorMssg['data']);

  Map<String, dynamic> errorMessage() {
    return {
      'statusCode': statusCode,
      'message': message,
    };

    // if (statusCode != null) {
    //   return {
    //     'statusCode': statusCode,
    //     'message': message,
    //   };
    // } else {
    //   return {
    //     'statusCode': 500,
    //     'message': message,
    //   };
    // }
  }
}
