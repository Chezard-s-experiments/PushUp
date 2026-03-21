import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pushup_hub/core/router/app_router.dart';
import 'package:pushup_hub/core/theme/app_theme.dart';
import 'package:pushup_hub/features/auth/presentation/providers/auth_notifier.dart';

import '../../helpers/auth_test_helpers.dart';

void main() {
  group('Navigation auth (GoRouter)', () {
    testWidgets('redirige vers login si non connecté', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authProvider.overrideWith(() => UnauthenticatedAuthNotifier()),
          ],
          child: const _MaterialRouterApp(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.text('Se connecter'), findsOneWidget);
    });

    testWidgets('déconnexion depuis Profil renvoie vers login', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authProvider.overrideWith(() => AuthenticatedLogoutAuthNotifier()),
          ],
          child: const _MaterialRouterApp(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(find.text('Profil'));
      await tester.pumpAndSettle();

      expect(find.text('Déconnexion'), findsOneWidget);

      await tester.tap(find.text('Déconnexion'));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.text('Se connecter'), findsOneWidget);
    });
  });
}

class _MaterialRouterApp extends ConsumerWidget {
  const _MaterialRouterApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
