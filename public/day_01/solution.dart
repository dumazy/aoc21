import 'values.dart';

void main() {
  final increases = calculateIncreases(values);
  print('Increases (part one): $increases');

  final first = values;
  final second = values.skip(1).toList();
  final third = values.skip(2).toList();

  final sums = <int>[];
  for (int i = 0; i < third.length; i++) {
    sums.add(first[i] + second[i] + third[i]);
  }
  final sumIncreases = calculateIncreases(sums);
  print('Sum increases (part two): $sumIncreases');
}

int calculateIncreases(List<int> values) {
  final result = values.fold<Result>(Result(0, 0), (res, value) {
    if (res.previousValue == 0) return Result(value, 0);
    final increase = value > res.previousValue ? 1 : 0;
    final increases = res.increases + increase;
    return Result(value, increases);
  });
  return result.increases;
}

class Result {
  final int previousValue;
  final int increases;

  Result(this.previousValue, this.increases);
}
