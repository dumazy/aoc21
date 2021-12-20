import 'package:aoc_day/model.dart';
import 'package:aoc_day/parser.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Parses simple pair',
    () {
      final result = parseSnailfishPair([4, 5]);
      expect(result, isA<Pair>());
      final pair = result as Pair;
      expect(pair.left, isA<Single>());
      expect(pair.right, isA<Single>());
    },
  );

  test(
    'Parses pair of single pairs',
    () {
      final result = parseSnailfishPair([
        [4, 5],
        [6, 7]
      ]);
      expect(result, isA<Pair>());
      final pair = result as Pair;
      expect(pair.left, isA<Pair>());
      expect(pair.right, isA<Pair>());
      final leftPair = result.left as Pair;
      final leftPairLeft = leftPair.left as Single;
      expect(leftPairLeft.value, 4);
      final rightPair = result.right as Pair;
      final rightPairLeft = rightPair.left as Single;
      expect(rightPairLeft.value, 6);
    },
  );
}
