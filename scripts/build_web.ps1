# Build web avec le même ID client OAuth (méthode B).

$ClientId = "75525977537-9ek0a55o4nf1c7n8uk0jct35ugpuchkn.apps.googleusercontent.com"

flutter build web `
  --dart-define=GOOGLE_WEB_CLIENT_ID=$ClientId `
  @args
