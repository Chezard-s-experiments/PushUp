import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pushup_hub/features/auth/data/datasources/auth_remote_datasource_provider.dart';
import 'package:pushup_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pushup_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

/// Fournit l'instance [AuthRepository] avec ses dépendances injectées.
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    secureStorage: const FlutterSecureStorage(),
  );
}
