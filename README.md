# PushUp — Frontend (Flutter)

## Aperçu
**Pushup Hub** est une application d'entraînement qui permet de :
- Créer des programmes structurés (Programme → Séances → Exercices → Séries)
- Exécuter des séances guidées avec saisie des performances en temps réel
- Suivre sa progression via un système de gamification (XP, niveaux, paliers, jalons)
- Consulter l'historique détaillé de ses entraînements

Le frontend communique avec une API backend Python (FastAPI, architecture DDD/Hexagonale, PostgreSQL).

## Configuration de l'API

Par défaut, l'app pointe vers les URLs suivantes selon l'environnement :

| Environnement | URL par défaut |
|---------------|----------------|
| `dev` | `http://10.0.2.2:8000` (émulateur Android → localhost) |
| `staging` | `https://staging-api.pushuphub.com` |
| `prod` | `https://api.pushuphub.com` |

### Changer l'environnement

```bash
flutter run --dart-define=ENV=staging
```

### Surcharger l'URL de l'API

Pour pointer vers une adresse spécifique (ex. IP locale, tunnel ngrok) :

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.1.42:8000
```

Cela fonctionne avec n'importe quel environnement. `API_BASE_URL` a la priorité sur l'URL par défaut de l'environnement.

### Exemples courants

```bash
# Dev sur émulateur Android (défaut, pas besoin de flag)
flutter run

# Web + API locale (choisir un port libre si 8081 est pris : voir netstat)
flutter run -d chrome --dart-define=API_BASE_URL=http://127.0.0.1:8000 --web-port=8081

# Build production
flutter build apk --dart-define=ENV=prod
```

### Google Sign-In sur le web (Chrome)

Sans configuration, le web affiche `ClientID not set`. Guide détaillé : **[docs/google_sign_in_web.md](docs/google_sign_in_web.md)**.

**Méthode B (recommandée ici)** : l’ID client est passé via `--dart-define=GOOGLE_WEB_CLIENT_ID`. Les scripts utilisent le port **8081** par défaut (8080 est souvent déjà utilisé sur Windows, ex. par `AgentService`) — ajoute **`http://localhost:8081`** dans Google Cloud (origines + redirections). Surcharge du port : variable d’env `FLUTTER_WEB_PORT`.

```powershell
# Windows (PowerShell), depuis la racine du repo
.\scripts\run_web.ps1
```

```bash
# macOS / Linux
chmod +x scripts/run_web.sh
./scripts/run_web.sh
```

Build web avec le même ID :

```powershell
.\scripts\build_web.ps1
```

Pour lancer à la main :

```bash
flutter run -d chrome --web-port=8081 --dart-define=GOOGLE_WEB_CLIENT_ID=TON_ID.apps.googleusercontent.com
```

## Vérifications avant push

Lance ces commandes avant de pousser une PR :

```bash
flutter pub get
dart format .
flutter analyze
flutter test
```