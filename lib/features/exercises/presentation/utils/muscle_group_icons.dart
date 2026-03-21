import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';

/// Icônes Phosphor inline (~20px) pour groupes musculaires — cf. design.md §4
IconData muscleGroupIcon(MuscleGroup m) {
  return switch (m) {
    MuscleGroup.pectoraux => PhosphorIcons.barbell(PhosphorIconsStyle.regular),
    MuscleGroup.dos => PhosphorIcons.personSimple(PhosphorIconsStyle.regular),
    MuscleGroup.epaules => PhosphorIcons.personSimpleThrow(
      PhosphorIconsStyle.regular,
    ),
    MuscleGroup.biceps => PhosphorIcons.hand(PhosphorIconsStyle.regular),
    MuscleGroup.triceps => PhosphorIcons.handFist(PhosphorIconsStyle.regular),
    MuscleGroup.abdos => PhosphorIcons.person(PhosphorIconsStyle.regular),
    MuscleGroup.jambes => PhosphorIcons.personSimpleRun(
      PhosphorIconsStyle.regular,
    ),
    MuscleGroup.fessiers => PhosphorIcons.personSimpleSki(
      PhosphorIconsStyle.regular,
    ),
    MuscleGroup.mollets => PhosphorIcons.sneaker(PhosphorIconsStyle.regular),
    MuscleGroup.avantBras => PhosphorIcons.handGrabbing(
      PhosphorIconsStyle.regular,
    ),
    MuscleGroup.corpsEntier => PhosphorIcons.globe(PhosphorIconsStyle.regular),
  };
}
