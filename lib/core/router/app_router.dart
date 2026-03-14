import 'package:go_router/go_router.dart';
import 'package:pushup_hub/core/router/routes.dart';
import 'package:pushup_hub/features/home/presentation/pages/dashboard_page.dart';
import 'package:pushup_hub/features/onboarding/presentation/pages/splash_page.dart';
import 'package:pushup_hub/features/profile/presentation/pages/profile_page.dart';
import 'package:pushup_hub/features/programs/presentation/pages/programs_page.dart';
import 'package:pushup_hub/features/progression/presentation/pages/progression_page.dart';
import 'package:pushup_hub/features/sessions/presentation/pages/history_page.dart';
import 'package:pushup_hub/shared/widgets/app_bottom_nav_shell.dart';

/// Routeur principal de l'application.
/// Navigation : 4 onglets + FAB central (cf. design.md §8)
final appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),

    // Historique en plein écran (accessible depuis l'accueil et les programmes)
    GoRoute(
      path: Routes.history,
      builder: (context, state) => const HistoryPage(),
    ),

    // Navigation principale : 4 onglets avec bottom bar + FAB central
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
