import 'package:flashcards/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_deck_api.dart';

void main() {
  testWidgets('sample decks contain the expected flashcard counts', (
    tester,
  ) async {
    await tester.pumpWidget(MemoireApp(apiClient: FakeDeckApiClient()));

    await tester.tap(find.text('Decks'));
    await tester.pumpAndSettle();

    for (final deckSummary in [
      'Languages · 20 flashcards',
      'Development · 20 flashcards',
      'Biology · 20 flashcards',
      'DevOps · 42 flashcards',
      'Linux · 32 flashcards',
      'Git · 32 flashcards',
    ]) {
      await tester.scrollUntilVisible(
        find.text(deckSummary),
        250,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text(deckSummary), findsOneWidget);
    }
  });
}
