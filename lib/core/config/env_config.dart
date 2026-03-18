enum Environment { dev, staging, prod }

/// Configuration par environnement, déterminée à la compilation
/// via --dart-define=ENV=dev|staging|prod
///
/// L'URL de l'API peut être surchargée :
///   --dart-define=API_BASE_URL=http://192.168.1.42:8000
class EnvConfig {
  static const _envStr = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const _apiBaseUrlOverride = String.fromEnvironment('API_BASE_URL');

  static Environment get current => switch (_envStr) {
    'prod' => Environment.prod,
    'staging' => Environment.staging,
    _ => Environment.dev,
  };

  static String get apiBaseUrl {
    if (_apiBaseUrlOverride.isNotEmpty) return _apiBaseUrlOverride;
    return switch (current) {
      Environment.prod => 'https://api.pushuphub.com',
      Environment.staging => 'https://staging-api.pushuphub.com',
      Environment.dev => 'http://10.0.2.2:8000',
    };
  }

  static bool get enableLogging => current != Environment.prod;
  static bool get enableCrashlytics => current != Environment.dev;
}
