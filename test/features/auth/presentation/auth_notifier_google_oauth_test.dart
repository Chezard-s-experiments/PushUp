import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/errors/failures.dart';
import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';
import 'package:pushup_hub/features/auth/data/repositories/auth_repository_provider.dart';
import 'package:pushup_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository({required this.googleLoginResult});

  Result<UserProfile> googleLoginResult;

  @override
  Future<Result<UserProfile>> loginWithGoogle({required String idToken}) async {
    return googleLoginResult;
  }

  @override
  Future<Result<UserProfile>> getCurrentUser() async {
    throw UnimplementedError();
  }

  @override
  Future<bool> hasToken() async {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserProfile>> login({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {}

  @override
  Future<Result<void>> refreshToken() async {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserProfile>> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    throw UnimplementedError();
  }
}

void main() {
  late _FakeAuthRepository repository;
  late ProviderContainer container;

  final user = UserProfile(
    id: 'id',
    email: 'user@example.com',
    firstName: 'John',
    lastName: 'Doe',
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 1, 1),
  );

  setUp(() {
    repository = _FakeAuthRepository(googleLoginResult: Success(user));
    container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWith((ref) => repository)],
    );
  });

  group('loginWithGoogle', () {
    test('sets Authenticated on success', () async {
      final notifier = container.read(authProvider.notifier);

      await notifier.loginWithGoogle(idToken: 'idToken');

      expect(container.read(authProvider), isA<Authenticated>());
    });

    test('sets AuthError on failure', () async {
      repository.googleLoginResult = const Error(AuthFailure(message: 'error'));
      final notifier = container.read(authProvider.notifier);

      await notifier.loginWithGoogle(idToken: 'idToken');

      expect(container.read(authProvider), isA<AuthError>());
    });
  });
}
