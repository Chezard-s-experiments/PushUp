/// Constantes de chemins pour la navigation GoRouter.
/// Centralise toutes les routes pour éviter les strings éparpillées.
abstract final class Routes {
  static const String splash = '/splash';

  // Tabs principales (4 onglets bottom navigation)
  static const String dashboard = '/dashboard';
  static const String programs = '/programs';
  static const String progression = '/progression';
  static const String profile = '/profile';

  // Sous-routes accessibles hors shell (plein écran)
  static const String history = '/history';

  // Auth (Phase 1)
  static const String login = '/login';
  static const String register = '/register';
}
