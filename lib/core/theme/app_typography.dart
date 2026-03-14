import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';

/// Échelle typographique Outfit + DM Sans — cf. design.md §3
abstract final class AppTypography {
  // Outfit — titres, boutons, chiffres XP
  static final display = GoogleFonts.outfit(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static final h1 = GoogleFonts.outfit(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final h2 = GoogleFonts.outfit(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final h3 = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final button = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final chrono = GoogleFonts.outfit(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // DM Sans — corps de texte, descriptions
  static final body1 = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final body2 = GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final caption = GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static final overline = GoogleFonts.dmSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 1.6,
  );
}
