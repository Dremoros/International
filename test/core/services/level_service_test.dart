import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:international/core/services/level_service.dart';
import 'package:hive/hive.dart';
import '../../test_helpers/mocks.dart';

void main() {
  late MockHiveBox mockBox;
  late LevelService levelService;

  setUp(() {
    mockBox = MockHiveBox();
    when(() => mockBox.get('xp', defaultValue: 0)).thenReturn(0);
    when(() => mockBox.put('xp', any())).thenAnswer((_) async => {});
    
    levelService = LevelService(hiveBox: mockBox);
  });

  test('Ajout de XP met à jour le niveau', () {
    // Initial XP = 0
    expect(levelService.currentLevel, 0);
    
    // Ajout 1500 XP
    levelService.addXp(1500);
    expect(levelService.currentLevel, 1);  // 1500 / 1000 = 1.5 → floor = 1
    
    verify(() => mockBox.put('xp', 1500)).called(1);
  });
}