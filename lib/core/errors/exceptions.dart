/// Exceptions (couche Data) — erreurs techniques levées par les DataSources.
/// Les repositories les attrapent et les convertissent en Failures.
class ServerException implements Exception {
  final int? statusCode;
  final String? message;
  const ServerException({this.statusCode, this.message});

  @override
  String toString() => 'ServerException($statusCode): $message';
}

class NetworkException implements Exception {
  final String? message;
  const NetworkException({this.message});

  @override
  String toString() => 'NetworkException: $message';
}

class CacheException implements Exception {
  final String? message;
  const CacheException({this.message});

  @override
  String toString() => 'CacheException: $message';
}
