import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:pushup_hub/core/router/routes.dart';
import 'package:pushup_hub/features/auth/presentation/pages/login_page.dart';
import 'package:pushup_hub/features/auth/presentation/pages/register_page.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_state.dart';
import 'package:pushup_hub/features/home/presentation/pages/dashboard_page.dart';
import 'package:pushup_hub/features/onboarding/presentation/pages/splash_page.dart';
import 'package:pushup_hub/features/profile/presentation/pages/profile_page.dart';
import 'package:pushup_hub/features/programs/presentation/pages/programs_page.dart';
import 'package:pushup_hub/features/progression/presentation/pages/progression_page.dart';
import 'package:pushup_hub/features/sessions/presentation/pages/history_page.dart';
import 'package:pushup_hub/shared/widgets/app_bottom_nav_shell.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Routes réservées aux utilisateurs non-authentifiés.
const _authRoutes = {Routes.login, Routes.register};

/// Routeur principal de l'application.
/// Provider Riverpod pour accéder à l'état auth dans le redirect.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authNotifier = ValueNotifier<AuthState>(ref.read(authProvider));

  ref.listen<AuthState>(authProvider, (_, next) {
    authNotifier.value = next;
  });

  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = authNotifier.value;
      final currentPath = state.matchedLocation;
      final isOnSplash = currentPath == Routes.splash;
      final isOnAuthRoute = _authRoutes.contains(currentPath);

      // Vérification en cours → rester sur la page actuelle
      if (authState is AuthInitial || authState is AuthLoading) {
        return null;
      }

      // Connecté → quitter splash et les pages auth
      if (authState is Authenticated) {
        if (isOnSplash || isOnAuthRoute) return Routes.dashboard;
        return null;
      }

      // Non connecté → aller vers login (sauf si déjà sur login/register)
      if (authState is Unauthenticated || authState is AuthError) {
        if (!isOnAuthRoute) return Routes.login;
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterPage(),
      ),

      GoRoute(
        path: Routes.history,
        builder: (context, state) => const HistoryPage(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppBottomNavShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.dashboard,
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.programs,
                builder: (context, state) => const ProgramsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.progression,
                builder: (context, state) => const ProgressionPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
