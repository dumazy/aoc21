import 'dart:math';

import 'package:aoc_day12/packet_decoder.dart';
import 'package:test/test.dart';

void main() {
  test(
    'parse string to binary string',
    () {
      final result = toBinaryString('D2FE28');
      expect(result, '110100101111111000101000');
    },
  );

  test(
    'parse string to binary list',
    () {
      final result = toBinaryList('D2FE28');
      expect(result, [
        1,
        1,
        0,
        1,
        0,
        0,
        1,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        0,
        1,
        0,
        0,
        0
      ]);
    },
  );
}
