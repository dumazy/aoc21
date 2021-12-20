import 'package:aoc_day12/polymerization.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Test cases',
    () {
      test(
        'Example should return 1588',
        () {
          final puzzle = Polymerization(testInput);
          final result = puzzle();
          expect(result, 1588);
        },
      );
    },
    // skip: 'currently skipped',
  );
}
