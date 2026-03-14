# Design System — Pushup Hub

**Version** : 1.0
**Dernière mise à jour** : Mars 2026
**Ambiance** : Midnight Athlete — sombre, chaleureux, motivant, accessible

---

## Table des matières

1. [Ton visuel & ambiance](#1-ton-visuel--ambiance)
2. [Palette de couleurs](#2-palette-de-couleurs)
3. [Typographie](#3-typographie)
4. [Iconographie](#4-iconographie)
5. [Composants UI](#5-composants-ui)
6. [Espacements et grille](#6-espacements-et-grille)
7. [Illustrations et imagerie](#7-illustrations-et-imagerie)

---

## 1. Ton visuel & ambiance

### Direction : "Midnight Athlete"

L'app est le compagnon de l'athlète moderne — sombre mais chaleureux, technique mais humain. L'ambiance évoque la nuit urbaine : la lumière orange rappelle les lampadaires d'une ville où l'on court à l'aube. Les paliers sont des étapes d'un parcours personnel, pas une compétition agressive.

### Principes directeurs

- **Motivant mais accessible** : ambitieux sans être intimidant
- **Chaleureux sur fond sombre** : l'orange apporte de la vie au dark mode
- **Deux registres visuels** : sobre au quotidien, spectaculaire pour les récompenses
- **Progression personnelle** : chaque utilisateur vit son propre parcours

### Mots-clés

Nuit urbaine, chaleur orange, progression personnelle, régularité, parcours, discipline douce, célébration joyeuse.

### Références moodboard

| Référence | Ce qu'on en retient |
|-----------|---------------------|
| **Apple Fitness+** | Épuré, premium, sombre avec accents de couleur |
| **Duolingo** | Célébrations joyeuses, feedback positif, confettis |
| **Headspace** (version sport) | Bienveillant, motivant sans être agressif |
| **Photographie Golden Hour** | Lumière chaude, silhouettes, énergie calme |

### Ton émotionnel par contexte

| Contexte | Ton | Exemple |
|----------|-----|---------|
| Quotidien (séances, navigation) | Calme, fonctionnel | Interface épurée, contrastes doux |
| Gain d'XP | Satisfaisant, positif | Glow orange, compteur animé |
| Montée de niveau | Joyeux, célébration | Confettis, particules chaudes |
| Passage de palier | Épique, mémorable | Glassmorphism, badge métallique, animation majeure |
| Jalon atteint | Fierté, accomplissement | Badge gravé, flash lumineux |
| Record personnel | Surprise, excitation | Étoile dorée, notification spéciale |

> **Règle clé** : le vocabulaire guerrier des jalons (Fighter, Warrior, Champion, God, God Slayer) apporte la couche gaming dans le contenu textuel. Le design reste chaleureux et accueillant — il n'a pas besoin d'en rajouter visuellement.

---

## 2. Palette de couleurs

### Direction : "Dark Athletic"

Mode sombre par défaut, énergie et intensité. Les couleurs vives ressortent sur fond sombre, idéal pour les animations XP et les célébrations.

### Couleurs principales

| Rôle | Nom | Hex | Utilisation |
|------|-----|-----|-------------|
| Fond principal | `bg-primary` | `#0D0D0F` | Background de tous les écrans |
| Fond surface | `bg-surface` | `#1A1A2E` | Cards, bottom bar, modales |
| Fond élevé | `bg-elevated` | `#252540` | Inputs, bottom sheets, cards imbriquées |
| Fond popup | `bg-popup` | `#2F2F4A` | Tooltips, dropdowns, popups |
| Primaire | `primary` | `#FF6B2C` | CTA, boutons principaux, accents, XP |
| Secondaire | `secondary` | `#3A86FF` | Barres progression temps, liens, éléments secondaires |
| Accent | `accent` | `#00C853` | Succès, complétion, métriques, validation |
| Erreur | `error` | `#FF3B3B` | Erreurs, alertes critiques |
| Warning | `warning` | `#FFB800` | Avertissements |
| Texte principal | `text-primary` | `#F5F5F7` | Titres, corps de texte |
| Texte secondaire | `text-secondary` | `#9999AA` | Labels, hints, texte inactif |
| Bordure subtile | `border` | `rgba(255,255,255,0.06)` | Délimitation des cards et surfaces |

### Couleurs des paliers

| Palier | Hex principal | Hex secondaire | Style |
|--------|---------------|----------------|-------|
| **Bronze** | `#CD7F32` | `#A0522D` | Mat cuivré |
| **Silver** | `#C0C0C0` | `#A8A8A8` | Poli argenté |
| **Or** | `#FFD700` | `#DAA520` | Brillant doré |
| **Diamant** | `#B9F2FF` | `#7DF9FF` | Cristallin translucide |
| **Platinium** | `#E5E4E2` | `#D4D4D2` | Blanc métallique lisse |
| **Master** | `#1A1A2E` + `#FFD700` | — | Noir et or, aura dorée |

### Mode clair (secondaire)

Le mode clair est proposé en option mais n'est pas le mode par défaut.

| Rôle | Hex |
|------|-----|
| Fond principal | `#F7F7FA` |
| Fond surface | `#FFFFFF` |
| Fond élevé | `#EEEEF2` |
| Texte principal | `#1A1A2E` |
| Texte secondaire | `#6B6B80` |

> Les couleurs primaire, secondaire, accent, erreur et warning restent identiques en mode clair.

### Opacités utilitaires

| Usage | Valeur |
|-------|--------|
| Overlay d'écran (modale) | `rgba(0,0,0,0.6)` |
| Glassmorphism (gamification) | `rgba(26,26,46,0.80)` + `blur(16px)` |
| Hover/press sur ghost button | `rgba(255,107,44,0.10)` |
| Focus glow sur input | `0 0 0 3px rgba(255,107,44,0.20)` |
| Fond chip/tag actif | `rgba(255,107,44,0.12)` |
| Disabled | Opacité `40%` sur le composant |

---

## 3. Typographie

### Direction : "Outfit + DM Sans"

Outfit pour les titres et les chiffres (impact, énergie, lisibilité des compteurs XP), DM Sans pour le corps et l'UI (chaleur, lisibilité longue lecture).

**Source** : Google Fonts (gratuit) — package Flutter `google_fonts`.

### Échelle typographique

| Rôle | Police | Graisse | Taille | Interlignage | Cas d'usage |
|------|--------|---------|--------|--------------|-------------|
| Display | Outfit | ExtraBold (800) | 48px | 1.0 | Chiffre XP animé, niveau affiché |
| H1 | Outfit | Bold (700) | 28px | 1.15 | Titre d'écran |
| H2 | Outfit | SemiBold (600) | 22px | 1.2 | Sous-titre, nom de section |
| H3 | Outfit | SemiBold (600) | 18px | 1.25 | Titre de card, nom d'exercice |
| Body 1 | DM Sans | Regular (400) | 16px | 1.5 | Corps de texte principal |
| Body 2 | DM Sans | Regular (400) | 14px | 1.45 | Corps secondaire, descriptions |
| Caption | DM Sans | Medium (500) | 12px | 1.4 | Labels, timestamps, metadata |
| Button | Outfit | SemiBold (600) | 16px | 1.0 | Texte des boutons |
| Chrono | Outfit | SemiBold (600) | 40px | 1.0 | Chronomètre de repos |
| Overline | DM Sans | Medium (500) | 10px | 1.6 | Labels très petits, all caps |

### Règles d'usage

- **Outfit** est réservé aux éléments à fort impact : titres, boutons, chiffres, compteurs, chronomètres
- **DM Sans** est utilisé pour tout le contenu lisible : descriptions d'exercices, instructions, corps de texte
- Les chiffres XP et niveaux utilisent **Outfit ExtraBold** pour un rendu percutant dans les animations
- Pas de texte en dessous de **10px** (accessibilité)
- Pas d'italique (non pertinent pour l'app, et Outfit n'a pas de variante italique)

---

## 4. Iconographie

### Direction : "Phosphor Icons"

Bibliothèque complète (6 000+ icônes), 6 styles disponibles, avec un mode duotone parfait pour la gamification.

**Source** : [Phosphor Icons](https://phosphoricons.com) — Licence MIT (gratuit, commercial OK)
**Package Flutter** : `phosphor_flutter`

### Styles par contexte

| Contexte | Style Phosphor | Exemple |
|----------|----------------|---------|
| Navigation (inactif) | Regular | Icône fine, couleur `#9999AA` |
| Navigation (actif) | Fill | Icône pleine, couleur `#FF6B2C` |
| Actions UI | Bold | Boutons d'action, menus |
| Badges / gamification | Duotone | Deux tons : couleur du palier + accent |
| Inline (texte) | Regular | Petites icônes dans le texte |

### Tailles

| Usage | Taille | Contexte |
|-------|--------|----------|
| Inline (dans du texte) | 16px | À côté d'un label |
| UI standard | 20px | Boutons d'action, listes |
| Navigation bar | 24px | Onglets bottom bar |
| Badges et paliers | 32–48px | Écran progression, célébrations |
| Illustration d'état vide | 64px | Écrans vides |

### Couleurs

| État | Couleur |
|------|---------|
| Inactif / désactivé | `#9999AA` |
| Actif / sélectionné | `#FF6B2C` |
| Succès | `#00C853` |
| Erreur | `#FF3B3B` |
| Informatif | `#3A86FF` |
| Paliers (duotone) | Couleur principale + secondaire du palier |

### Icônes de navigation principale

| Onglet | Icône Phosphor |
|--------|----------------|
| Accueil | `House` |
| Programmes | `Barbell` |
| Historique | `ClockCounterClockwise` |
| Progression | `ChartLineUp` |
| Profil | `UserCircle` |

---

## 5. Composants UI

### Direction : Hybride "Elevated Dark + Glassmorphism gamification"

**Principe fondamental** : deux registres visuels dans la même app.

| Contexte | Style | Quand |
|----------|-------|-------|
| **Fonctionnel** | Elevated Dark (opaque, couches de gris, ombres) | Navigation, séances, saisie, historique, inputs |
| **Gamification** | Glassmorphism (blur, transparence, glow) | Overlays XP, célébrations jalons, passage de palier, écran progression |

> Cette dualité crée une **montée en intensité visuelle** : l'interface quotidienne est sobre et efficace, les moments de récompense deviennent spectaculaires par contraste.

### Système d'élévation (Elevated Dark)

| Niveau | Couleur | Usage |
|--------|---------|-------|
| 0 | `#0D0D0F` | Fond d'écran |
| 1 | `#1A1A2E` | Cards principales, bottom bar |
| 2 | `#252540` | Cards imbriquées, inputs, bottom sheets |
| 3 | `#2F2F4A` | Tooltips, popups, dropdowns |

Chaque niveau ajoute une ombre croissante :
- Niveau 1 : `0 2px 12px rgba(0,0,0,0.4)`
- Niveau 2 : `0 4px 16px rgba(0,0,0,0.5)`
- Niveau 3 : `0 6px 24px rgba(0,0,0,0.6)`

### Boutons

#### Bouton primaire
- Fond : `#FF6B2C`
- Texte : `#FFFFFF`, Outfit SemiBold 16px
- Coins arrondis : 12px
- Hauteur : 48px, padding horizontal : 24px
- Ombre : `0 2px 8px rgba(255,107,44,0.3)`
- Press : `scale(0.97)` + ombre réduite
- Disabled : opacité 40%

#### Bouton secondaire
- Fond : `#252540`
- Bordure : `1px rgba(255,255,255,0.08)`
- Texte : `#F5F5F7`, Outfit SemiBold 16px
- Coins arrondis : 12px
- Hauteur : 48px

#### Bouton ghost
- Fond : transparent
- Texte : `#FF6B2C`, Outfit SemiBold 16px
- Hover/press : fond `rgba(255,107,44,0.10)`

#### Bouton danger
- Fond : `#FF3B3B`
- Texte : `#FFFFFF`
- Même style que le primaire

### Cards

- Fond : niveau 1 (`#1A1A2E`)
- Bordure : `1px rgba(255,255,255,0.06)`
- Coins arrondis : 16px
- Ombre : `0 2px 12px rgba(0,0,0,0.4)`
- Padding interne : 16px
- Cards imbriquées : niveau 2, coins 12px

### Inputs

- Fond : `#252540` (niveau 2)
- Bordure : `1.5px #333355`
- Bordure focus : `1.5px #FF6B2C` + glow `0 0 0 3px rgba(255,107,44,0.20)`
- Bordure erreur : `1.5px #FF3B3B` + glow rouge
- Coins arrondis : 12px
- Hauteur : 48px
- Label flottant : DM Sans Medium 12px `#9999AA`

### Navigation (Bottom Bar)

- Fond : `#1A1A2E` (niveau 1)
- Bordure top : `1px rgba(255,255,255,0.06)`
- Hauteur : 64px
- 5 onglets
- Inactif : icône Phosphor Regular 24px `#9999AA`
- Actif : icône Phosphor Fill 24px `#FF6B2C` + label Outfit Medium 10px `#FF6B2C`
- Transition : 200ms ease

### Barres de progression

| Type | Couleur remplissage | Hauteur | Coins |
|------|---------------------|---------|-------|
| XP / progression globale | Dégradé `#FF6B2C` → `#FF9A44` | 8px | 8px |
| Temps (objectif) | `#3A86FF` | 4px | 4px |
| Métrique (objectif) | `#00C853` | 4px | 4px |
| Complétion programme | `#FF6B2C` uni | 6px | 6px |

- Fond piste : `#252540`
- Animation : spring 400ms

### Chips / Tags

- Fond : `rgba(255,107,44,0.12)`
- Texte : `#FF6B2C`
- Coins arrondis : 8px
- Padding : 4px 12px
- Variantes : bleu `rgba(58,134,255,0.12)` pour les types, vert `rgba(0,200,83,0.12)` pour les niveaux

### Snackbars / Toasts

- Fond : `#252540`
- Bordure gauche : 3px couleur de contexte (orange info, vert succès, rouge erreur)
- Coins arrondis : 12px
- Ombre niveau 3

### Overlays de gamification (Glassmorphism)

Utilisé uniquement pour les moments de célébration :

- Fond : `rgba(26,26,46,0.80)` + `backdrop-filter: blur(16px)`
- Bordure : `1px rgba(255,255,255,0.10)`
- Coins arrondis : 24px
- Contenu centré, animations de particules/confettis au-dessus

**Cas d'usage** :
- Overlay "+150 XP" post-séance
- Célébration de montée de niveau
- Animation de passage de palier
- Badge de jalon atteint
- Record personnel battu

---

## 6. Espacements et grille

### Direction : Base 8px strict

Tous les espacements sont des multiples de 8px. Un seul demi-pas (4px) autorisé pour l'espace icône-label.

### Tokens d'espacement

| Token | Valeur | Usage |
|-------|--------|-------|
| `space-xs` | 4px | Espace icône-label (seul demi-pas) |
| `space-sm` | 8px | Espace entre éléments d'un même groupe |
| `space-md` | 16px | Padding interne des cards et inputs |
| `space-lg` | 24px | Marge entre composants |
| `space-xl` | 32px | Marge entre sections, padding horizontal d'écran mobile |
| `space-2xl` | 48px | Séparation de blocs majeurs |
| `space-3xl` | 64px | Header spacing, espacement de page |

### Rayons de coins (border-radius)

| Composant | Rayon |
|-----------|-------|
| Boutons, inputs | 12px |
| Cards | 16px |
| Modales, bottom sheets (coins supérieurs) | 24px |
| Badges, chips | 8px |
| Barres de progression | 8px |
| Avatars | 50% (cercle) |

### Dimensions fixes

| Élément | Dimension |
|---------|-----------|
| Bottom nav bar | 64px hauteur |
| App bar | 56px hauteur |
| Touch target minimum | 48px × 48px |
| Bouton standard | 48px hauteur |
| Input standard | 48px hauteur |

### Breakpoints responsive

| Nom | Largeur | Colonnes | Marge d'écran | Gouttière |
|-----|---------|----------|---------------|-----------|
| `mobile` | < 600px | 4 | 16px | 8px |
| `tablet` | 600–900px | 8 | 24px | 16px |
| `desktop` | > 900px | 12 | auto (max 1200px centré) | 24px |

### Règles de mise en page

- **Mobile** : contenu pleine largeur, 1 colonne, scroll vertical
- **Tablette** : cards en grille 2 colonnes, sidebar optionnelle
- **Desktop** : grille 3–4 colonnes, navigation latérale, max-width 1200px centré
- Le padding horizontal d'écran est toujours `space-xl` (32px) sur mobile
- Les cards ont toujours un padding interne de `space-md` (16px)

---

## 7. Illustrations et imagerie

### Direction : Hybride "Flat fonctionnel + Badges métalliques gamification"

Même logique que les composants UI : sobre au quotidien, spectaculaire pour les récompenses.

### Illustrations fonctionnelles

**Style** : illustrations vectorielles flat, personnages géométriques, palette orange + bleu sur fond sombre.

**Usage** :
- Onboarding (3 écrans)
- États vides ("Aucune séance réalisée", "Pas encore de programme")
- Erreurs / offline
- Écrans de succès simples

**Ressources recommandées** :

| Ressource | URL | Licence | Note |
|-----------|-----|---------|------|
| Storyset (Freepik) | storyset.com | Gratuit avec attribution | Illustrations sport/fitness, animables en Lottie |
| unDraw | undraw.co | MIT (gratuit) | SVG recolorables, large choix |
| Open Peeps | openpeeps.com | CC0 (gratuit) | Personnages dessinés à la main |

**Consignes** :
- Recolorer toutes les illustrations pour matcher la palette (`#FF6B2C` orange, `#3A86FF` bleu, `#0D0D0F` fond)
- Format SVG privilégié (léger, scalable)
- Style cohérent : choisir UNE source et s'y tenir pour toute l'app

### Badges de gamification

**Style** : métallique / glossy, rendu premium.

#### Badges de paliers

| Palier | Style visuel | Description |
|--------|-------------|-------------|
| **Bronze** | Métallique mat cuivré | Bouclier avec texture bronze, reflets doux |
| **Silver** | Métallique poli argenté | Bouclier avec brillance froide |
| **Or** | Métallique brillant doré | Bouclier avec glow chaud |
| **Diamant** | Cristallin translucide | Gemme à facettes avec reflets prismatiques |
| **Platinium** | Blanc métallique lisse | Surface miroir, reflets subtils |
| **Master** | Noir et or, aura | Bouclier sombre avec particules dorées |

#### Badges de jalons

| Jalon | Niveau | Style visuel |
|-------|--------|-------------|
| **Rookie** | 1 | Écusson simple, couleur du palier actuel |
| **Fighter** | 10 | Médaille avec poings croisés |
| **Warrior** | 25 | Bouclier avec épée |
| **Champion** | 50 | Couronne dorée |
| **God** | 75 | Éclair / aura divine |
| **God Slayer** | 90 | Crâne couronné, aura sombre et or |

#### Animations des badges

- Les badges de paliers sont animés en **Lottie** (rotation lente, reflets qui bougent, glow pulsant)
- Les jalons ont une animation d'apparition (scale-in + flash lumineux)
- Les records personnels déclenchent une étoile dorée animée (flash + particules)

**Ressources recommandées** :

| Ressource | URL | Licence | Usage |
|-----------|-----|---------|-------|
| Lottie Files | lottiefiles.com | Mixte (gratuit + payant) | Animations de célébration (confettis, glow, particules) |
| 3D Icons | 3dicons.co | CC0 (gratuit) | Icônes 3D pour badges si besoin |
| SVG Repo | svgrepo.com | Mixte | Icônes SVG complémentaires |
| Blender | blender.org | Gratuit | Création de badges custom 3D |
| Fiverr | fiverr.com | Payant (~30-50$ le set) | Commande d'un set complet de badges |

### Photographies

- **Pas de photos dans l'UI** (trop lourd, incohérent avec le style)
- Exception : **photos de profil** utilisateur (avatar circulaire, border-radius 50%)
- Les exercices utilisent des **illustrations techniques** ou **vidéos courtes**, pas de photos stock
- Pas de photos de sportifs en fond d'écran (éviter le côté "pub pour salle de sport")

---

## Récapitulatif des choix

| Section | Choix | Résumé |
|---------|-------|--------|
| Ton visuel | Midnight Athlete | Sombre, chaleureux, motivant, accessible |
| Palette | Dark Athletic | Dark mode par défaut, orange `#FF6B2C` primaire |
| Typographie | Outfit + DM Sans | Outfit pour impact (titres, XP), DM Sans pour lisibilité (corps) |
| Iconographie | Phosphor Icons | 6 000+ icônes, duotone pour gamification, MIT |
| Composants | Elevated Dark + Glass gamif. | Opaque au quotidien, glassmorphism pour les célébrations |
| Espacements | Base 8px strict | Multiples de 8, colonnes 4/8/12, breakpoints 600/900px |
| Illustrations | Flat + badges métalliques | Storyset/unDraw pour le fonctionnel, Lottie/custom pour les paliers |

---

## Références techniques Flutter

### Packages recommandés

| Package | Usage | Source |
|---------|-------|--------|
| `google_fonts` | Outfit + DM Sans | pub.dev |
| `phosphor_flutter` | Icônes Phosphor | pub.dev |
| `lottie` | Animations de célébration | pub.dev |
| `flutter_animate` | Animations UI (spring, fade, scale) | pub.dev |
| `rive` | Animations interactives avancées (optionnel) | pub.dev |

### Structure ThemeData suggérée

```dart
ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF0D0D0F),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFFF6B2C),
    secondary: Color(0xFF3A86FF),
    surface: Color(0xFF1A1A2E),
    error: Color(0xFFFF3B3B),
    onPrimary: Colors.white,
    onSurface: Color(0xFFF5F5F7),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.outfit(
      fontSize: 48, fontWeight: FontWeight.w800, color: Color(0xFFF5F5F7),
    ),
    headlineLarge: GoogleFonts.outfit(
      fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xFFF5F5F7),
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFFF5F5F7),
    ),
    headlineSmall: GoogleFonts.outfit(
      fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFF5F5F7),
    ),
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFFF5F5F7),
    ),
    bodyMedium: GoogleFonts.dmSans(
      fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFF5F5F7),
    ),
    bodySmall: GoogleFonts.dmSans(
      fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF9999AA),
    ),
    labelLarge: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white,
    ),
  ),
)
```

### Constantes d'espacement suggérées

```dart
abstract class AppSpacing {
  static const double xs  = 4;
  static const double sm  = 8;
  static const double md  = 16;
  static const double lg  = 24;
  static const double xl  = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
}

abstract class AppRadius {
  static const double chip    = 8;
  static const double button  = 12;
  static const double card    = 16;
  static const double modal   = 24;
}
```

### Constantes de couleurs suggérées

```dart
abstract class AppColors {
  // Backgrounds
  static const Color bgPrimary   = Color(0xFF0D0D0F);
  static const Color bgSurface   = Color(0xFF1A1A2E);
  static const Color bgElevated  = Color(0xFF252540);
  static const Color bgPopup     = Color(0xFF2F2F4A);

  // Brand
  static const Color primary     = Color(0xFFFF6B2C);
  static const Color secondary   = Color(0xFF3A86FF);
  static const Color accent      = Color(0xFF00C853);

  // Feedback
  static const Color error       = Color(0xFFFF3B3B);
  static const Color warning     = Color(0xFFFFB800);

  // Text
  static const Color textPrimary   = Color(0xFFF5F5F7);
  static const Color textSecondary = Color(0xFF9999AA);

  // Tiers
  static const Color tierBronze    = Color(0xFFCD7F32);
  static const Color tierSilver    = Color(0xFFC0C0C0);
  static const Color tierGold      = Color(0xFFFFD700);
  static const Color tierDiamond   = Color(0xFFB9F2FF);
  static const Color tierPlatinium = Color(0xFFE5E4E2);
  static const Color tierMasterGold = Color(0xFFFFD700);
  static const Color tierMasterDark = Color(0xFF1A1A2E);
}
```

---

*Ce document est le guide de référence pour tout le développement UI de Pushup Hub. Chaque composant, couleur et espacement doit s'y conformer. En cas de doute, revenir aux principes directeurs : sobre au quotidien, spectaculaire pour les récompenses.*