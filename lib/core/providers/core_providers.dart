import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pushup_hub/core/network/dio_client.dart';
import 'package:pushup_hub/core/network/network_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

/// Client HTTP Dio configuré avec intercepteurs (auth, logging).
@Riverpod(keepAlive: true)
Dio dio(Ref ref) => createDioClient();

/// Vérification de la connectivité réseau.
@Riverpod(keepAlive: true)
NetworkInfo networkInfo(Ref ref) => NetworkInfo(Connectivity());
