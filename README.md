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

# Dev sur appareil physique (IP locale du PC)
flutter run --dart-define=API_BASE_URL=http://192.168.1.42:8000

# Dev sur iOS simulator (localhost accessible directement)
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8000

# Build production
flutter build apk --dart-define=ENV=prod
```
flutter run -d a57b00e1 --dart-define=API_BASE_URL=http://192.168.129.17:8000

## Vérifications avant push

Lance ces commandes avant de pousser une PR :

```bash
flutter pub get
dart format .
flutter analyze
flutter test
```