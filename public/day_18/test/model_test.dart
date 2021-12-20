import 'package:aoc_day/parser.dart';
import 'package:test/test.dart';

void main() {
  test('Cannot explode a simple pair', () {
    final number = parseSnailfishPair([3, 4]);
    expect(number.canExplode(), false);
  });
  test('Cannot explode a pair of 3 nested levels', () {
    final number = parseSnailfishPair([
      [
        1,
        [
          [3, 4],
          [5, 6]
        ],
      ],
      7,
    ]);
    expect(number.canExplode(), false);
  });
  test('Can explode a pair of 4 nested levels', () {
    final number = parseSnailfishPair([
      [
        [
          [
            [9, 8],
            1
          ],
          2
        ],
        3
      ],
      4
    ]);
    expect(number.canExplode(), true);

    final anotherNumber = parseSnailfishPair([
      7,
      [
        6,
        [
          5,
          [
            4,
            [3, 2]
          ]
        ]
      ]
    ]);
    expect(anotherNumber.canExplode(), true);
  });
}
