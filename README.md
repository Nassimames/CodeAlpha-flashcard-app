# Flashcards

Flutter flashcards app with a Node.js/Express API and SQLite persistence for
user-created decks and their flashcards.

The bundled **Docker & DevOps** revision deck covers Docker fundamentals,
Dockerfiles, images, containers, networking, storage, Compose, security,
troubleshooting, and CI/CD interview topics. Its topics are based on the
[DevOpsLesson Docker tutorial](https://devopslesson.com/tutorials/docker/)
and its linked Docker guides.

The **Linux & DevOps** and **Git pour DevOps** decks add French interview
practice on Linux administration and troubleshooting, Git history and
collaboration, and safe change/release workflows. Their subject areas follow
the [DevOpsLesson Linux tutorial](https://devopslesson.com/tutorials/linux)
and [Git tutorial](https://devopslesson.com/tutorials/git).

## Run the backend

Use Node.js 22.13 or later:

```sh
cd backend
npm install
npm start
```

The API listens on port `3000` and stores its database in
`backend/data/flashcards.db`. Set `PORT` or `DATABASE_PATH` to override these
defaults.

## Connect the Flutter app

The Android emulator uses `http://10.0.2.2:3000/api` by default. Start the API
before creating or opening saved decks. To use a different host (for example,
an iOS simulator or a physical device on the same network), provide the API
base URL when launching Flutter:

```sh
flutter run --dart-define=API_BASE_URL=http://<computer-ip>:3000/api
```

New decks and their cards are created, loaded, edited, and deleted through the
API. The example decks remain local sample content. Backend errors are shown in
the app, and a failed save does not change the local deck.

## REST endpoints

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/api/health` | Check that the API is running |
| `GET` | `/api/decks` | List saved decks and cards |
| `POST` | `/api/decks` | Create a deck (`name`, `subject`) |
| `POST` | `/api/decks/:deckId/cards` | Add a card (`front`, `back`) |
| `PUT` | `/api/decks/:deckId/cards/:cardId` | Update a card |
| `DELETE` | `/api/decks/:deckId/cards/:cardId` | Delete a card |
