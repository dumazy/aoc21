// find the input at adventofcode.com
import 'values.dart';

void main() {
  _calculate(testDays, values);
}

void _calculate(int numberOfDays, List<int> initialValues) {
  List<int> yesterdayTimers = List.generate(9, (index) => 0);
  initialValues.forEach((initial) {
    yesterdayTimers[initial] = yesterdayTimers[initial] + 1;
  });
  int dayCounter = 0;
  List<int> todayTimers = List.generate(9, (index) => 0);
  while (dayCounter < numberOfDays) {
    for (int i = 8; i >= 0; i--) {
      if (i != 0) {
        todayTimers[i - 1] = yesterdayTimers[i];
      } else {
        todayTimers[6] = todayTimers[6] + yesterdayTimers[0];
        todayTimers[8] = yesterdayTimers[0];
      }
    }
    ++dayCounter;
    yesterdayTimers = [...todayTimers];
  }
  final count = todayTimers.reduce((p, c) => p + c);
  print('After ${dayCounter} days, there are ${count} lanternfish');
}

final testDays = 256;
final testValues = [3, 4, 3, 1, 2];
