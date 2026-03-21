import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/theme/app_theme.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';

/// Notifier factice pour les tests widget.
/// Démarre avec [AuthInitial] par défaut, sans dépendance au repository.
class FakeAuthNotifier extends Notifier<AuthState> implements AuthNotifier {
  @override
  AuthState build() => const AuthInitial();

  @override
  Future<void> checkAuthStatus() async {}

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {}

  @override
  Future<void> loginWithGoogle({required String idToken}) async {}

  @override
  Future<void> logout() async {}
}

/// Auth figée sur **non connecté** (garde GoRouter).
class UnauthenticatedAuthNotifier extends FakeAuthNotifier {
  @override
  AuthState build() => const Unauthenticated();
}

/// Profil minimal pour tests widget / navigation.
UserProfile testUserProfile({
  String id = 'test-user-id',
  String email = 'test@example.com',
  String? firstName = 'Test',
}) {
  final now = DateTime.utc(2024, 6, 1);
  return UserProfile(
    id: id,
    email: email,
    firstName: firstName,
    lastName: null,
    createdAt: now,
    updatedAt: now,
  );
}

/// Connecté au démarrage ; [logout] repasse en [Unauthenticated].
class AuthenticatedLogoutAuthNotifier extends Notifier<AuthState>
    implements AuthNotifier {
  @override
  AuthState build() => Authenticated(testUserProfile());

  @override
  Future<void> logout() async {
    state = const Unauthenticated();
  }

  @override
  Future<void> checkAuthStatus() async {}

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> loginWithGoogle({required String idToken}) async {}

  @override
  Future<void> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {}
}

/// Encapsule un widget dans l'environnement de test complet :
/// MaterialApp + thème dark + ProviderScope avec le fake auth.
Widget createTestApp(Widget child, {FakeAuthNotifier? authNotifier}) {
  final notifier = authNotifier ?? FakeAuthNotifier();

  return ProviderScope(
    overrides: [authProvider.overrideWith(() => notifier)],
    child: MaterialApp(theme: AppTheme.dark, home: child),
  );
}
