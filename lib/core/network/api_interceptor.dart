import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pushup_hub/core/config/env_config.dart';
import 'package:pushup_hub/core/constants/storage_keys.dart';

/// Intercepteur d'authentification JWT.
/// Attache le token à chaque requête et gère le refresh automatique sur 401.
/// QueuedInterceptorsWrapper sérialise les appels pour éviter
/// des refresh multiples simultanés.
class AuthInterceptor extends QueuedInterceptorsWrapper {
  static const _storage = FlutterSecureStorage();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: StorageKeys.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Ne pas tenter de refresh sur la route refresh elle-même (boucle infinie)
    if (err.requestOptions.path == '/auth/refresh') {
      await _clearTokens();
      return handler.next(err);
    }

    try {
      final refreshToken = await _storage.read(key: StorageKeys.refreshToken);
      if (refreshToken == null) {
        await _clearTokens();
        return handler.next(err);
      }

      final refreshDio = Dio(
        BaseOptions(
          baseUrl: EnvConfig.apiBaseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final response = await refreshDio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newAccessToken = response.data['access_token'] as String;
      final newRefreshToken = response.data['refresh_token'] as String;

      await _storage.write(key: StorageKeys.accessToken, value: newAccessToken);
      await _storage.write(
        key: StorageKeys.refreshToken,
        value: newRefreshToken,
      );

      // Retry la requête originale avec le nouveau token
      final retryOptions = err.requestOptions;
      retryOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      final retryResponse = await refreshDio.fetch(retryOptions);
      return handler.resolve(retryResponse);
    } on DioException {
      await _clearTokens();
      return handler.next(err);
    }
  }

  Future<void> _clearTokens() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.refreshToken);
    await _storage.delete(key: StorageKeys.userId);
  }
}
