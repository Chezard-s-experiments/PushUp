// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Client HTTP Dio configuré avec intercepteurs (auth, logging).

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// Client HTTP Dio configuré avec intercepteurs (auth, logging).

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Client HTTP Dio configuré avec intercepteurs (auth, logging).
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'bb004ea259ff5b4f6e7bbf1198b91369aa34a0e8';

/// Vérification de la connectivité réseau.

@ProviderFor(networkInfo)
final networkInfoProvider = NetworkInfoProvider._();

/// Vérification de la connectivité réseau.

final class NetworkInfoProvider
    extends $FunctionalProvider<NetworkInfo, NetworkInfo, NetworkInfo>
    with $Provider<NetworkInfo> {
  /// Vérification de la connectivité réseau.
  NetworkInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkInfoHash();

  @$internal
  @override
  $ProviderElement<NetworkInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkInfo create(Ref ref) {
    return networkInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkInfo>(value),
    );
  }
}

String _$networkInfoHash() => r'dcbde4d16ce49032812421972f732dce50451579';
