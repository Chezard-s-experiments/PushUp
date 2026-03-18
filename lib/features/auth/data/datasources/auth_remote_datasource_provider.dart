import 'package:pushup_hub/core/providers/core_providers.dart';
import 'package:pushup_hub/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_datasource_provider.g.dart';

/// Fournit l'instance [AuthRemoteDataSource] avec le client Dio injecté.
@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(ref.watch(dioProvider));
}
