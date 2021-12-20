import 'dart:math';

import 'package:aoc_day/model.dart';
import 'package:aoc_day/parser.dart';

class Snailfish {
  final List<SnailfishNumber> numbers;

  Snailfish(List<List<dynamic>> input) : numbers = parseInput(input);

  int call() {
    // largest magnitude
    int largest = 0;
    int sumsDone = 0;
    List<SnailfishNumber> highestMag = [];

    for (SnailfishNumber number in numbers) {
      final others = numbers.where((element) => element != number);
      for (SnailfishNumber other in others) {
        final sum = number + other;
        final otherSum = other + number;

        sumsDone += 2;
        final magnitude = max(sum.magnitude, otherSum.magnitude);
        if (magnitude > largest) {
          if (sum.magnitude > otherSum.magnitude) {
            highestMag = [number, other];
          } else {
            highestMag = [other, number];
          }
        }
        largest = max(largest, magnitude);
      }
    }
    print('after $sumsDone sums:');
    print('${highestMag.first}');
    print('+');
    print('${highestMag.last}');
    print('=');
    final sum = highestMag.first + highestMag.last;
    print('${sum}');
    print('with mag of ${sum.magnitude}');
    return largest;
  }
}
