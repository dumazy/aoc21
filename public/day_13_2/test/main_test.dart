import 'package:aoc_day12/transparent_origami.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Test cases',
    () {
      test(
        'Example should return square',
        () {
          final puzzle = TransparentOrigami(testInput);
          final result = puzzle();
        },
      );
    },
    // skip: 'currently skipped',
  );
}
