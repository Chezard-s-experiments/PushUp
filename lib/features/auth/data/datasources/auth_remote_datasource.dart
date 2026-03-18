import 'package:dio/dio.dart';
import 'package:pushup_hub/core/errors/exceptions.dart';
import 'package:pushup_hub/features/auth/data/models/access_token_payload.dart';
import 'package:pushup_hub/features/auth/data/models/auth_response.dart';
import 'package:pushup_hub/features/auth/data/models/login_request.dart';
import 'package:pushup_hub/features/auth/data/models/refresh_request.dart';
import 'package:pushup_hub/features/auth/data/models/register_request.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';

/// Source de données distante pour l'authentification.
/// Toutes les méthodes lèvent [ServerException] ou [NetworkException]
/// en cas d'erreur — le repository les convertira en [Failure].
class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  /// POST /auth/register → AuthResponse (201)
  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// POST /auth/login → AuthResponse (200)
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// GET /auth/me → UserProfile (200)
  Future<UserProfile> me() async {
    try {
      final response = await _dio.get('/auth/me');
      return UserProfile.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// POST /auth/refresh → AccessTokenPayload (200)
  Future<AccessTokenPayload> refresh(RefreshRequest request) async {
    try {
      final response = await _dio.post(
        '/auth/refresh',
        data: request.toJson(),
      );
      return AccessTokenPayload.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// Convertit une [DioException] en exception métier du projet.
  Exception _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkException(message: e.message);
    }

    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    String? message;
    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? data['detail'] as String?;
    }

    return ServerException(statusCode: statusCode, message: message);
  }
}
