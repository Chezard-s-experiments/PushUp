import 'package:flutter/material.dart';

/// Ombres par niveau d'élévation — cf. design.md §5
abstract final class AppShadows {
  // Niveau 1 : cards principales, bottom bar
  static const level1 = [
    BoxShadow(color: Color(0x66000000), blurRadius: 12, offset: Offset(0, 2)),
  ];

  // Niveau 2 : cards imbriquées, inputs, bottom sheets
  static const level2 = [
    BoxShadow(color: Color(0x80000000), blurRadius: 16, offset: Offset(0, 4)),
  ];

  // Niveau 3 : tooltips, popups, dropdowns
  static const level3 = [
    BoxShadow(color: Color(0x99000000), blurRadius: 24, offset: Offset(0, 6)),
  ];

  // Glow primaire (boutons primary/danger)
  static const primaryGlow = [
    BoxShadow(color: Color(0x4DFF6B2C), blurRadius: 8, offset: Offset(0, 2)),
  ];
}
