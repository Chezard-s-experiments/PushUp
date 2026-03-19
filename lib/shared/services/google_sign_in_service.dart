import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_sign_in_service.g.dart';

/// Exception métier pour les erreurs techniques liées à Google Sign-In.
class GoogleSignInException implements Exception {
  GoogleSignInException({this.message});

  final String? message;

  @override
  String toString() => 'GoogleSignInException(message: $message)';
}

/// Service qui encapsule le plugin [GoogleSignIn] et renvoie uniquement un idToken.
///
/// - Retourne l'idToken si l'utilisateur termine le flow.
/// - Retourne `null` si l'utilisateur annule la connexion.
/// - Lève [GoogleSignInException] pour les erreurs techniques.
class GoogleSignInService {
  GoogleSignInService(this._googleSignIn);

  final GoogleSignIn _googleSignIn;

  Future<String?> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        // Annulation utilisateur → on remonte null (retour silencieux côté UI).
        return null;
      }

      final auth = await account.authentication;
      final idToken = auth.idToken;

      if (idToken == null) {
        throw GoogleSignInException(message: 'Missing idToken from Google');
      }

      return idToken;
    } on GoogleSignInException {
      rethrow;
    } catch (e) {
      throw GoogleSignInException(message: e.toString());
    }
  }
}

@riverpod
GoogleSignInService googleSignInService(GoogleSignInServiceRef ref) {
  final googleSignIn = GoogleSignIn();
  return GoogleSignInService(googleSignIn);
}

