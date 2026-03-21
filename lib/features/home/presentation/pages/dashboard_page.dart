import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/core/utils/user_display_name.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:pushup_hub/features/home/presentation/widgets/dashboard_next_session_card.dart';
import 'package:pushup_hub/features/home/presentation/widgets/dashboard_progress_summary_card.dart';
import 'package:pushup_hub/shared/widgets/app_snackbar.dart';

/// Page d'accueil — hub Phase 1.
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _WelcomeHeader(authState: authState),
              const SizedBox(height: AppSpacing.lg),
              const DashboardProgressSummaryCard(),
              const SizedBox(height: AppSpacing.md),
              const DashboardNextSessionCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  final AuthState authState;

  const _WelcomeHeader({required this.authState});

  @override
  Widget build(BuildContext context) {
    final text = switch (authState) {
      Authenticated(:final user) => 'Salut, ${userProfileDisplayName(user)}',
      AuthLoading() => 'Salut…',
      _ => 'Salut',
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            text,
            style: AppTypography.body1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (authState is AuthLoading) ...[
          const SizedBox(width: AppSpacing.sm),
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        ],
        if (authState is Authenticated) ...[
          const SizedBox(width: AppSpacing.xs),
          _HomeAppBarIconButton(
            tooltip: 'Palier (aperçu)',
            icon: PhosphorIcons.medal(PhosphorIconsStyle.duotone),
            color: AppColors.tierBronze,
            onPressed: () => showAppSnackBar(
              context,
              message: 'Détail du palier — à venir',
              accentColor: AppColors.primary,
            ),
          ),
          _HomeAppBarIconButton(
            tooltip: 'Notifications',
            icon: PhosphorIcons.bell(PhosphorIconsStyle.regular),
            color: AppColors.textSecondary,
            onPressed: () => showAppSnackBar(
              context,
              message: 'Notifications — à venir',
              accentColor: AppColors.secondary,
            ),
          ),
        ],
      ],
    );
  }
}

/// Icône 24px, cible 48×48 — cf. design.md §8 (App Bar) et §6 (touch target).
class _HomeAppBarIconButton extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _HomeAppBarIconButton({
    required this.tooltip,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 24, color: color),
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          foregroundColor: color,
        ),
      ),
    );
  }
}
