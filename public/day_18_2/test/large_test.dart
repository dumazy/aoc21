import 'package:aoc_day/parser.dart';
import 'package:aoc_day/snailfish.dart';
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

  test('highest mag of sum of things ', () {
    final puzzle = Snailfish(inputForMag);
    final result = puzzle();
    expect(result, 3993);
  });

  test('another example', () {
    final first = parseSnailfishPair([
      [
        2,
        [
          [7, 7],
          7
        ]
      ],
      [
        [5, 8],
        [
          [9, 3],
          [0, 2]
        ]
      ]
    ]);
    final second = parseSnailfishPair([
      [
        [
          0,
          [5, 8]
        ],
        [
          [1, 7],
          [9, 6]
        ]
      ],
      [
        [
          4,
          [1, 2]
        ],
        [
          [1, 4],
          2
        ]
      ]
    ]);
    final expected = parseSnailfishPair([
      [
        [
          [7, 8],
          [6, 6]
        ],
        [
          [6, 0],
          [7, 7]
        ]
      ],
      [
        [
          [7, 8],
          [8, 8]
        ],
        [
          [7, 9],
          [0, 6]
        ]
      ]
    ]);
    expect(first + second, expected);
    expect(expected.magnitude, 3993);
  });

  test('mag of exmaple ', () {
    final number = parseSnailfishPair([
      [
        [
          [7, 8],
          [6, 6]
        ],
        [
          [6, 0],
          [7, 7]
        ]
      ],
      [
        [
          [7, 8],
          [8, 8]
        ],
        [
          [7, 9],
          [0, 6]
        ]
      ]
    ]);
    expect(number.magnitude, 3993);
  });
}

const inputForMag = [
  [
    [
      [
        0,
        [5, 8]
      ],
      [
        [1, 7],
        [9, 6]
      ]
    ],
    [
      [
        4,
        [1, 2]
      ],
      [
        [1, 4],
        2
      ]
    ]
  ],
  [
    [
      [
        5,
        [2, 8]
      ],
      4
    ],
    [
      5,
      [
        [9, 9],
        0
      ]
    ]
  ],
  [
    6,
    [
      [
        [6, 2],
        [5, 6]
      ],
      [
        [7, 6],
        [4, 7]
      ]
    ]
  ],
  [
    [
      [
        6,
        [0, 7]
      ],
      [0, 9]
    ],
    [
      4,
      [
        9,
        [9, 0]
      ]
    ]
  ],
  [
    [
      [
        7,
        [6, 4]
      ],
      [
        3,
        [1, 3]
      ]
    ],
    [
      [
        [5, 5],
        1
      ],
      9
    ]
  ],
  [
    [
      6,
      [
        [7, 3],
        [3, 2]
      ]
    ],
    [
      [
        [3, 8],
        [5, 7]
      ],
      4
    ]
  ],
  [
    [
      [
        [5, 4],
        [7, 7]
      ],
      8
    ],
    [
      [8, 3],
      8
    ]
  ],
  [
    [9, 3],
    [
      [9, 9],
      [
        6,
        [4, 9]
      ]
    ]
  ],
  [
    [
      2,
      [
        [7, 7],
        7
      ]
    ],
    [
      [5, 8],
      [
        [9, 3],
        [0, 2]
      ]
    ]
  ],
  [
    [
      [
        [5, 2],
        5
      ],
      [
        8,
        [3, 7]
      ]
    ],
    [
      [
        5,
        [7, 5]
      ],
      [4, 4]
    ]
  ],
];
