import 'package:aoc_day17/model.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  test(
    'Parses input',
    () {
      final result = TargetArea.fromInput(testInput);
      expect(result.startX, 20);
      expect(result.endX, 30);
      expect(result.startY, -10);
      expect(result.endY, -5);
    },
  );

  test(
    'Computes ranges',
    () {
      final result = TargetArea(20, 30, -10, -5);
      expect(result.rangeX, 11);
      expect(result.rangeY, 6);
    },
  );
}
