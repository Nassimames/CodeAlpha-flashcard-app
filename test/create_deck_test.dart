import 'package:flashcards/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_deck_api.dart';

void main() {
  testWidgets('creates a deck without a dialog lifecycle assertion', (
    tester,
  ) async {
    await tester.pumpWidget(MemoireApp(apiClient: FakeDeckApiClient()));

    await tester.scrollUntilVisible(
      find.text('Create a deck'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Create a deck'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'My new deck');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Progress'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('My new deck'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('My new deck'), findsOneWidget);
    expect(find.text('0/0'), findsOneWidget);
  });
}
