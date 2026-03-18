import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Page d'accueil — vue d'ensemble de l'utilisateur.
/// Affichera : progression globale, séance du jour, streaks, raccourcis.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home_rounded, size: 64, color: Color(0xFF9999AA)),
            const SizedBox(height: 16),
            Text(
              'Dashboard',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF5F5F7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vue d\'ensemble — à venir',
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
