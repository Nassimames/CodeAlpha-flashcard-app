import 'package:flutter/material.dart';

import 'models.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    required this.decks,
    required this.cards,
    required this.mastered,
    required this.onCreateDeck,
    super.key,
  });

  final List<Deck> decks;
  final int cards;
  final int mastered;
  final VoidCallback onCreateDeck;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(22),
    children: [
      const Text(
        'Your progress',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 6),
      const Text(
        'Every review brings you closer to your goal.',
        style: TextStyle(color: Color(0xFF77685C)),
      ),
      const SizedBox(height: 22),
      Card(
        color: const Color(0xFFFFFCF7),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overall progress',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                '$mastered / $cards flashcards mastered',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              LinearProgressIndicator(
                value: cards == 0 ? 0 : (mastered / cards).clamp(0.0, 1.0),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 22),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'By deck',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: onCreateDeck,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add deck'),
          ),
        ],
      ),
      const SizedBox(height: 10),
      if (decks.isEmpty)
        const Card(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Text('No decks yet.'),
          ),
        ),
      ...decks.map(
        (deck) => Card(
          color: const Color(0xFFFFFCF7),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: deck.color.withValues(alpha: 0.13),
              child: Icon(deck.icon, color: deck.color),
            ),
            title: Text(deck.name),
            subtitle: LinearProgressIndicator(
              value: deck.cards.isEmpty
                  ? 0
                  : (deck.mastered / deck.cards.length).clamp(0.0, 1.0),
              color: deck.color,
              backgroundColor: deck.color.withValues(alpha: 0.14),
            ),
            trailing: Text(
              '${deck.mastered}/${deck.cards.length}',
              style: TextStyle(color: deck.color, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ],
  );
}

class StudyPage extends StatefulWidget {
  const StudyPage({required this.deck, required this.onMastered, super.key});

  final Deck deck;
  final VoidCallback onMastered;

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  int index = 0;
  bool answerVisible = false;
  final Set<int> _knownCards = {};

  void _move(int offset) {
    final nextIndex = index + offset;
    if (nextIndex < 0 || nextIndex >= widget.deck.cards.length) return;
    setState(() {
      index = nextIndex;
      answerVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deck = widget.deck;
    final card = deck.cards[index];

    return Scaffold(
      appBar: AppBar(title: Text(deck.name), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (index + 1) / deck.cards.length,
                      color: deck.color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('${index + 1} / ${deck.cards.length}'),
                ],
              ),
              const Spacer(),
              Text(
                answerVisible ? 'ANSWER' : 'QUESTION',
                style: const TextStyle(
                  color: Color(0xFF77685C),
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFCF7),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: deck.color.withValues(alpha: .2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(deck.icon, color: deck.color, size: 36),
                      const SizedBox(height: 22),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Center(
                            child: Text(
                              answerVisible ? card.back : card.front,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () =>
                      setState(() => answerVisible = !answerVisible),
                  icon: Icon(
                    answerVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  label: Text(answerVisible ? 'Hide answer' : 'Show answer'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                ),
              ),
              if (answerVisible)
                TextButton.icon(
                  onPressed: _knownCards.contains(index)
                      ? null
                      : () {
                          setState(() => _knownCards.add(index));
                          widget.onMastered();
                        },
                  icon: const Icon(Icons.check_circle_outline),
                  label: Text(
                    _knownCards.contains(index)
                        ? 'Flashcard mastered'
                        : 'I know this one',
                  ),
                ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: index == 0 ? null : () => _move(-1),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: index == deck.cards.length - 1
                          ? null
                          : () => _move(1),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                      iconAlignment: IconAlignment.end,
                      style: FilledButton.styleFrom(
                        backgroundColor: deck.color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
