import 'package:pushup_hub/features/auth/data/models/user_profile.dart';

/// États possibles de l'authentification.
sealed class AuthState {
  const AuthState();
}

/// État initial — vérification du token en cours.
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Chargement en cours (login, register, refresh...).
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Utilisateur authentifié avec son profil chargé.
class Authenticated extends AuthState {
  final UserProfile user;
  const Authenticated(this.user);
}

/// Utilisateur non authentifié (pas de token ou token invalide).
class Unauthenticated extends AuthState {
  const Unauthenticated();
}

/// Erreur d'authentification avec message affichable.
class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}
