// find the input at adventofcode.com
import 'dart:collection';
import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(String values) {
  final lines = values.split('\n').map((e) => e.trim());
  final total = lines.fold(
      0, (int value, element) => value + _getCorruptedLineScore(element));
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
  ')': 3,
  ']': 57,
  '}': 1197,
  '>': 25137,
};

int _getCorruptedLineScore(String line) {
  try {
    final queue = Queue<String>.from(line.split(''));
    readChunk(queue, queue.first);
  } on String catch (e) {
    final score = scores[e]!;
    print('Unexpected $e : $score');
    return score;
  }
  return 0;
}

void readChunk(Queue<String> queue, String first) {
  // final first = queue.removeFirst();
  // if (!closingChars.keys.contains(first)) {
  //   throw first;
  // }
  while (queue.isNotEmpty) {
    final next = queue.removeFirst();
    if (next == closingChars[first]) {
      return;
    }
    if (scores.keys.contains(next)) {
      throw next;
    }
    if (closingChars.keys.contains(next)) {
      readChunk(queue, next);
    }
  }
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
