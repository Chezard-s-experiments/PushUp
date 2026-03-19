import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_request.freezed.dart';
part 'oauth_request.g.dart';

/// Body de la requête POST /auth/oauth.
@freezed
abstract class OAuthRequest with _$OAuthRequest {
  const factory OAuthRequest({
    /// id_token fourni par Google côté front.
    required String token,
  }) = _OAuthRequest;

  factory OAuthRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthRequestFromJson(json);
}

