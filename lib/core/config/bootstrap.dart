import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/app.dart';

/// Point d'entrée commun à tous les environnements.
/// Initialise Flutter, encapsule l'app dans ProviderScope (Riverpod)
/// et lance l'application.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: PushupApp(),
    ),
  );
}
