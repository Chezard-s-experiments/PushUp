import 'package:dio/dio.dart';
import 'package:pushup_hub/core/config/env_config.dart';
import 'package:pushup_hub/core/network/api_interceptor.dart';

/// Crée et configure l'instance Dio avec les intercepteurs.
Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(),
    if (EnvConfig.enableLogging)
      LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}
