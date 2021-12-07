// find the input at adventofcode.com
import 'dart:collection';

import 'values.dart';

void main() {
  _calculate(numbers, boards);
}

void _calculate(List<int> numbers, String boardData) {
  final numberQueue = Queue<int>.from(numbers);
  final boards =
      boardData.split('\n\n').map((data) => Board.parseString(data)).toList();

  print('boards: $boards');

  late Board winningBoard;
  late int winningNumber;
  loop:
  while (numberQueue.isNotEmpty) {
    final number = numberQueue.removeFirst();
    print('number: $number');
    for (Board board in boards) {
      board.checkNumber(number);
      final row = board.bingoRow();
      if (row != null) {
        winningBoard = board;
        winningNumber = number;
        break loop;
      }
    }
  }

  print('winning board: $winningBoard');
  print('winning number: $winningNumber');

  final result = winningBoard.remainingNumbers
          .reduce((value, element) => value + element) *
      winningNumber;
  print(result);
}

class Board {
  final List<List<int>> matrix;
  final List<int> numbers = [];

  Board(this.matrix);

  factory Board.parseString(String info) {
    final data = info
        .split('\n')
        .map((rowInfo) => RegExp('\\w+')
            .allMatches(rowInfo)
            .map((match) => int.parse(match.group(0)!))
            .toList())
        .toList();
    print('parse data: $data');
    return Board(data);
  }

  void checkNumber(int number) {
    numbers.add(number);
  }

  List<int>? bingoRow() {
    final hasBingoRow = matrix.any(
      (row) => row.every((number) => numbers.contains(number)),
    );
    if (hasBingoRow) {
      return matrix
          .firstWhere((row) => row.every((number) => numbers.contains(number)));
    }
    List<int>? bingoColumn;
    for (int i = 0; i < 5; i++) {
      final column = getColumn(i);
      if (column.every((element) => numbers.contains(element))) {
        bingoColumn = column;
      }
    }
    return bingoColumn;
  }

  List<int> getColumn(int index) => matrix.map((row) => row[index]).toList();

  List<int> get numbersOnBoard => matrix.expand((row) => row).toList();
  List<int> get remainingNumbers =>
      numbersOnBoard.where((number) => !numbers.contains(number)).toList();

  @override
  String toString() {
    return '\n' +
        matrix
            .map((row) =>
                row.map((col) => col.toString()).join(' ') +
                (row.every((number) => numbers.contains(number))
                    ? ' <-- winning '
                    : ''))
            .join('\n');
  }
}

final testNumbers = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24];
final testBoards = """22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7""";
