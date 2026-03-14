import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Liste des programmes d'entraînement de l'utilisateur.
/// Affichera : programmes actifs, bibliothèque, création.
class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programmes')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center,
              size: 64,
              color: Color(0xFF9999AA),
            ),
            const SizedBox(height: 16),
            Text(
              'Programmes',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF5F5F7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vos programmes d\'entraînement — à venir',
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
