import 'package:aoc_day12/model.dart';
import 'package:aoc_day12/parser.dart';
import 'package:test/test.dart';

import 'test_input.dart';

void main() {
  group(
    'Parser',
    () {
      test(
        'parses number of lines correctly',
        () {
          final result = parseInput(testInput);

          expect(result.length, 10);
        },
      );

      test(
        'parses length of each line correctly',
        () {
          final result = parseInput(testInput);

          expect(result.every((element) => element.length == 10), true);
        },
      );
    },
  );
}
