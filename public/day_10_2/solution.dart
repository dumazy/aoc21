// find the input at adventofcode.com
import 'dart:collection';
import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(String values) {
  final lines = values.split('\n').map((e) => e.trim());
  final scores = lines
      .map((l) => _getMissingLinesScore(l))
      .where((element) => element != 0)
      .toList();
  scores.sort();
  print(scores);
  final total = scores[(scores.length / 2).floor()];
  print(total);
}

int score = 0;

Map<String, String> closingChars = {
  '(': ')',
  '[': ']',
  '{': '}',
  '<': '>',
};

Map<String, int> scores = {
  ')': 1,
  ']': 2,
  '}': 3,
  '>': 4,
};

int _getMissingLinesScore(String line) {
  try {
    final queue = Queue<String>.from(line.split(''));
    String missing = readChunk(queue, queue.first);
    if (scores.keys.contains(line.substring(line.length - 1))) {
      missing = missing.substring(1);
    }
    print('missing: $missing');
    final score = missing.split('').fold(0, (int v, e) => v * 5 + scores[e]!);
    print('score: $score');
    return score;
  } on String catch (e) {
    // print('Unexpected $e');
  }
  return 0;
}

String readChunk(Queue<String> queue, String first) {
  // print(
  //     'r: ${queue.fold('', (String value, String element) => value + element)} , first: $first');
  String next = '';
  String previousMissing = '';
  while (queue.isNotEmpty) {
    next = queue.removeFirst();
    if (next == closingChars[first]) {
      return '';
    }
    if (scores.keys.contains(next)) {
      throw next;
    }
    if (closingChars.keys.contains(next)) {
      previousMissing = readChunk(queue, next);
    }
  }
  if (next.isEmpty) {
    return '';
  }

  return previousMissing + closingChars[next]!;
}

// int _getCorruptedLineScore(String line) {

//   try {
//     final opens = line
//         .split('')
//         .where((element) => closingChars.keys.contains(element))
//         .length;
//     final closes = line.length - opens;
//     if (closes != opens) {
//       return 0;
//     }
//     final first = line.substring(0, 1);
//     readChunk(line.substring(1), first, 1);
//     print(score);
//   } on String catch (e) {
//     print('unexpected $e');
//   } finally {
//     int current = score;
//     score = 0;
//     print('line score: $current');
//     return current;
//   }
// }

// int readChunk(String chunk, String open, int indentation) {
//   // print('read chunk, opened with $open : $chunk');
//   int count = 1;
//   while (count <= chunk.length - 1) {
//     final next = chunk.substring(count - 1, count);
//     // print('indent: $indentation, next: $next, count: $count, chunk: $chunk');
//     // sleep(Duration(seconds: 1));
//     if (next == closingChars[open]) {
//       break;
//     }
//     if (closingChars.keys.contains(next)) {
//       int length = readChunk(chunk.substring(count), next, indentation + 1);
//       count = count + length;
//       continue;
//     }
//     if (scores.containsKey(next)) {
//       ++count;
//       score += scores[next]!;
//       throw next;
//     }
//   }
//   // print('return wiht $count');
//   return count;
// }

final testValues = """[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]""";
