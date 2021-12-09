// find the input at adventofcode.com
import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(String values) {
  final amountOfKnownDigits = values
      .split('\n')
      .map((e) => Entry.parseString(e))
      .map((entry) => entry.outputs.map((output) => digit(output)))
      .expand((element) => element)
      .where((element) => element != -1)
      .length;
  print('Result: $amountOfKnownDigits');
}

int digit(String input) {
  switch (input.length) {
    case 2:
      return 1;
    case 3:
      return 7;
    case 4:
      return 4;
    case 7:
      return 8;
    default:
      return -1;
  }
}

class Entry {
  final List<String> inputs;
  final List<String> outputs;

  Entry(this.inputs, this.outputs);

  factory Entry.parseString(String entry) {
    final parts = entry.split(' | ');
    return Entry(parts.first.split(' '), parts.last.split(' '));
  }
}

final testValues =
    """be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce""";
