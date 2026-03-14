import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/router/app_router.dart';
import 'package:pushup_hub/core/theme/app_theme.dart';

/// Widget racine de l'application PushUp Hub.
/// ConsumerWidget pour accéder aux providers Riverpod.
class PushUpHubApp extends ConsumerWidget {
  const PushUpHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'PushUp Hub',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.dark,
    );
  }
}
