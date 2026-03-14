/// Constantes de chemins pour la navigation GoRouter.
/// Centralise toutes les routes pour éviter les strings éparpillées.
abstract final class Routes {
  static const String splash = '/splash';

  // Tabs principales (bottom navigation)
  static const String dashboard = '/dashboard';
  static const String programs = '/programs';
  static const String history = '/history';
  static const String progression = '/progression';
  static const String profile = '/profile';

  // Auth (Phase 1)
  static const String login = '/login';
  static const String register = '/register';
}
