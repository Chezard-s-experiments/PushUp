import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Profil utilisateur et paramètres.
/// Affichera : avatar, stats, settings, premium, déconnexion.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 64,
              color: Color(0xFF9999AA),
            ),
            const SizedBox(height: 16),
            Text(
              'Profil',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF5F5F7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Votre compte — à venir',
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
