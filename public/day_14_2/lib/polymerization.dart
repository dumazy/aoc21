import 'model.dart';
import 'parser.dart';

class Polymerization {
  final String _start;
  final List<Instruction> _instructions;

  Polymerization(String input)
      : _start = parseInput(input).start,
        _instructions = parseInput(input).instructions;

  int call() {
    Map<String, int> pairOccurences = {};
    Map<String, int> letterOccurences = {};

    _start.split('').forEach((letter) {
      letterOccurences.update(letter, (value) => value + 1, ifAbsent: () => 1);
    });

    for (int i = 0; i < _start.length - 1; i++) {
      final pair = _start.substring(i, i + 2);
      pairOccurences.update(pair, (value) => value + 1, ifAbsent: () => 1);
    }

    for (int i = 0; i < 40; i++) {
      pairOccurences = applyMapping(pairOccurences, letterOccurences);
    }

    final sorted = letterOccurences.entries.toList()
      ..sort((a, b) => (a.value - b.value).toInt());
    final most = sorted.last;
    final least = sorted.first;
    print('most: $most');
    print('least: $least');

    return (most.value - least.value).toInt();
  }

  Map<String, int> applyMapping(
    Map<String, int> pairMap,
    Map<String, int> letterOccurences,
  ) {
    final increases = <String, int>{};
    final decreases = <String, int>{};
    for (final entry in pairMap.entries) {
      final pair = entry.key;
      final occurences = entry.value;
      if (occurences < 1) {
        continue;
      }
      final matchingInstructions = _instructions.where((i) => i.values == pair);
      if (matchingInstructions.isEmpty) {
        print('no instructions: $pair');
        continue;
      }
      final instruction = matchingInstructions.first;
      final frontPair = pair.first + instruction.intersperseValue;
      final backPair = instruction.intersperseValue + pair.second;
      letterOccurences.update(
          instruction.intersperseValue, (value) => value + occurences,
          ifAbsent: () => occurences);
      increases.update(frontPair, (value) => value + occurences,
          ifAbsent: () => occurences);
      increases.update(backPair, (value) => value + occurences,
          ifAbsent: () => occurences);
      decreases.update(pair, (value) => value + occurences,
          ifAbsent: () => occurences);
    }

    increases.forEach((key, increase) {
      pairMap.update(key, (value) => value + increase,
          ifAbsent: () => increase);
    });
    decreases.forEach((key, decrease) {
      pairMap.update(key, (value) => value - decrease);
    });
    increases.clear();
    decreases.clear();
    return pairMap;
  }
}

extension PairExtensions on String {
  String get first => substring(0, 1);
  String get second => substring(1, 2);
}
