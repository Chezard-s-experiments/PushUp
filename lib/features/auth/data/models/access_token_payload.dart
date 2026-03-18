import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token_payload.freezed.dart';
part 'access_token_payload.g.dart';

/// Payload JWT renvoyé par l'API (login, register, refresh).
@freezed
abstract class AccessTokenPayload with _$AccessTokenPayload {
  const factory AccessTokenPayload({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') @Default('bearer') String tokenType,
  }) = _AccessTokenPayload;

  factory AccessTokenPayload.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenPayloadFromJson(json);
}
