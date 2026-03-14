import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushup_hub/core/network/dio_client.dart';
import 'package:pushup_hub/core/network/network_info.dart';

/// Client HTTP Dio configuré avec intercepteurs (auth, logging).
final dioProvider = Provider<Dio>((ref) => createDioClient());

/// Vérification de la connectivité réseau.
final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfo(Connectivity()),
);
