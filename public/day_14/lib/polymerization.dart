import 'model.dart';
import 'parser.dart';

class Polymerization {
  final String _start;
  final List<Instruction> _instructions;

  Polymerization(String input)
      : _start = parseInput(input).start,
        _instructions = parseInput(input).instructions;

  int call() {
    String value = _start;

    for (int i = 0; i < 40; i++) {
      value = applyMapping(value);
    }

    final letters = value.split('');
    final distinctLetters = Set.from(letters);

    final occurences = distinctLetters
        .map((letter) => letters.where((l) => l == letter).length)
        .toList()
      ..sort();

    return occurences.last - occurences.first;
  }

  String applyMapping(String value) {
    String newValue = '';
    for (int i = 0; i < value.length - 1; i++) {
      final pair = value.substring(i, i + 2);
      final parts = pair.split('');
      final matchingInstructions = _instructions.where((i) => i.values == pair);
      if (matchingInstructions.isEmpty) {
        continue;
      }
      final instruction = matchingInstructions.first;
      String replacement = parts.first + instruction.intersperseValue;
      newValue += replacement;
    }
    newValue += value.substring(value.length - 1);
    return newValue;
  }
}
