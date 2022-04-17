import 'package:dio/dio.dart';
import 'package:wallet/services/global/api_contants.dart';
import 'package:wallet/services/http/dio_interceptor.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(
    baseUrl: ApiContants.baseUrl,
  ));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      headers: {'Content-Type': 'application/json'},
      baseUrl: ApiContants.baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.addAll({
      DioInterceptor(dio),
    });
    return dio;
  }
}
