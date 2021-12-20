import 'package:aoc_day12/model.dart';
import 'package:aoc_day12/parser.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Parser',
    () {
      test(
        'parses start',
        () {
          final result = parseInput(testInput);

          expect(result.start, 'NNCB');
        },
      );

      test(
        'parses instructions properly',
        () {
          final result = parseInput(testInput);
          final folds = result.instructions;

          expect(folds.length, 16);
          expect(folds.first.values, 'CH');
          expect(folds.first.intersperseValue, 'B');
          expect(folds.last.values, 'CN');
          expect(folds.last.intersperseValue, 'C');
        },
      );
    },
  );
}
