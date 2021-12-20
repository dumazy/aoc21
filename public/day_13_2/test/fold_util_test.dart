import 'package:aoc_day12/fold_util.dart';
import 'package:aoc_day12/parser.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  test('getSides', () {
    final parsedInput = parseInput(testInput);
    final result =
        getSides(parsedInput.points.toSet(), parsedInput.folds.first);

    print(result.last);
  });
}
