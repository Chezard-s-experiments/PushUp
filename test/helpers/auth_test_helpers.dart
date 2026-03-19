import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/theme/app_theme.dart';
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

/// Encapsule un widget dans l'environnement de test complet :
/// MaterialApp + thème dark + ProviderScope avec le fake auth.
Widget createTestApp(Widget child, {FakeAuthNotifier? authNotifier}) {
  final notifier = authNotifier ?? FakeAuthNotifier();

  return ProviderScope(
    overrides: [authProvider.overrideWith(() => notifier)],
    child: MaterialApp(theme: AppTheme.dark, home: child),
  );
}
