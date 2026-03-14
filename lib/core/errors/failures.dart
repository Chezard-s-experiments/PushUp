/// Failures (couche Domain) — résultats d'erreur métier.
/// Les repositories convertissent les exceptions techniques en Failures.
sealed class Failure {
  final String? message;
  const Failure({this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({this.statusCode, super.message});
}

class AuthFailure extends Failure {
  const AuthFailure({super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message});
}
