import 'package:aoc_day/snailfish.dart';

void main() {
  final puzzle = Snailfish(input);
  final largest = puzzle();
  print('magnitude: $largest');
}

// Put the real puzzle input here
final input = [
  [
    1,
    [
      [
        9,
        [5, 8]
      ],
      [
        [2, 0],
        0
      ]
    ]
  ],
  [
    [
      [6, 4],
      6
    ],
    [
      [
        1,
        [7, 3]
      ],
      [
        [0, 1],
        [4, 9]
      ]
    ]
  ],
  [
    [
      [7, 3],
      [8, 6]
    ],
    [
      [
        4,
        [1, 2]
      ],
      7
    ]
  ],
  [
    [
      [
        2,
        [4, 5]
      ],
      [
        [7, 1],
        2
      ]
    ],
    1
  ],
  [
    [
      [
        [4, 4],
        [4, 6]
      ],
      9
    ],
    [
      [4, 2],
      6
    ]
  ],
  [
    [
      [9, 8],
      [
        [4, 0],
        0
      ]
    ],
    [
      [
        2,
        [5, 1]
      ],
      [
        [9, 6],
        [9, 2]
      ]
    ]
  ],
  [
    [
      [
        6,
        [9, 0]
      ],
      0
    ],
    [
      6,
      [
        [5, 8],
        3
      ]
    ]
  ],
  [
    [
      [
        [7, 3],
        [5, 4]
      ],
      0
    ],
    [
      3,
      [
        [0, 6],
        3
      ]
    ]
  ],
  [
    5,
    [
      [0, 0],
      [
        [4, 8],
        [8, 6]
      ]
    ]
  ],
  [
    [
      [
        3,
        [9, 2]
      ],
      9
    ],
    [
      5,
      [0, 6]
    ]
  ],
  [
    [
      [
        [6, 3],
        [3, 2]
      ],
      [5, 9]
    ],
    2
  ],
  [
    [
      [0, 4],
      7
    ],
    [
      8,
      [
        8,
        [4, 2]
      ]
    ]
  ],
  [
    [
      [
        8,
        [8, 0]
      ],
      9
    ],
    [
      [
        1,
        [6, 3]
      ],
      [4, 2]
    ]
  ],
  [
    [
      [
        [5, 4],
        [1, 5]
      ],
      [1, 3]
    ],
    [
      [
        [9, 0],
        [7, 4]
      ],
      9
    ]
  ],
  [
    [
      [
        5,
        [4, 2]
      ],
      [
        [9, 2],
        3
      ]
    ],
    [
      [
        [6, 2],
        [6, 8]
      ],
      [
        [2, 4],
        [9, 4]
      ]
    ]
  ],
  [
    [9, 6],
    [
      0,
      [
        [1, 1],
        9
      ]
    ]
  ],
  [
    [
      [
        8,
        [5, 9]
      ],
      [2, 9]
    ],
    [
      0,
      [
        [7, 6],
        [7, 6]
      ]
    ]
  ],
  [
    [
      [
        5,
        [4, 8]
      ],
      [
        [7, 7],
        [2, 2]
      ]
    ],
    [
      [
        [2, 6],
        [5, 7]
      ],
      [
        0,
        [6, 2]
      ]
    ]
  ],
  [
    [
      [
        [9, 3],
        5
      ],
      3
    ],
    [
      [
        [1, 5],
        2
      ],
      [3, 3]
    ]
  ],
  [
    [
      [
        2,
        [1, 1]
      ],
      [
        [5, 8],
        [7, 1]
      ]
    ],
    [
      [9, 7],
      5
    ]
  ],
  [
    [9, 9],
    3
  ],
  [
    [
      [
        5,
        [6, 1]
      ],
      9
    ],
    [
      1,
      [9, 3]
    ]
  ],
  [
    [
      [
        [1, 2],
        7
      ],
      [
        [6, 8],
        [4, 1]
      ]
    ],
    [
      [2, 3],
      [6, 3]
    ]
  ],
  [
    [
      [
        [9, 3],
        [7, 9]
      ],
      2
    ],
    [
      [
        9,
        [3, 4]
      ],
      [
        [2, 6],
        [7, 0]
      ]
    ]
  ],
  [
    [
      8,
      [4, 9]
    ],
    [
      [
        2,
        [5, 6]
      ],
      6
    ]
  ],
  [
    3,
    [
      [
        [9, 7],
        7
      ],
      [
        [2, 6],
        4
      ]
    ]
  ],
  [
    [
      [
        [3, 4],
        [0, 8]
      ],
      [
        [6, 4],
        [2, 6]
      ]
    ],
    [
      [
        [1, 4],
        [5, 4]
      ],
      8
    ]
  ],
  [
    8,
    [
      [
        0,
        [5, 5]
      ],
      [
        [1, 2],
        1
      ]
    ]
  ],
  [
    [
      [
        5,
        [8, 1]
      ],
      [
        [1, 8],
        [4, 0]
      ]
    ],
    [8, 8]
  ],
  [
    [
      [9, 5],
      3
    ],
    [
      [7, 9],
      [1, 6]
    ]
  ],
  [
    [
      [
        [1, 1],
        1
      ],
      [
        [2, 0],
        [2, 5]
      ]
    ],
    5
  ],
  [
    [
      3,
      [
        [5, 4],
        [7, 4]
      ]
    ],
    [
      [4, 4],
      [1, 9]
    ]
  ],
  [
    [
      0,
      [
        [7, 4],
        [7, 2]
      ]
    ],
    [
      [8, 0],
      [5, 9]
    ]
  ],
  [
    0,
    [
      [
        [1, 2],
        4
      ],
      [
        [1, 0],
        [6, 4]
      ]
    ]
  ],
  [
    [
      [
        [6, 6],
        [9, 8]
      ],
      3
    ],
    [
      [
        [5, 5],
        [1, 6]
      ],
      [
        8,
        [5, 3]
      ]
    ]
  ],
  [
    [
      7,
      [
        [5, 6],
        0
      ]
    ],
    [
      5,
      [
        [9, 2],
        4
      ]
    ]
  ],
  [
    [
      [
        4,
        [4, 5]
      ],
      [
        7,
        [4, 5]
      ]
    ],
    [
      [
        [9, 8],
        8
      ],
      [
        [8, 2],
        [3, 0]
      ]
    ]
  ],
  [
    [
      [
        8,
        [0, 5]
      ],
      [
        [0, 4],
        [8, 9]
      ]
    ],
    [
      8,
      [4, 6]
    ]
  ],
  [
    [
      [
        4,
        [9, 7]
      ],
      [
        [7, 4],
        [7, 1]
      ]
    ],
    [
      [
        [8, 4],
        0
      ],
      [
        [6, 9],
        [9, 0]
      ]
    ]
  ],
  [
    [3, 6],
    [
      [
        3,
        [4, 6]
      ],
      [
        [6, 0],
        0
      ]
    ]
  ],
  [
    3,
    [
      1,
      [
        [4, 0],
        1
      ]
    ]
  ],
  [
    [
      [9, 9],
      [
        0,
        [6, 3]
      ]
    ],
    [3, 2]
  ],
  [7, 4],
  [2, 6],
  [
    [
      [
        3,
        [7, 8]
      ],
      7
    ],
    [
      [
        0,
        [2, 5]
      ],
      [1, 1]
    ]
  ],
  [0, 5],
  [
    8,
    [
      8,
      [
        [2, 4],
        5
      ]
    ]
  ],
  [
    [
      [
        [8, 2],
        1
      ],
      [9, 0]
    ],
    [
      [
        [0, 8],
        [3, 0]
      ],
      9
    ]
  ],
  [
    [
      [
        [7, 0],
        1
      ],
      [
        [0, 1],
        [6, 7]
      ]
    ],
    [
      [
        [3, 1],
        [8, 3]
      ],
      7
    ]
  ],
  [8, 0],
  [
    [
      [
        7,
        [1, 3]
      ],
      [
        7,
        [7, 2]
      ]
    ],
    [
      [9, 0],
      4
    ]
  ],
  [
    [
      [
        [0, 3],
        5
      ],
      [
        [1, 0],
        8
      ]
    ],
    [
      [0, 2],
      9
    ]
  ],
  [
    [
      5,
      [
        [7, 6],
        [7, 2]
      ]
    ],
    5
  ],
  [
    [
      [
        [2, 8],
        [5, 4]
      ],
      [1, 6]
    ],
    [
      [8, 8],
      [
        [5, 2],
        4
      ]
    ]
  ],
  [
    [
      [
        [1, 5],
        [1, 8]
      ],
      1
    ],
    [
      [
        6,
        [2, 4]
      ],
      5
    ]
  ],
  [
    [
      [
        [9, 7],
        [6, 3]
      ],
      2
    ],
    [
      [
        3,
        [4, 4]
      ],
      [3, 4]
    ]
  ],
  [
    [
      [9, 2],
      [2, 9]
    ],
    [
      [
        [0, 7],
        [0, 8]
      ],
      [
        [0, 2],
        [6, 7]
      ]
    ]
  ],
  [
    [
      [
        [1, 1],
        3
      ],
      [
        [1, 4],
        [8, 9]
      ]
    ],
    [
      [
        8,
        [8, 6]
      ],
      [7, 7]
    ]
  ],
  [
    5,
    [
      [
        1,
        [8, 8]
      ],
      [6, 3]
    ]
  ],
  [
    [
      [1, 4],
      3
    ],
    7
  ],
  [
    [
      [
        [0, 1],
        [2, 0]
      ],
      2
    ],
    [
      [8, 8],
      7
    ]
  ],
  [
    [
      [
        [2, 8],
        [4, 4]
      ],
      [
        [5, 6],
        8
      ]
    ],
    [
      [
        [5, 3],
        1
      ],
      7
    ]
  ],
  [
    [
      9,
      [
        0,
        [8, 3]
      ]
    ],
    [5, 6]
  ],
  [
    [
      [
        0,
        [8, 9]
      ],
      [
        6,
        [8, 1]
      ]
    ],
    [
      [
        [2, 3],
        8
      ],
      [
        [4, 0],
        8
      ]
    ]
  ],
  [
    [
      2,
      [5, 4]
    ],
    [
      [7, 4],
      [
        [5, 0],
        3
      ]
    ]
  ],
  [
    [
      [
        [1, 1],
        2
      ],
      [
        [3, 0],
        [7, 7]
      ]
    ],
    [
      [
        1,
        [3, 8]
      ],
      2
    ]
  ],
  [
    [
      [1, 4],
      [
        6,
        [2, 4]
      ]
    ],
    [
      [5, 5],
      0
    ]
  ],
  [
    [
      [
        [4, 4],
        8
      ],
      [
        [4, 3],
        [3, 5]
      ]
    ],
    [
      [7, 1],
      2
    ]
  ],
  [
    [
      [
        4,
        [0, 8]
      ],
      9
    ],
    [
      [
        [6, 9],
        2
      ],
      8
    ]
  ],
  [
    [
      [
        [0, 0],
        1
      ],
      [1, 1]
    ],
    [
      2,
      [
        [0, 0],
        [7, 7]
      ]
    ]
  ],
  [
    [
      2,
      [5, 5]
    ],
    9
  ],
  [
    [
      [
        [5, 8],
        [7, 7]
      ],
      [
        [9, 8],
        5
      ]
    ],
    [
      [3, 5],
      [8, 8]
    ]
  ],
  [
    [
      5,
      [
        3,
        [3, 9]
      ]
    ],
    [
      3,
      [9, 8]
    ]
  ],
  [
    [
      8,
      [4, 6]
    ],
    [
      [5, 0],
      [9, 2]
    ]
  ],
  [
    [
      [
        3,
        [1, 8]
      ],
      [4, 5]
    ],
    [
      [
        0,
        [5, 9]
      ],
      6
    ]
  ],
  [
    9,
    [
      [1, 1],
      0
    ]
  ],
  [
    [
      [
        [6, 1],
        [9, 2]
      ],
      4
    ],
    [5, 3]
  ],
  [
    [
      [
        [3, 0],
        [0, 5]
      ],
      [
        1,
        [5, 2]
      ]
    ],
    [
      [
        [2, 0],
        [0, 2]
      ],
      [
        [6, 4],
        4
      ]
    ]
  ],
  [
    [
      [
        [1, 1],
        [4, 6]
      ],
      [
        [3, 8],
        [3, 2]
      ]
    ],
    [
      [
        [4, 3],
        7
      ],
      [
        2,
        [7, 8]
      ]
    ]
  ],
  [
    4,
    [
      [1, 5],
      5
    ]
  ],
  [
    8,
    [
      [1, 1],
      0
    ]
  ],
  [
    [
      [
        [8, 4],
        [9, 9]
      ],
      [
        3,
        [6, 6]
      ]
    ],
    [
      [
        [7, 9],
        [9, 7]
      ],
      7
    ]
  ],
  [
    [2, 5],
    [
      8,
      [3, 8]
    ]
  ],
  [
    [
      [6, 1],
      [
        7,
        [3, 5]
      ]
    ],
    9
  ],
  [
    [
      1,
      [
        [3, 6],
        [1, 0]
      ]
    ],
    [
      [
        [2, 8],
        8
      ],
      [
        4,
        [2, 7]
      ]
    ]
  ],
  [
    [
      [
        3,
        [6, 9]
      ],
      [
        [9, 6],
        [0, 8]
      ]
    ],
    [
      [
        5,
        [6, 4]
      ],
      [
        [3, 4],
        1
      ]
    ]
  ],
  [
    [
      [
        [7, 7],
        1
      ],
      [
        5,
        [2, 5]
      ]
    ],
    [
      [3, 7],
      [
        [4, 7],
        3
      ]
    ]
  ],
  [
    [
      4,
      [
        3,
        [7, 2]
      ]
    ],
    [
      [
        [8, 8],
        [5, 8]
      ],
      8
    ]
  ],
  [
    [
      3,
      [
        [9, 9],
        6
      ]
    ],
    6
  ],
  [
    [6, 7],
    [2, 9]
  ],
  [
    [
      [9, 7],
      [
        1,
        [4, 0]
      ]
    ],
    [
      [
        [3, 4],
        0
      ],
      [1, 2]
    ]
  ],
  [
    9,
    [
      [
        8,
        [8, 4]
      ],
      3
    ]
  ],
  [
    [
      [
        4,
        [4, 1]
      ],
      [
        [4, 7],
        [2, 3]
      ]
    ],
    [
      8,
      [
        5,
        [1, 5]
      ]
    ]
  ],
  [
    7,
    [
      2,
      [4, 1]
    ]
  ],
  [
    [
      [
        [1, 5],
        7
      ],
      [5, 9]
    ],
    8
  ],
  [
    [
      [
        [1, 5],
        [0, 4]
      ],
      8
    ],
    [
      [
        [7, 0],
        6
      ],
      [8, 3]
    ]
  ],
  [
    [
      [
        7,
        [3, 5]
      ],
      0
    ],
    [
      8,
      [
        9,
        [5, 6]
      ]
    ]
  ],
  [
    [
      1,
      [
        [5, 1],
        5
      ]
    ],
    [
      [5, 1],
      [
        9,
        [3, 0]
      ]
    ]
  ],
  [
    3,
    [
      [
        [8, 5],
        [7, 5]
      ],
      [9, 4]
    ]
  ],
  [
    [
      [3, 3],
      [
        2,
        [5, 9]
      ]
    ],
    7
  ],
];
