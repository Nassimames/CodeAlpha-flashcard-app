import 'dart:convert';
import 'dart:io';

class RemoteCard {
  const RemoteCard({required this.id, required this.front, required this.back});

  final int id;
  final String front;
  final String back;

  factory RemoteCard.fromJson(Map<String, dynamic> json) => RemoteCard(
    id: json['id'] as int,
    front: json['front'] as String,
    back: json['back'] as String,
  );
}

class RemoteDeck {
  const RemoteDeck({
    required this.id,
    required this.name,
    required this.subject,
    required this.cards,
  });

  final int id;
  final String name;
  final String subject;
  final List<RemoteCard> cards;

  factory RemoteDeck.fromJson(Map<String, dynamic> json) => RemoteDeck(
    id: json['id'] as int,
    name: json['name'] as String,
    subject: json['subject'] as String,
    cards: (json['cards'] as List<dynamic>)
        .map((card) => RemoteCard.fromJson(card as Map<String, dynamic>))
        .toList(),
  );
}

abstract interface class DeckApiClient {
  Future<List<RemoteDeck>> fetchDecks();
  Future<int> createDeck(String name, String subject);
  Future<int> createCard(int deckId, String front, String back);
  Future<void> updateCard(int deckId, int cardId, String front, String back);
  Future<void> deleteCard(int deckId, int cardId);
}

class HttpDeckApiClient implements DeckApiClient {
  const HttpDeckApiClient();

  static const _baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:3000/api',
  );

  @override
  Future<List<RemoteDeck>> fetchDecks() async {
    final result = await _request('GET', 'decks') as List<dynamic>;
    return result
        .map((deck) => RemoteDeck.fromJson(deck as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<int> createDeck(String name, String subject) async {
    final result =
        await _request(
              'POST',
              'decks',
              body: {'name': name, 'subject': subject},
            )
            as Map<String, dynamic>;
    return result['id'] as int;
  }

  @override
  Future<int> createCard(int deckId, String front, String back) async {
    final result =
        await _request(
              'POST',
              'decks/$deckId/cards',
              body: {'front': front, 'back': back},
            )
            as Map<String, dynamic>;
    return result['id'] as int;
  }

  @override
  Future<void> updateCard(
    int deckId,
    int cardId,
    String front,
    String back,
  ) async {
    await _request(
      'PUT',
      'decks/$deckId/cards/$cardId',
      body: {'front': front, 'back': back},
    );
  }

  @override
  Future<void> deleteCard(int deckId, int cardId) async {
    await _request('DELETE', 'decks/$deckId/cards/$cardId');
  }

  Future<Object?> _request(
    String method,
    String path, {
    Map<String, String>? body,
  }) async {
    final client = HttpClient();
    try {
      final request = await client.openUrl(
        method,
        Uri.parse('$_baseUrl/$path'),
      );
      request.headers.contentType = ContentType.json;
      if (body != null) request.write(jsonEncode(body));
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw HttpException(
          'API request failed (${response.statusCode}): $responseBody',
        );
      }
      if (responseBody.isEmpty) return null;
      return jsonDecode(responseBody);
    } finally {
      client.close(force: true);
    }
  }
}
