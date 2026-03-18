// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccessTokenPayload _$AccessTokenPayloadFromJson(Map<String, dynamic> json) =>
    _AccessTokenPayload(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String? ?? 'bearer',
    );

Map<String, dynamic> _$AccessTokenPayloadToJson(_AccessTokenPayload instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
    };
