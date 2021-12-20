import 'package:aoc_day/model.dart';
import 'package:aoc_day/parser.dart';

class Snailfish {
  final List<SnailfishNumber> numbers;

  Snailfish(List<List<dynamic>> input) : numbers = parseInput(input);

  SnailfishNumber call() {
    final sum = numbers.reduce((value, element) => value + element);
    return sum;
  }
}
