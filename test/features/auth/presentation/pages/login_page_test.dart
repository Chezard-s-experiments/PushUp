import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pushup_hub/features/auth/presentation/pages/login_page.dart';

import '../../../../helpers/auth_test_helpers.dart';

void main() {
  group('LoginPage', () {
    testWidgets('affiche le logo, le sous-titre et les champs',
        (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      expect(find.text('Pushup'), findsOneWidget);
      expect(find.text('Content de te revoir !'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Mot de passe'), findsOneWidget);
      expect(find.text('Se connecter'), findsOneWidget);
      expect(find.text("S'inscrire"), findsOneWidget);
    });

    testWidgets('affiche une erreur si email vide', (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      expect(find.text('Email requis'), findsOneWidget);
    });

    testWidgets('affiche une erreur si email invalide', (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'pas-un-email',
      );
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      expect(find.text('Format email invalide'), findsOneWidget);
    });

    testWidgets('affiche une erreur si mot de passe vide', (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      expect(find.text('Mot de passe requis'), findsOneWidget);
    });

    testWidgets('affiche une erreur si mot de passe trop court',
        (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'abc',
      );
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      expect(find.text('8 caractères minimum'), findsOneWidget);
    });

    testWidgets('pas d\'erreur avec des champs valides', (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Mot de passe'),
        'password123',
      );
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      expect(find.text('Email requis'), findsNothing);
      expect(find.text('Format email invalide'), findsNothing);
      expect(find.text('Mot de passe requis'), findsNothing);
      expect(find.text('8 caractères minimum'), findsNothing);
    });

    testWidgets('le toggle de visibilité du mot de passe fonctionne',
        (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      // Par défaut le mot de passe est masqué
      final obscuredField = tester.widget<EditableText>(
        find.descendant(
          of: find.widgetWithText(TextFormField, 'Mot de passe'),
          matching: find.byType(EditableText),
        ),
      );
      expect(obscuredField.obscureText, isTrue);

      // Clic sur l'icône de visibilité
      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pumpAndSettle();

      final visibleField = tester.widget<EditableText>(
        find.descendant(
          of: find.widgetWithText(TextFormField, 'Mot de passe'),
          matching: find.byType(EditableText),
        ),
      );
      expect(visibleField.obscureText, isFalse);
    });

    testWidgets('le lien S\'inscrire est présent', (tester) async {
      await tester.pumpWidget(createTestApp(const LoginPage()));
      await tester.pumpAndSettle();

      expect(find.text('Pas de compte ? '), findsOneWidget);
      expect(find.text("S'inscrire"), findsOneWidget);
    });
  });
}
