import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pushup_hub/core/constants/storage_keys.dart';
import 'package:pushup_hub/core/errors/exceptions.dart';
import 'package:pushup_hub/core/errors/failures.dart';
import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pushup_hub/features/auth/data/models/login_request.dart';
import 'package:pushup_hub/features/auth/data/models/refresh_request.dart';
import 'package:pushup_hub/features/auth/data/models/register_request.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';
import 'package:pushup_hub/features/auth/domain/repositories/auth_repository.dart';

/// Implémentation du repository auth.
/// Orchestre les appels API et la persistance sécurisée des tokens.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required FlutterSecureStorage secureStorage,
  }) : _remoteDataSource = remoteDataSource,
       _secureStorage = secureStorage;

  @override
  Future<Result<UserProfile>> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final response = await _remoteDataSource.register(
        RegisterRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        ),
      );
      await _saveTokens(
        accessToken: response.token.accessToken,
        refreshToken: response.token.refreshToken,
      );
      return Success(response.user);
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Error(_mapServerFailure(e));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<UserProfile>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        LoginRequest(email: email, password: password),
      );
      await _saveTokens(
        accessToken: response.token.accessToken,
        refreshToken: response.token.refreshToken,
      );
      return Success(response.user);
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Error(_mapServerFailure(e));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<UserProfile>> getCurrentUser() async {
    try {
      final user = await _remoteDataSource.me();
      return Success(user);
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Error(_mapServerFailure(e));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> refreshToken() async {
    try {
      final storedRefresh = await _secureStorage.read(
        key: StorageKeys.refreshToken,
      );
      if (storedRefresh == null) {
        return const Error(AuthFailure(message: 'No refresh token stored'));
      }

      final payload = await _remoteDataSource.refresh(
        RefreshRequest(refreshToken: storedRefresh),
      );
      await _saveTokens(
        accessToken: payload.accessToken,
        refreshToken: payload.refreshToken,
      );
      return const Success(null);
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        await logout();
        return const Error(AuthFailure(message: 'Session expired'));
      }
      return Error(_mapServerFailure(e));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await _secureStorage.delete(key: StorageKeys.accessToken);
    await _secureStorage.delete(key: StorageKeys.refreshToken);
    await _secureStorage.delete(key: StorageKeys.userId);
  }

  @override
  Future<bool> hasToken() async {
    final token = await _secureStorage.read(key: StorageKeys.accessToken);
    return token != null;
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(
      key: StorageKeys.accessToken,
      value: accessToken,
    );
    await _secureStorage.write(
      key: StorageKeys.refreshToken,
      value: refreshToken,
    );
  }

  /// Mappe un [ServerException] vers le [Failure] approprié selon le status code.
  Failure _mapServerFailure(ServerException e) {
    return switch (e.statusCode) {
      401 => AuthFailure(message: e.message),
      _ => ServerFailure(statusCode: e.statusCode, message: e.message),
    };
  }
}
