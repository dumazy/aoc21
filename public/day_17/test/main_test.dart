import 'package:aoc_day17/trick_shot.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Test cases',
    () {
      test(
        'For test input, highest Y is 9',
        () {
          final puzzle = TrickShot(testInput);
          final result = puzzle();
          expect(result, 9);
        },
      );
    },
  );
}
