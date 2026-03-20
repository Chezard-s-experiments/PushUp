#!/usr/bin/env bash
# Pushup Hub — Flutter Web (Chrome) avec Google Sign-In (méthode B).
#
# Port : défaut 8081 (évite les conflits avec 8080 sur certains PC Windows).
# Doit correspondre aux origines + redirections dans Google Cloud.
# Surcharge : FLUTTER_WEB_PORT=8080 ./scripts/run_web.sh

set -euo pipefail
CLIENT_ID="75525977537-9ek0a55o4nf1c7n8uk0jct35ugpuchkn.apps.googleusercontent.com"
WEB_PORT="${FLUTTER_WEB_PORT:-8081}"

exec flutter run -d chrome \
  --web-port="${WEB_PORT}" \
  --dart-define="GOOGLE_WEB_CLIENT_ID=${CLIENT_ID}" \
  "$@"
