import express from 'express';
import { mkdirSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { DatabaseSync } from 'node:sqlite';

const directory = dirname(fileURLToPath(import.meta.url));
const databasePath = process.env.DATABASE_PATH ?? join(directory, 'data', 'flashcards.db');
mkdirSync(dirname(databasePath), { recursive: true });

const database = new DatabaseSync(databasePath);
database.exec(`
  PRAGMA foreign_keys = ON;
  CREATE TABLE IF NOT EXISTS decks (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    subject TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );
  CREATE TABLE IF NOT EXISTS cards (
    id INTEGER PRIMARY KEY,
    deck_id INTEGER NOT NULL REFERENCES decks(id) ON DELETE CASCADE,
    front TEXT NOT NULL,
    back TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );
`);

const app = express();
app.use(express.json({ limit: '100kb' }));

const findDeck = database.prepare('SELECT id FROM decks WHERE id = ?');
const findCard = database.prepare(
  'SELECT id FROM cards WHERE id = ? AND deck_id = ?',
);
const listCards = database.prepare(
  'SELECT id, front, back FROM cards WHERE deck_id = ? ORDER BY id',
);

function readText(value) {
  return typeof value === 'string' ? value.trim() : '';
}

function readPositiveId(value) {
  const id = Number(value);
  return Number.isSafeInteger(id) && id > 0 ? id : null;
}

function sendNotFound(response, resource) {
  response.status(404).json({ error: `${resource} not found` });
}

app.get('/api/health', (_request, response) => {
  response.json({ status: 'ok' });
});

app.get('/api/decks', (_request, response) => {
  const decks = database
    .prepare('SELECT id, name, subject FROM decks ORDER BY id')
    .all()
    .map((deck) => ({
      ...deck,
      cards: listCards.all(deck.id),
    }));
  response.json(decks);
});

app.post('/api/decks', (request, response) => {
  const name = readText(request.body?.name);
  const subject = readText(request.body?.subject);
  if (!name || !subject) {
    response.status(400).json({ error: 'name and subject are required' });
    return;
  }

  const result = database
    .prepare('INSERT INTO decks (name, subject) VALUES (?, ?)')
    .run(name, subject);
  response.status(201).json({
    id: Number(result.lastInsertRowid),
    name,
    subject,
    cards: [],
  });
});

app.post('/api/decks/:deckId/cards', (request, response) => {
  const deckId = readPositiveId(request.params.deckId);
  if (deckId === null || !findDeck.get(deckId)) {
    sendNotFound(response, 'Deck');
    return;
  }

  const front = readText(request.body?.front);
  const back = readText(request.body?.back);
  if (!front || !back) {
    response.status(400).json({ error: 'front and back are required' });
    return;
  }

  const result = database
    .prepare('INSERT INTO cards (deck_id, front, back) VALUES (?, ?, ?)')
    .run(deckId, front, back);
  response.status(201).json({
    id: Number(result.lastInsertRowid),
    front,
    back,
  });
});

app.put('/api/decks/:deckId/cards/:cardId', (request, response) => {
  const deckId = readPositiveId(request.params.deckId);
  const cardId = readPositiveId(request.params.cardId);
  if (deckId === null || cardId === null || !findDeck.get(deckId)) {
    sendNotFound(response, 'Card');
    return;
  }
  if (!findCard.get(cardId, deckId)) {
    sendNotFound(response, 'Card');
    return;
  }

  const front = readText(request.body?.front);
  const back = readText(request.body?.back);
  if (!front || !back) {
    response.status(400).json({ error: 'front and back are required' });
    return;
  }

  database
    .prepare('UPDATE cards SET front = ?, back = ? WHERE id = ? AND deck_id = ?')
    .run(front, back, cardId, deckId);
  response.json({ id: cardId, front, back });
});

app.delete('/api/decks/:deckId/cards/:cardId', (request, response) => {
  const deckId = readPositiveId(request.params.deckId);
  const cardId = readPositiveId(request.params.cardId);
  if (deckId === null || cardId === null || !findCard.get(cardId, deckId)) {
    sendNotFound(response, 'Card');
    return;
  }

  database
    .prepare('DELETE FROM cards WHERE id = ? AND deck_id = ?')
    .run(cardId, deckId);
  response.status(204).end();
});

app.use((error, _request, response, _next) => {
  console.error(error);
  response.status(500).json({ error: 'Internal server error' });
});

const port = Number(process.env.PORT ?? 3000);
const server = app.listen(port, '0.0.0.0', () => {
  console.log(`Flashcards API listening on port ${port}`);
});

for (const signal of ['SIGINT', 'SIGTERM']) {
  process.on(signal, () => {
    server.close(() => {
      database.close();
      process.exit(0);
    });
  });
}
