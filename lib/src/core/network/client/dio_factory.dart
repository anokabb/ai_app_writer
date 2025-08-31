import 'package:dio/dio.dart';

class DioFactory {
  static Dio create({
    required String baseUrl,
    List<Interceptor>? interceptors,
  }) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    final dio = Dio(options);

    dio.interceptors.addAll([
      if (interceptors != null) ...interceptors,
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);

    return dio;
  }
}
