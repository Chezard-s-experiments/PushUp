import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/shared/widgets/app_snackbar.dart';

/// Shell avec 4 onglets + FAB central "Démarrer" — cf. design.md §8
///
/// Layout : Accueil | Programmes | [FAB ▶] | Progression | Profil
class AppBottomNavShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppBottomNavShell({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: _buildFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF9A44), AppColors.primary],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.45),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () => showAppSnackBar(
          context,
          message: 'Sélection de séance — à venir',
          accentColor: AppColors.primary,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        shape: const CircleBorder(),
        child: Icon(
          PhosphorIcons.play(PhosphorIconsStyle.fill),
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      height: 64 + bottomPadding,
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            index: 0,
            icon: PhosphorIcons.house(PhosphorIconsStyle.regular),
            activeIcon: PhosphorIcons.house(PhosphorIconsStyle.fill),
            label: 'Accueil',
            isSelected: navigationShell.currentIndex == 0,
            onTap: _onTap,
          ),
          _NavItem(
            index: 1,
            icon: PhosphorIcons.barbell(PhosphorIconsStyle.regular),
            activeIcon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
            label: 'Programmes',
            isSelected: navigationShell.currentIndex == 1,
            onTap: _onTap,
          ),
          const SizedBox(width: 72),
          _NavItem(
            index: 2,
            icon: PhosphorIcons.trophy(PhosphorIconsStyle.regular),
            activeIcon: PhosphorIcons.trophy(PhosphorIconsStyle.fill),
            label: 'Progression',
            isSelected: navigationShell.currentIndex == 2,
            onTap: _onTap,
          ),
          _NavItem(
            index: 3,
            icon: PhosphorIcons.userCircle(PhosphorIconsStyle.regular),
            activeIcon: PhosphorIcons.userCircle(PhosphorIconsStyle.fill),
            label: 'Profil',
            isSelected: navigationShell.currentIndex == 3,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.index,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: SizedBox(
        width: 64,
        height: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isSelected ? activeIcon : icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
