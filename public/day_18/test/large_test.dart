import 'package:aoc_day/parser.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Step 1',
    () {
      final first = parseSnailfishPair([
        [
          [
            0,
            [4, 5]
          ],
          [0, 0]
        ],
        [
          [
            [4, 5],
            [2, 6]
          ],
          [9, 5]
        ]
      ]);
      final second = parseSnailfishPair([
        7,
        [
          [
            [3, 7],
            [4, 3]
          ],
          [
            [6, 3],
            [8, 8]
          ]
        ]
      ]);
      final expected = parseSnailfishPair([
        [
          [
            [4, 0],
            [5, 4]
          ],
          [
            [7, 7],
            [6, 0]
          ]
        ],
        [
          [
            8,
            [7, 7]
          ],
          [
            [7, 9],
            [5, 0]
          ]
        ]
      ]);
      expect(first + second, expected);
    },
  );
}
