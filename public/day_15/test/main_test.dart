import 'package:aoc_day12/chiton.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Test cases',
    () {
      test(
        'Example should return 40',
        () {
          final puzzle = Chiton(testInput);
          final result = puzzle();
          expect(result, 40);
        },
      );
    },
    // skip: 'currently skipped',
  );
}
