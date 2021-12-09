// find the input at adventofcode.com

import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(String values) {
  final sum = values
      .split('\n')
      .map((e) => Entry.parseString(e))
      .map((entry) => entry.digits)
      .map((digitList) => digitList.map((e) => e.toString()).join())
      .map((s) => int.parse(s))
      .reduce((value, element) => value + element);
  print(sum);
}

List<String> createDictionary(Entry entry) {
  List<String> inputs = entry.inputs;
  List<String?> dictionary = List.generate(10, (index) => null);
  // while (dictionary.contains(null)) {
  //   if (dictionary.where((element) => element != null).length == 9) {
  //     dictionary[0] =
  //         inputs.singleWhere((element) => !dictionary.contains(element));
  //   }
  //   if (dictionary[1] == null) {
  //     dictionary[1] = inputs.singleWhere(isOne);
  //   }
  //   if (dictionary[4] == null) {
  //     dictionary[4] = inputs.singleWhere(isFour);
  //   }
  //   if (dictionary[7] == null) {
  //     dictionary[7] = inputs.singleWhere(isSeven);
  //   }
  //   if (dictionary[8] == null) {
  //     dictionary[8] = inputs.singleWhere(isEight);
  //   }
  //   String char1 = pos1(dictionary[1]!, dictionary[7]!);
  //   if (dictionary[6] == null) {
  //     dictionary[6] ==
  //         inputs.singleWhere((element) => isSix(dictionary[1]!, element));
  //   }
  //   String char3 = pos3(dictionary[1]!, dictionary[6]!);
  //   if(dictionary[5] == null) {
  //     dictionary[5] ==
  //   }
  // }

  String one = inputs.singleWhere(isOne);
  String four = inputs.singleWhere(isFour);
  String seven = inputs.singleWhere(isSeven);
  String eight = inputs.singleWhere(isEight);
  String char1 = pos1(one, seven);
  String six = inputs.singleWhere((element) => isSix(one, element));
  String char3 = pos3(one, six);
  String five = inputs.singleWhere((element) => isFive(element, char3));
  String char5 = pos5(five, six);
  String char6 = pos6(seven, char1, char3);
  String two = inputs.singleWhere((element) => isTwo(element, char6));
  String three =
      inputs.singleWhere((element) => isThree(element, char3, char6));
  String nine = inputs.singleWhere((element) => isNine(element, char5));

  dictionary[1] = one;
  dictionary[2] = two;
  dictionary[3] = three;
  dictionary[4] = four;
  dictionary[5] = five;
  dictionary[6] = six;
  dictionary[7] = seven;
  dictionary[8] = eight;
  dictionary[9] = nine;
  dictionary[0] =
      inputs.singleWhere((element) => !dictionary.contains(element));

  return dictionary.whereType<String>().toList();
}

String pos1(String one, String seven) =>
    seven.split('').where((c) => !one.contains(c)).first;
String pos3(String one, String six) =>
    one.split('').firstWhere((c) => !six.contains(c));
String pos5(String five, String six) =>
    six.split('').singleWhere((c) => !five.contains(c));
String pos6(String seven, String pos1, String pos3) =>
    seven.split('').singleWhere((c) => c != pos1 && c != pos3);
bool isOne(String value) => value.length == 2;
bool isTwo(String value, String pos6) =>
    value.length == 5 && !value.contains(pos6);
bool isThree(String value, String pos3, String pos6) =>
    value.length == 5 && value.contains(pos3) && value.contains(pos6);
bool isFour(String value) => value.length == 4;
bool isFive(String value, String pos3) =>
    value.length == 5 && !value.contains(pos3);
bool isSix(String one, String value) =>
    value.length == 6 && one.split('').any((c) => !value.contains(c));
bool isSeven(String value) => value.length == 3;
bool isEight(String value) => value.length == 7;
bool isNine(String value, String pos5) =>
    value.length == 6 && !value.contains(pos5);
// bool isZero(String value) => value.length == 6; // leftover

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
  late List<String> dictionary;

  Entry(this.inputs, this.outputs) {
    this.dictionary = createDictionary(this);
  }

  factory Entry.parseString(String entry) {
    final parts = entry.split(' | ');
    return Entry(parts.first.split(' '), parts.last.split(' '));
  }

  List<int> get digits {
    return outputs
        .map((digit) => dictionary.indexWhere((element) =>
            element.length == digit.length &&
            element.split('').every((char) => digit.contains(char))))
        .toList();
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
