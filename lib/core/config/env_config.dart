enum Environment { dev, staging, prod }

/// Configuration par environnement, déterminée à la compilation
/// via --dart-define=ENV=dev|staging|prod
class EnvConfig {
  static const _envStr = String.fromEnvironment('ENV', defaultValue: 'dev');

  static Environment get current => switch (_envStr) {
        'prod' => Environment.prod,
        'staging' => Environment.staging,
        _ => Environment.dev,
      };

  static String get apiBaseUrl => switch (current) {
        Environment.prod => 'https://api.pushuphub.com',
        Environment.staging => 'https://staging-api.pushuphub.com',
        Environment.dev => 'http://10.0.2.2:8000',
      };

  static bool get enableLogging => current != Environment.prod;
  static bool get enableCrashlytics => current != Environment.dev;
}
