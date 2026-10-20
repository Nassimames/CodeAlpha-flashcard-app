import 'package:flashcards/deck_api.dart';

class FakeDeckApiClient implements DeckApiClient {
  final List<RemoteDeck> decks = [];
  int _nextDeckId = 1;
  int _nextCardId = 1;

  @override
  Future<List<RemoteDeck>> fetchDecks() async => List.of(decks);

  @override
  Future<int> createDeck(String name, String subject) async {
    final id = _nextDeckId++;
    decks.add(RemoteDeck(id: id, name: name, subject: subject, cards: []));
    return id;
  }

  @override
  Future<int> createCard(int deckId, String front, String back) async {
    final id = _nextCardId++;
    final deck = decks.firstWhere((deck) => deck.id == deckId);
    decks[decks.indexOf(deck)] = RemoteDeck(
      id: deck.id,
      name: deck.name,
      subject: deck.subject,
      cards: [
        ...deck.cards,
        RemoteCard(id: id, front: front, back: back),
      ],
    );
    return id;
  }

  @override
  Future<void> updateCard(
    int deckId,
    int cardId,
    String front,
    String back,
  ) async {
    final deck = decks.firstWhere((deck) => deck.id == deckId);
    decks[decks.indexOf(deck)] = RemoteDeck(
      id: deck.id,
      name: deck.name,
      subject: deck.subject,
      cards: deck.cards
          .map(
            (card) => card.id == cardId
                ? RemoteCard(id: cardId, front: front, back: back)
                : card,
          )
          .toList(),
    );
  }

  @override
  Future<void> deleteCard(int deckId, int cardId) async {
    final deck = decks.firstWhere((deck) => deck.id == deckId);
    decks[decks.indexOf(deck)] = RemoteDeck(
      id: deck.id,
      name: deck.name,
      subject: deck.subject,
      cards: deck.cards.where((card) => card.id != cardId).toList(),
    );
  }
}
