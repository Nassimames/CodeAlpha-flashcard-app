import 'package:flashcards/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_deck_api.dart';

void main() {
  testWidgets('adds a flashcard from the home screen', (tester) async {
    await tester.pumpWidget(MemoireApp(apiClient: FakeDeckApiClient()));

    await tester.tap(find.text('New flashcard'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextField, 'Question / front'),
      'Question de test',
    );
    await tester.enterText(
      find.widgetWithText(TextField, 'Answer / back'),
      'Réponse de test',
    );
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('Languages · 21 flashcards'), findsOneWidget);
    expect(find.text('Essential English'), findsOneWidget);
  });
}
