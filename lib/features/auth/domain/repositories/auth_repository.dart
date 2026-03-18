import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';

/// Contrat du repository d'authentification (couche Domain).
/// Retourne [Result<T>] : [Success] avec la donnée ou [Error] avec un [Failure].
abstract class AuthRepository {
  /// Inscrit un nouvel utilisateur et stocke les tokens.
  Future<Result<UserProfile>> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  });

  /// Connecte un utilisateur existant et stocke les tokens.
  Future<Result<UserProfile>> login({
    required String email,
    required String password,
  });

  /// Récupère le profil de l'utilisateur courant via le token stocké.
  Future<Result<UserProfile>> getCurrentUser();

  /// Rafraîchit le couple access/refresh token.
  Future<Result<void>> refreshToken();

  /// Supprime les tokens stockés (déconnexion locale).
  Future<void> logout();

  /// Vérifie si un token d'accès est présent en storage.
  Future<bool> hasToken();
}
