import 'dart:async';

import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/auth/data/repositories/auth_repository_provider.dart';
import 'package:pushup_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

/// Notifier global de l'état d'authentification.
/// keepAlive car l'état auth persiste pendant toute la durée de vie de l'app.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.watch(authRepositoryProvider);
    return const AuthInitial();
  }

  /// Vérifie si un token existe et tente de récupérer le profil.
  /// Appelé au lancement de l'app (splash screen).
  Future<void> checkAuthStatus() async {
    state = const AuthLoading();

    final hasToken = await _repository.hasToken();
    if (!hasToken) {
      state = const Unauthenticated();
      return;
    }

    final result = await _repository.getCurrentUser();
    state = switch (result) {
      Success(:final data) => Authenticated(data),
      Error() => () {
        _repository.logout();
        return const Unauthenticated();
      }(),
    };
  }

  /// Connecte l'utilisateur avec email/mot de passe.
  Future<void> login({required String email, required String password}) async {
    state = const AuthLoading();

    final result = await _repository.login(email: email, password: password);

    state = switch (result) {
      Success(:final data) => Authenticated(data),
      Error(:final failure) => AuthError(
        failure.message ?? 'Erreur de connexion',
      ),
    };
  }

  /// Connecte l'utilisateur via Google OAuth.
  Future<void> loginWithGoogle({required String idToken}) async {
    state = const AuthLoading();

    final result = await _repository.loginWithGoogle(idToken: idToken);

    state = switch (result) {
      Success(:final data) => Authenticated(data),
      Error(:final failure) => AuthError(
        failure.message ?? 'Erreur de connexion via Google',
      ),
    };
  }

  /// Inscrit un nouvel utilisateur.
  Future<void> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    state = const AuthLoading();

    final result = await _repository.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    state = switch (result) {
      Success(:final data) => Authenticated(data),
      Error(:final failure) => AuthError(
        failure.message ?? "Erreur d'inscription",
      ),
    };
  }

  /// Déconnecte l'utilisateur (supprime les tokens).
  Future<void> logout() async {
    await _repository.logout();
    state = const Unauthenticated();
  }
}
