import 'package:dio/dio.dart';
import 'package:nba_teams/src/config.dart';

class DioServiceProvider {
  Dio _dio;

  static DioServiceProvider _instance;

  DioServiceProvider._();

  factory DioServiceProvider() {
    _instance ??= DioServiceProvider._();
    return _instance;
  }

  Dio get dio => _initDio();

  Dio _initDio() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: HOST,
      );
      _dio = Dio(options);
    }

    return _dio;
  }
}
