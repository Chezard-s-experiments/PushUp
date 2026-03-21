import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:pushup_hub/features/home/presentation/widgets/dashboard_next_session_card.dart';
import 'package:pushup_hub/features/home/presentation/widgets/dashboard_progress_summary_card.dart';

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

/// Nom affiché après « Salut, » — prénom si présent, sinon partie locale de l’email.
String welcomeDisplayName(UserProfile user) {
  final first = user.firstName?.trim();
  if (first != null && first.isNotEmpty) return first;
  final email = user.email.trim();
  final at = email.indexOf('@');
  if (at > 0) return email.substring(0, at);
  return email.isNotEmpty ? email : 'Athlète';
}

class _WelcomeHeader extends StatelessWidget {
  final AuthState authState;

  const _WelcomeHeader({required this.authState});

  @override
  Widget build(BuildContext context) {
    final text = switch (authState) {
      Authenticated(:final user) => 'Salut, ${welcomeDisplayName(user)}',
      AuthLoading() => 'Salut…',
      _ => 'Salut',
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            style: AppTypography.body1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (authState is AuthLoading)
          const Padding(
            padding: EdgeInsets.only(left: AppSpacing.sm),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}
