import 'package:aoc_day12/model.dart';
import 'package:aoc_day12/parser.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Parser',
    () {
      test(
        'parses points properly',
        () {
          final result = parseInput(testInput);

          expect(result.points.length, 18);
          expect(result.points.first, Point(6, 10));
        },
      );

      test(
        'parses folds properly',
        () {
          final result = parseInput(testInput);
          final folds = result.folds;

          expect(folds.length, 2);
          expect(folds.first.direction, FoldDirection.y);
          expect(folds.first.line, 7);
          expect(folds.last.direction, FoldDirection.x);
          expect(folds.last.line, 5);
        },
      );
    },
  );
}
