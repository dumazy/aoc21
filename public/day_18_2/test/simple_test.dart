import 'package:aoc_day/parser.dart';
import 'package:test/test.dart';

void main() {
  test('Medium example', () {
    final sum =
        parseInput(testInputMedium).reduce((value, element) => value + element);
    final expected = parseSnailfishPair([
      [
        [
          [3, 0],
          [5, 3]
        ],
        [4, 4]
      ],
      [5, 5]
    ]);
    expect(sum, expected);
  });

  test('magintude', () {
    final number = parseSnailfishPair([
      [
        [
          [8, 7],
          [7, 7]
        ],
        [
          [8, 6],
          [7, 7]
        ]
      ],
      [
        [
          [0, 7],
          [6, 6]
        ],
        [8, 7]
      ]
    ]);

    expect(number.magnitude, 3488);
  });
}

final testInputMedium = [
  [1, 1],
  [2, 2],
  [3, 3],
  [4, 4],
  [5, 5],
];
