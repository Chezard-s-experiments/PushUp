import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart' as g;
import 'package:pushup_hub/shared/services/google_sign_in_service.dart';

class _FakeGoogleSignInClient implements GoogleSignInClient {
  Future<void> Function() onInitialize = () async {};
  Future<g.GoogleSignInAccount> Function() onAuthenticate = () async =>
      throw UnimplementedError();

  @override
  Future<g.GoogleSignInAccount> authenticate() async {
    return onAuthenticate();
  }

  @override
  Future<void> initialize() async {
    await onInitialize();
  }
}

void main() {
  late _FakeGoogleSignInClient client;
  late GoogleSignInService service;

  setUp(() {
    client = _FakeGoogleSignInClient();
    service = GoogleSignInService(client);
  });

  test('throws AppGoogleSignInException when authenticate fails', () async {
    client.onAuthenticate = () async {
      throw Exception('boom');
    };

    expect(() => service.signIn(), throwsA(isA<AppGoogleSignInException>()));
  });
}
