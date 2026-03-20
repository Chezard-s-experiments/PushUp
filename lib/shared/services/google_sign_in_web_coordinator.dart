import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/shared/services/google_sign_in_service.dart';

/// Web : une seule [GoogleSignIn.initialize] + écoute [authenticationEvents].
/// Le bouton officiel est [renderButton] (pas [authenticate]).
class GoogleSignInWebCoordinator {
  GoogleSignInWebCoordinator._();

  static Future<void>? _initFuture;
  static bool _listenerAttached = false;

  static Future<void> ensureInitialized() {
    if (!kIsWeb) return Future.value();
    _initFuture ??= _init();
    return _initFuture!;
  }

  static Future<void> _init() async {
    final c = GoogleSignIn.instance;
    await c.initialize(
      clientId: kGoogleWebClientId.isNotEmpty ? kGoogleWebClientId : null,
    );
    await c.attemptLightweightAuthentication();
  }

  /// À appeler une fois après [ensureInitialized] (ex. premier [FutureBuilder] succès).
  static void attachAuthListener(WidgetRef ref) {
    if (!kIsWeb || _listenerAttached) return;
    _listenerAttached = true;
    GoogleSignIn.instance.authenticationEvents.listen((event) async {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        final idToken = event.user.authentication.idToken;
        if (idToken != null) {
          await ref
              .read(authProvider.notifier)
              .loginWithGoogle(idToken: idToken);
        }
      }
    });
  }
}
