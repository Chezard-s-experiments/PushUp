import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pushup_hub/core/router/routes.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:pushup_hub/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:pushup_hub/shared/services/google_sign_in_service.dart';
import 'package:pushup_hub/shared/widgets/app_button.dart';
import 'package:pushup_hub/shared/widgets/app_snackbar.dart';
import 'package:pushup_hub/shared/widgets/app_text_field.dart';

/// Écran de connexion email/mot de passe — cf. issue auth Phase 1.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState is AuthLoading;

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is AuthError) {
        showAppSnackBar(context, message: next.message);
      }
      if (next is Authenticated) {
        context.go(Routes.dashboard);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Pushup',
                    style: AppTypography.display.copyWith(
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Content de te revoir !',
                    style: AppTypography.body1.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  AppTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'ton@email.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: AppSpacing.md),

                  AppTextField(
                    controller: _passwordController,
                    label: 'Mot de passe',
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  AppButton(
                    label: 'Se connecter',
                    isLoading: isLoading,
                    onPressed: isLoading ? null : _onLogin,
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  SocialLoginButtons(
                    isLoading: isLoading,
                    onGooglePressed: isLoading ? null : _onGoogleLogin,
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pas de compte ? ',
                        style: AppTypography.body2.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.go(Routes.register),
                        child: Text(
                          "S'inscrire",
                          style: AppTypography.body2.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    if (!_formKey.currentState!.validate()) return;

    ref
        .read(authProvider.notifier)
        .login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  Future<void> _onGoogleLogin() async {
    final googleService = ref.read(googleSignInServiceProvider);
    final authNotifier = ref.read(authProvider.notifier);

    try {
      final idToken = await googleService.signIn();
      if (!mounted || idToken == null) {
        // Annulation utilisateur → retour silencieux.
        return;
      }

      await authNotifier.loginWithGoogle(idToken: idToken);
    } on AppGoogleSignInException catch (e) {
      showAppSnackBar(
        context,
        message: e.message ?? 'Impossible de te connecter via Google.',
      );
    } catch (_) {
      showAppSnackBar(
        context,
        message: 'Impossible de te connecter via Google.',
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email requis';
    }
    final emailRegex = RegExp(r'^[\w\-.+]+@([\w-]+\.)+[\w-]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Format email invalide';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mot de passe requis';
    }
    if (value.length < 8) {
      return '8 caractères minimum';
    }
    return null;
  }
}
