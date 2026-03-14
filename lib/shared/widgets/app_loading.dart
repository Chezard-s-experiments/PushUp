import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';

/// Indicateur de chargement centré avec spinner.
class AppLoading extends StatelessWidget {
  final double size;

  const AppLoading({this.size = 24, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
