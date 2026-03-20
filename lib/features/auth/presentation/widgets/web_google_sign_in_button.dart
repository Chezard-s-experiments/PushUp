import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/shared/services/google_sign_in_web_coordinator.dart';

import 'web_google_sign_in_button_impl_stub.dart'
    if (dart.library.js_util) 'web_google_sign_in_button_impl_web.dart'
    as impl;

/// Web : bouton GIS + init unique. Mobile : ne rien afficher (voir [SocialLoginButtons]).
class WebGoogleSignInButton extends ConsumerStatefulWidget {
  const WebGoogleSignInButton({
    required this.isLoading,
    required this.forSignUp,
    super.key,
  });

  final bool isLoading;
  final bool forSignUp;

  @override
  ConsumerState<WebGoogleSignInButton> createState() =>
      _WebGoogleSignInButtonState();
}

class _WebGoogleSignInButtonState extends ConsumerState<WebGoogleSignInButton> {
  bool _listenerAttached = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        ),
      );
    }

    return FutureBuilder<void>(
      future: GoogleSignInWebCoordinator.ensureInitialized(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text(
            'Connexion Google indisponible. Vérifie la config (client ID, origines).',
            style: AppTypography.body2.copyWith(color: AppColors.error),
            textAlign: TextAlign.center,
          );
        }
        if (!_listenerAttached) {
          _listenerAttached = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              GoogleSignInWebCoordinator.attachAuthListener(ref);
            }
          });
        }
        return impl.buildWebGoogleSignInButton(
          context,
          forSignUp: widget.forSignUp,
        );
      },
    );
  }
}
