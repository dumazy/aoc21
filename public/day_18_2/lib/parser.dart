import 'model.dart';

List<SnailfishNumber> parseInput(List<List<dynamic>> numbers) {
  return numbers
      .map((List<dynamic> number) => parseSnailfishPair(number))
      .toList();
}

SnailfishNumber parseSnailfishPair(List<dynamic> input) {
  SnailfishNumber first;
  if (input.first is int) {
    first = Single(input.first);
  } else {
    first = parseSnailfishPair(input.first);
  }

  SnailfishNumber last;
  if (input.last is int) {
    last = Single(input.last);
  } else {
    last = parseSnailfishPair(input.last);
  }

  return Pair(first, last);
}
