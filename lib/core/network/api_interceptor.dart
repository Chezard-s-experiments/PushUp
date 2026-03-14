import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pushup_hub/core/constants/storage_keys.dart';

/// Intercepteur d'authentification JWT.
/// Attache le token à chaque requête et gèrera le refresh sur 401.
/// Utilise QueuedInterceptorsWrapper pour sérialiser les appels
/// (évite des refresh multiples simultanés).
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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // TODO: Implémenter le refresh token avec la feature auth
      // 1. Lire le refresh token depuis le storage
      // 2. Appeler POST /auth/refresh
      // 3. Si succès : sauvegarder le nouveau token, retry la requête
      // 4. Si échec : supprimer les tokens, rediriger vers login
    }
    handler.next(err);
  }
}
