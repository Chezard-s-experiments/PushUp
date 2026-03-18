import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pushup_hub/features/auth/data/models/access_token_payload.dart';
import 'package:pushup_hub/features/auth/data/models/user_profile.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

/// Réponse combinée token + profil (POST /auth/login, POST /auth/register).
@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required AccessTokenPayload token,
    required UserProfile user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
