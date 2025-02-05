import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:international/features/quests/quest_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../test_helpers/mocks.dart';

void main() {
  late MockSupabaseClient mockSupabase;
  late QuestService questService;

  setUp(() {
    mockSupabase = MockSupabaseClient();
    questService = QuestService(supabase: mockSupabase);
  });

  test('Récupère uniquement les quêtes accessibles au niveau 2', () async {
    // Mock Supabase response
    when(() => mockSupabase.from('quests').select().lte('level_required', 2))
      .thenAnswer((_) => Future.value([
        {'id': '1', 'title': 'Quête facile', 'level_required': 1},
        {'id': '2', 'title': 'Quête niveau 2', 'level_required': 2}
      ]));

    final quests = await questService.generateQuests(userLevel: 2);
    expect(quests.length, 2);
    expect(quests.any((q) => q.levelRequired > 2), false);
  });
}