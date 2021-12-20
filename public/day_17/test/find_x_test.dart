import 'package:aoc_day17/model.dart';
import 'package:aoc_day17/trick_shot.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  test(
    'Find x values',
    () {
      final target = TargetArea.fromInput(testInput);
      final result = findValidXVelocities(target);
      expect(result, [
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
        30,
      ]);
    },
  );

  test(
    'Find y values',
    () {
      final target = TargetArea.fromInput(testInput);
      final result = findValidYVelocities(target);
      expect(result, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    },
  );

  test(
    'Calculate distance x',
    () {
      final result = calculateDistanceX(5, 2);
      expect(result, 9);
    },
  );
}
