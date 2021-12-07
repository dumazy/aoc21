// find the input at adventofcode.com
import 'values.dart';

void main() {
  _calculate(testDays, testValues);
}

void _calculate(int numberOfDays, List<int> initialValues) {
  List<int> yesterday = initialValues;
  List<int> today = [];
  int dayCounter = 0;
  int count = 0;
  while (dayCounter < numberOfDays) {
    today = yesterday
        .map((timer) {
          if (timer == 0) return [6, 8];
          return [--timer];
        })
        .expand((element) => element)
        .toList();
    ++dayCounter;
    yesterday = today;
    count = today.length;
  }
  print('After ${dayCounter} days, there are ${count} lanternfish');
}

final testDays = 80;
final testValues = [3, 4, 3, 1, 2];
