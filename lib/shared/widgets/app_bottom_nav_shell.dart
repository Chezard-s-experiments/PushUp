import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shell avec navigation bottom bar pour les 5 onglets principaux.
/// Utilise StatefulNavigationShell de GoRouter pour préserver l'état de chaque tab.
class AppBottomNavShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppBottomNavShell({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFF6B2C),
                );
              }
              return GoogleFonts.outfit(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF9999AA),
              );
            }),
          ),
        ),
        child: NavigationBar(
          height: 64,
          backgroundColor: const Color(0xFF1A1A2E),
          indicatorColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Color(0xFF9999AA), size: 24),
              selectedIcon: Icon(Icons.home_rounded, color: Color(0xFFFF6B2C), size: 24),
              label: 'Accueil',
            ),
            NavigationDestination(
              icon: Icon(Icons.fitness_center_outlined, color: Color(0xFF9999AA), size: 24),
              selectedIcon: Icon(Icons.fitness_center, color: Color(0xFFFF6B2C), size: 24),
              label: 'Programmes',
            ),
            NavigationDestination(
              icon: Icon(Icons.schedule_outlined, color: Color(0xFF9999AA), size: 24),
              selectedIcon: Icon(Icons.schedule, color: Color(0xFFFF6B2C), size: 24),
              label: 'Historique',
            ),
            NavigationDestination(
              icon: Icon(Icons.show_chart, color: Color(0xFF9999AA), size: 24),
              selectedIcon: Icon(Icons.show_chart, color: Color(0xFFFF6B2C), size: 24),
              label: 'Progression',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: Color(0xFF9999AA), size: 24),
              selectedIcon: Icon(Icons.person, color: Color(0xFFFF6B2C), size: 24),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
