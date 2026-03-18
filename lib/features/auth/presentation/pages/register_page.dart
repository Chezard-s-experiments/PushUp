import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pushup_hub/core/router/routes.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:pushup_hub/shared/widgets/app_button.dart';
import 'package:pushup_hub/shared/widgets/app_snackbar.dart';
import 'package:pushup_hub/shared/widgets/app_text_field.dart';

/// Écran d'inscription email/mot de passe — cf. issue auth Phase 1.
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    'Crée ton compte',
                    style: AppTypography.body1.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _firstNameController,
                          label: 'Prénom',
                          hint: 'Jean',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: AppTextField(
                          controller: _lastNameController,
                          label: 'Nom',
                          hint: 'Dupont',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),

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
                  const SizedBox(height: AppSpacing.md),

                  AppTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirmer le mot de passe',
                    obscureText: _obscureConfirm,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() => _obscureConfirm = !_obscureConfirm);
                      },
                    ),
                    validator: _validateConfirmPassword,
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  AppButton(
                    label: "S'inscrire",
                    isLoading: isLoading,
                    onPressed: isLoading ? null : _onRegister,
                  ),
                  const SizedBox(height: AppSpacing.md),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Déjà un compte ? ',
                        style: AppTypography.body2.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.go(Routes.login),
                        child: Text(
                          'Se connecter',
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

  void _onRegister() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(authProvider.notifier).register(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          firstName: _firstNameController.text.trim().isNotEmpty
              ? _firstNameController.text.trim()
              : null,
          lastName: _lastNameController.text.trim().isNotEmpty
              ? _lastNameController.text.trim()
              : null,
        );
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirmation requise';
    }
    if (value != _passwordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }
}
