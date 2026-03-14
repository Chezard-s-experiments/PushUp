import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Écran de progression — gamification.
/// Affichera : palier, niveau, XP, barres de progression, jalons.
class ProgressionPage extends StatelessWidget {
  const ProgressionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progression')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.show_chart,
              size: 64,
              color: Color(0xFF9999AA),
            ),
            const SizedBox(height: 16),
            Text(
              'Progression',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF5F5F7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Palier, niveau, XP — à venir',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: const Color(0xFF9999AA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
