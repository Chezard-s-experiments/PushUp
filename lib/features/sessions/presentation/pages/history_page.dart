import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Historique des séances réalisées.
/// Affichera : liste chronologique, filtres, détails par séance.
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.schedule,
              size: 64,
              color: Color(0xFF9999AA),
            ),
            const SizedBox(height: 16),
            Text(
              'Historique',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF5F5F7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vos séances passées — à venir',
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
