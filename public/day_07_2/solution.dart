// find the input at adventofcode.com
import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(List<int> values) {
  final idealPosition =
      (values.reduce((a, b) => a + b) / values.length).floor();
  final fuel = values
      .map((position) => (position - idealPosition).abs())
      .map(sumOfMoves)
      .reduce((totalCost, fuel) => totalCost + fuel);
  print('Total fuel cost: $fuel');
}

int sumOfMoves(int value) => ((value * (value + 1)) / 2).round();

final testValues = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14];
