import 'package:flutter/material.dart';

/// Palette de couleurs "Dark Athletic" — cf. design.md §2
abstract final class AppColors {
  // Backgrounds (système d'élévation)
  static const Color bgPrimary = Color(0xFF0D0D0F);
  static const Color bgSurface = Color(0xFF1A1A2E);
  static const Color bgElevated = Color(0xFF252540);
  static const Color bgPopup = Color(0xFF2F2F4A);

  // Brand
  static const Color primary = Color(0xFFFF6B2C);
  static const Color secondary = Color(0xFF3A86FF);
  static const Color accent = Color(0xFF00C853);

  // Feedback
  static const Color error = Color(0xFFFF3B3B);
  static const Color warning = Color(0xFFFFB800);

  // Text
  static const Color textPrimary = Color(0xFFF5F5F7);
  static const Color textSecondary = Color(0xFF9999AA);

  // Borders
  static const Color border = Color(0x0FFFFFFF);
  static const Color inputBorder = Color(0xFF333355);

  // Paliers de gamification
  static const Color tierBronze = Color(0xFFCD7F32);
  static const Color tierBronzeAlt = Color(0xFFA0522D);
  static const Color tierSilver = Color(0xFFC0C0C0);
  static const Color tierSilverAlt = Color(0xFFA8A8A8);
  static const Color tierGold = Color(0xFFFFD700);
  static const Color tierGoldAlt = Color(0xFFDAA520);
  static const Color tierDiamond = Color(0xFFB9F2FF);
  static const Color tierDiamondAlt = Color(0xFF7DF9FF);
  static const Color tierPlatinum = Color(0xFFE5E4E2);
  static const Color tierPlatinumAlt = Color(0xFFD4D4D2);
  static const Color tierMasterDark = Color(0xFF1A1A2E);
  static const Color tierMasterGold = Color(0xFFFFD700);

  // Light mode (secondaire)
  static const Color lightBgPrimary = Color(0xFFF7F7FA);
  static const Color lightBgSurface = Color(0xFFFFFFFF);
  static const Color lightBgElevated = Color(0xFFEEEEF2);
  static const Color lightTextPrimary = Color(0xFF1A1A2E);
  static const Color lightTextSecondary = Color(0xFF6B6B80);
}
