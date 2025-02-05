import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:international/features/quests/quest_card.dart';
import 'package:international/core/models/quest.dart';

void main() {
  final testQuest = Quest(
    id: '1',
    title: 'Faire 10 pompes',
    tags: {'xp': 100, 'location': 'home'},
    levelRequired: 1,
  );

  testWidgets('Affiche correctement le titre et le XP', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuestCard(quest: testQuest),
        ),
      ),
    );

    expect(find.text('Faire 10 pompes'), findsOneWidget);
    expect(find.text('100 XP'), findsOneWidget);
  });
}