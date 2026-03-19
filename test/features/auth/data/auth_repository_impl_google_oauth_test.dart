import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pushup_hub/core/constants/storage_keys.dart';
import 'package:pushup_hub/core/errors/exceptions.dart';
import 'package:pushup_hub/core/errors/failures.dart';
import 'package:pushup_hub/core/utils/result.dart' as result;
import 'package:pushup_hub/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pushup_hub/features/auth/data/models/access_token_payload.dart';
import 'package:pushup_hub/features/auth/data/models/auth_response.dart';
import 'package:pushup_hub/features/auth/data/models/oauth_request.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';
import 'package:pushup_hub/features/auth/data/repositories/auth_repository_impl.dart';

class _FakeRemoteDataSource extends AuthRemoteDataSource {
  _FakeRemoteDataSource() : super(Dio());

  AuthResponse? oauthResponse;
  Exception? oauthError;

  @override
  Future<AuthResponse> oauthLogin(OAuthRequest request) async {
    if (oauthError != null) {
      throw oauthError!;
    }
    return oauthResponse!;
  }
}

class _FakeSecureStorage extends FlutterSecureStorage {
  final Map<String, String> values = {};

  @override
  Future<void> write({
    required String key,
    required String? value,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (value != null) {
      values[key] = value;
    }
  }
}

void main() {
  late _FakeRemoteDataSource remoteDataSource;
  late _FakeSecureStorage secureStorage;
  late AuthRepositoryImpl repository;

  const accessToken = 'access';
  const refreshToken = 'refresh';
  final user = UserProfile(
    id: 'id',
    email: 'user@example.com',
    firstName: 'John',
    lastName: 'Doe',
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 1, 1),
  );

  setUp(() {
    remoteDataSource = _FakeRemoteDataSource();
    secureStorage = _FakeSecureStorage();
    repository = AuthRepositoryImpl(
      remoteDataSource: remoteDataSource,
      secureStorage: secureStorage,
    );
  });

  group('loginWithGoogle', () {
    test('should return Success and save tokens when remote call succeeds', () async {
      final response = AuthResponse(
        token: AccessTokenPayload(
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenType: 'bearer',
        ),
        user: user,
      );

      remoteDataSource.oauthResponse = response;

      final loginResult = await repository.loginWithGoogle(idToken: 'idToken');

      expect(loginResult, isA<result.Success<UserProfile>>());
      expect((loginResult as result.Success<UserProfile>).data, user);
      expect(secureStorage.values[StorageKeys.accessToken], accessToken);
      expect(secureStorage.values[StorageKeys.refreshToken], refreshToken);
    });

    test('should return Error(NetworkFailure) when NetworkException thrown', () async {
      remoteDataSource.oauthError = NetworkException(message: 'no network');

      final loginResult = await repository.loginWithGoogle(idToken: 'idToken');

      expect(loginResult, isA<result.Error<UserProfile>>());
      expect(
        (loginResult as result.Error<UserProfile>).failure,
        isA<NetworkFailure>(),
      );
    });

    test('should map ServerException 401 to AuthFailure', () async {
      remoteDataSource.oauthError = ServerException(
        statusCode: 401,
        message: 'unauthorized',
      );

      final loginResult = await repository.loginWithGoogle(idToken: 'idToken');

      expect(loginResult, isA<result.Error<UserProfile>>());
      expect(
        (loginResult as result.Error<UserProfile>).failure,
        isA<AuthFailure>(),
      );
    });
  });
}

