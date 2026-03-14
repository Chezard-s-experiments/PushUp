import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushup_hub/core/router/app_router.dart';

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
      theme: _darkTheme,
    );
  }
}

/// Thème sombre "Midnight Athlete" — cf. design.md
final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF0D0D0F),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFFF6B2C),
    secondary: Color(0xFF3A86FF),
    surface: Color(0xFF1A1A2E),
    error: Color(0xFFFF3B3B),
    onPrimary: Colors.white,
    onSurface: Color(0xFFF5F5F7),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF0D0D0F),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF5F5F7),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFF5F5F7)),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.outfit(
      fontSize: 48,
      fontWeight: FontWeight.w800,
      color: const Color(0xFFF5F5F7),
    ),
    headlineLarge: GoogleFonts.outfit(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFF5F5F7),
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF5F5F7),
    ),
    headlineSmall: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF5F5F7),
    ),
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFF5F5F7),
    ),
    bodyMedium: GoogleFonts.dmSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFF5F5F7),
    ),
    bodySmall: GoogleFonts.dmSans(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF9999AA),
    ),
    labelLarge: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
