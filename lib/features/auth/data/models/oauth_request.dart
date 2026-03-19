/// Body de la requête POST /auth/oauth.
class OAuthRequest {
  const OAuthRequest({required this.token});

  /// id_token fourni par Google côté front.
  final String token;

  Map<String, dynamic> toJson() => {'token': token};
}
