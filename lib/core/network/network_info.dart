import 'package:connectivity_plus/connectivity_plus.dart';

/// Vérifie la connectivité réseau de l'appareil.
class NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
