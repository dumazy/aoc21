import 'dart:collection';

import 'package:aoc_day/model.dart';
import 'package:aoc_day/parser.dart';
import 'package:aoc_day/snailfish.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Test cases',
    () {
      test(
        'Addition of single explosion',
        () {
          final first = parseSnailfishPair([
            [
              [
                [9, 8],
                1
              ],
              2
            ],
            3
          ]);
          final second = Single(4);
          final result = first + second;

          final combinedReduced = parseSnailfishPair([
            [
              [
                [0, 9],
                2
              ],
              3
            ],
            4
          ]);
          expect(result, combinedReduced);
        },
      );

      test('Another single explosion', () {
        Pair number = parseSnailfishPair([
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
        ]) as Pair;
        final expected = parseSnailfishPair([
          7,
          [
            6,
            [
              5,
              [7, 0]
            ]
          ]
        ]);
        number.reduce();
        expect(number, expected);
      });

      test('multiple explosions', () {
        Pair number = parseSnailfishPair([
          [
            3,
            [
              2,
              [
                1,
                [7, 3]
              ]
            ]
          ],
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
        ]) as Pair;
        final expected = parseSnailfishPair([
          [
            3,
            [
              2,
              [8, 0]
            ]
          ],
          [
            9,
            [
              5,
              [7, 0]
            ]
          ]
        ]);
        number.reduce();
        expect(number, expected);
      });

      test(
        'multiple actions',
        () {
          final first = parseSnailfishPair([
            [
              [
                [4, 3],
                4
              ],
              4
            ],
            [
              7,
              [
                [8, 4],
                9
              ]
            ]
          ]);
          final second = parseSnailfishPair([1, 1]);

          final expected = parseSnailfishPair([
            [
              [
                [0, 7],
                4
              ],
              [
                [7, 8],
                [6, 0]
              ]
            ],
            [8, 1]
          ]);

          expect(first + second, expected);
        },
      );
    },
    // skip: 'skipping',
  );

  test('sum of small list', () {
    final sum =
        parseInput(smallInputList).reduce((value, element) => value + element);
    final expected = parseSnailfishPair([
      [
        [
          [1, 1],
          [2, 2]
        ],
        [3, 3]
      ],
      [4, 4]
    ]);
    expect(sum, expected);
  });
  test(
    'Sum of list of numbers',
    () {
      final sum =
          parseInput(listTestInput).reduce((value, element) => value + element);

      final expected = parseSnailfishPair([
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
      expect(sum, expected);
    },
    // skip: 'temp skip',
  );
}

final smallInputList = [
  [1, 1],
  [2, 2],
  [3, 3],
  [4, 4],
];

final listTestInput = [
  [
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
  ],
  [
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
  ],
  [
    [
      2,
      [
        [0, 8],
        [3, 4]
      ]
    ],
    [
      [
        [6, 7],
        1
      ],
      [
        7,
        [1, 6]
      ]
    ]
  ],
  [
    [
      [
        [2, 4],
        7
      ],
      [
        6,
        [0, 5]
      ]
    ],
    [
      [
        [6, 8],
        [2, 8]
      ],
      [
        [2, 1],
        [4, 5]
      ]
    ]
  ],
  [
    7,
    [
      5,
      [
        [3, 8],
        [1, 4]
      ]
    ]
  ],
  [
    [
      2,
      [2, 2]
    ],
    [
      8,
      [8, 1]
    ]
  ],
  [2, 9],
  [
    1,
    [
      [
        [9, 3],
        9
      ],
      [
        [9, 0],
        [0, 7]
      ]
    ]
  ],
  [
    [
      [
        5,
        [7, 4]
      ],
      7
    ],
    1
  ],
  [
    [
      [
        [4, 2],
        2
      ],
      6
    ],
    [8, 7]
  ],
];
