import 'package:pushup_hub/core/errors/failures.dart';

/// Résultat générique success/failure pour les repositories.
/// Exploite les sealed classes Dart 3 pour un pattern matching exhaustif.
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}
