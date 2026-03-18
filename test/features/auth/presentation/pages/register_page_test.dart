import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pushup_hub/features/auth/presentation/pages/register_page.dart';

import '../../../../helpers/auth_test_helpers.dart';

void main() {
  group('RegisterPage', () {
    testWidgets('affiche le logo, le sous-titre et tous les champs',
        (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      expect(find.text('Pushup'), findsOneWidget);
      expect(find.text('Crée ton compte'), findsOneWidget);
      expect(find.text('Prénom'), findsOneWidget);
      expect(find.text('Nom'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Mot de passe'), findsOneWidget);
      expect(find.text('Confirmer le mot de passe'), findsOneWidget);
      expect(find.text("S'inscrire"), findsOneWidget);
      expect(find.text('Se connecter'), findsOneWidget);
    });

    testWidgets('affiche une erreur si email vide', (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      expect(find.text('Email requis'), findsOneWidget);
    });

    testWidgets('affiche une erreur si email invalide', (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'invalide',
      );
      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      expect(find.text('Format email invalide'), findsOneWidget);
    });

    testWidgets('affiche une erreur si mot de passe trop court',
        (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'abc',
      );
      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      expect(find.text('8 caractères minimum'), findsOneWidget);
    });

    testWidgets('affiche une erreur si confirmation vide', (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'password123',
      );
      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      expect(find.text('Confirmation requise'), findsOneWidget);
    });

    testWidgets('affiche une erreur si les mots de passe ne correspondent pas',
        (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'password123',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Confirmer le mot de passe'),
        'different456',
      );
      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      expect(
        find.text('Les mots de passe ne correspondent pas'),
        findsOneWidget,
      );
    });

    testWidgets('pas d\'erreur avec des champs valides', (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'password123',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Confirmer le mot de passe'),
        'password123',
      );
      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      expect(find.text('Email requis'), findsNothing);
      expect(find.text('Format email invalide'), findsNothing);
      expect(find.text('Mot de passe requis'), findsNothing);
      expect(find.text('8 caractères minimum'), findsNothing);
      expect(find.text('Confirmation requise'), findsNothing);
      expect(
        find.text('Les mots de passe ne correspondent pas'),
        findsNothing,
      );
    });

    testWidgets('les champs prénom et nom sont optionnels (pas de validation)',
        (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      // Remplir uniquement les champs obligatoires
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'password123',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Confirmer le mot de passe'),
        'password123',
      );
      await tester.tap(find.text("S'inscrire"));
      await tester.pumpAndSettle();

      // Aucune erreur de validation
      expect(find.byType(Text), findsWidgets);
      expect(
        find.textContaining('requis'),
        findsNothing,
      );
    });

    testWidgets('le lien Se connecter est présent', (tester) async {
      await tester.pumpWidget(createTestApp(const RegisterPage()));
      await tester.pumpAndSettle();

      expect(find.text('Déjà un compte ? '), findsOneWidget);
      expect(find.text('Se connecter'), findsOneWidget);
    });
  });
}
