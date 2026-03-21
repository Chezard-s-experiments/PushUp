import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/core/utils/user_display_name.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:pushup_hub/shared/widgets/app_button.dart';

/// Profil — compte et déconnexion (Phase 1).
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(title: const Text('Profil')),
      body: switch (authState) {
        Authenticated(:final user) => _ProfileContent(
            displayName: userProfileDisplayName(user),
            email: user.email,
            onLogout: () => ref.read(authProvider.notifier).logout(),
          ),
        _ => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
      },
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final String displayName;
  final String email;
  final VoidCallback onLogout;

  const _ProfileContent({
    required this.displayName,
    required this.email,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bgSurface,
                border: Border.all(color: AppColors.border),
              ),
              alignment: Alignment.center,
              child: Icon(
                PhosphorIcons.userCircle(PhosphorIconsStyle.duotone),
                size: 48,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            displayName,
            textAlign: TextAlign.center,
            style: AppTypography.h2,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            email,
            textAlign: TextAlign.center,
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.xxl),
          AppButton(
            label: 'Déconnexion',
            variant: AppButtonVariant.danger,
            icon: PhosphorIcons.signOut(PhosphorIconsStyle.bold),
            onPressed: onLogout,
          ),
        ],
      ),
    );
  }
}
