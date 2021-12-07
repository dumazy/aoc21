// find the input at adventofcode.com
import 'values.dart';

void main() {
  _calculate(testValues);
}

void _calculate(List<int> values) {
  values.sort();
  final idealPosition = values[(values.length / 2).round()];
  final fuel = values
      .map((position) => (position - idealPosition).abs())
      .reduce((totalCost, fuel) => totalCost + fuel);
  print('Total fuel cost: $fuel');
}

final testValues = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14];
