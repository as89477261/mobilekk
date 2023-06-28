import 'package:dio/dio.dart';

class ApiService {
  late String baseUrl;
  late Dio dio;

  ApiService() {
    this.baseUrl = 'https://api.oic.or.th/apikk_dev';
    //this.baseUrl = 'http://bringusolution.ddns.net/apikk';
    this.dio = new Dio();
  }

  // TODO: remove later
  static const String _defaultBearerToken =
      '5e8e1bbe2568161b364aca2bacd2f0810f194ff2ba6776835292724c';

  Future<Response> getHttp({
    required String endpoint,
    String? bearerToken,
  }) async {
    return dio.get(
      '$baseUrl/$endpoint',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${bearerToken ?? _defaultBearerToken}',
        },
      ),
    );
  }

  Future<Response> postHttp({
    required String endpoint,
    Map<String, dynamic>? parameters,
    String? bearerToken,
  }) async {
    final response = await dio.post(
      '$baseUrl/$endpoint',
      data: parameters,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${bearerToken ?? _defaultBearerToken}',
        },
      ),
    );

    return response;
  }
}
