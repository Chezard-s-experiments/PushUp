import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart' as g;

/// Exception métier pour les erreurs techniques liées à Google Sign-In.
class AppGoogleSignInException implements Exception {
  AppGoogleSignInException({this.message});

  final String? message;

  @override
  String toString() => 'AppGoogleSignInException(message: $message)';
}

abstract class GoogleSignInClient {
  Future<void> initialize();

  Future<g.GoogleSignInAccount> authenticate();
}

class PluginGoogleSignInClient implements GoogleSignInClient {
  PluginGoogleSignInClient(this._googleSignIn);

  final g.GoogleSignIn _googleSignIn;

  @override
  Future<void> initialize() => _googleSignIn.initialize();

  @override
  Future<g.GoogleSignInAccount> authenticate() => _googleSignIn.authenticate();
}

/// Service qui encapsule le plugin [GoogleSignIn] et renvoie uniquement un idToken.
///
/// - Retourne l'idToken si l'utilisateur termine le flow.
/// - Retourne `null` si l'utilisateur annule la connexion.
/// - Lève [AppGoogleSignInException] pour les erreurs techniques.
class GoogleSignInService {
  GoogleSignInService(this._client);

  final GoogleSignInClient _client;

  Future<String?> signIn() async {
    try {
      await _client.initialize();
      final account = await _client.authenticate();

      final auth = account.authentication;
      final idToken = auth.idToken;

      if (idToken == null) {
        throw AppGoogleSignInException(message: 'Missing idToken from Google');
      }

      return idToken;
    } on AppGoogleSignInException {
      rethrow;
    } on g.GoogleSignInException catch (e) {
      switch (e.code) {
        case g.GoogleSignInExceptionCode.canceled:
        case g.GoogleSignInExceptionCode.interrupted:
        case g.GoogleSignInExceptionCode.uiUnavailable:
          return null;
        default:
          throw AppGoogleSignInException(message: e.toString());
      }
    } catch (e) {
      throw AppGoogleSignInException(message: e.toString());
    }
  }
}

final googleSignInServiceProvider = Provider<GoogleSignInService>((ref) {
  return GoogleSignInService(
    PluginGoogleSignInClient(g.GoogleSignIn.instance),
  );
});

