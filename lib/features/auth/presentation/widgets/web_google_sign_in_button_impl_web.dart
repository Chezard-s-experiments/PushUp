import 'package:flutter/material.dart';
import 'package:google_sign_in_web/web_only.dart';

/// Bouton Google Identity Services (obligatoire sur le web à la place de [authenticate]).
Widget buildWebGoogleSignInButton(
  BuildContext context, {
  required bool forSignUp,
}) {
  final screenW = MediaQuery.sizeOf(context).width;
  final w = screenW > 400 ? 400.0 : screenW;

  return SizedBox(
    width: double.infinity,
    child: Align(
      child: SizedBox(
        width: w,
        child: renderButton(
          configuration: GSIButtonConfiguration(
            type: GSIButtonType.standard,
            theme: GSIButtonTheme.filledBlack,
            size: GSIButtonSize.large,
            text: forSignUp
                ? GSIButtonText.signupWith
                : GSIButtonText.continueWith,
            shape: GSIButtonShape.rectangular,
            minimumWidth: w,
            locale: 'fr',
          ),
        ),
      ),
    ),
  );
}
