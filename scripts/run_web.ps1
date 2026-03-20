# Pushup Hub — Flutter Web (Chrome) avec Google Sign-In (méthode B).
#
# Port : par défaut 8081 (8080 est souvent pris par AgentService / autres outils sur Windows).
# Doit correspondre aux origines + redirections dans Google Cloud.
# Surcharge : $env:FLUTTER_WEB_PORT = "8080" ; .\scripts\run_web.ps1

$ClientId = "75525977537-9ek0a55o4nf1c7n8uk0jct35ugpuchkn.apps.googleusercontent.com"
$WebPort = if ($env:FLUTTER_WEB_PORT) { $env:FLUTTER_WEB_PORT } else { "8081" }

flutter run -d chrome `
  --web-port=$WebPort `
  --dart-define=GOOGLE_WEB_CLIENT_ID=$ClientId `
  @args
