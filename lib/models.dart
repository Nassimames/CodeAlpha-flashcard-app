import 'package:flutter/material.dart';

class StudyCard {
  StudyCard(this.front, this.back, {this.backendId});

  String front;
  String back;
  final int? backendId;
}

class Deck {
  Deck(
    this.name,
    this.subject,
    this.color,
    this.icon,
    this.cards, {
    this.backendId,
  });

  final String name;
  final String subject;
  final Color color;
  final IconData icon;
  final List<StudyCard> cards;
  final int? backendId;
  int mastered = 0;
}
