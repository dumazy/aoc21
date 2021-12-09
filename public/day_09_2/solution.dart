// find the input at adventofcode.com
import 'values.dart';

import 'dart:math';

void main() {
  _calculate(values);
}

void _calculate(String values) {
  final matrix = values.split('\n').map((e) => asDigits(e)).toList();
  final lowestPoints = Map<Point, int>();
  for (int y = 0; y < matrix.height; y++) {
    for (int x = 0; x < matrix.width; x++) {
      final startingPoint = Point(x, y);
      final lowest = findLowestPoint(matrix, startingPoint);
      if (matrix.getValue(startingPoint) != 9) {
        lowestPoints.update(lowest, (value) => value + 1, ifAbsent: () => 1);
      }
    }
  }
  final entries = lowestPoints.entries.toList();
  entries.sort((a, b) => b.value - a.value);
  final value = entries[0].value * entries[1].value * entries[2].value;

  print('result: $value');
}

Point findLowestPoint(Matrix matrix, Point startingPoint) {
  final adjacentPoints = [
    startingPoint.left,
    startingPoint.top,
    startingPoint.right,
    startingPoint.bottom,
    startingPoint,
  ];
  final valuePoints = adjacentPoints
      .map((point) => MapEntry(point, matrix.getValue(point)))
      .where((entry) => entry.value != null)
      .toList()
    ..sort((a, b) => a.value! - b.value!);
  final lowestPoint = valuePoints.first.key;
  if (lowestPoint == startingPoint) {
    return lowestPoint;
  }
  return findLowestPoint(matrix, lowestPoint);
}

typedef Matrix = List<List<int>>;

extension MatrixExtensions on Matrix {
  List<int> getColumn(int index) => map((row) => row[index]).toList();
  int get width => map((row) => row.length).reduce(max);
  int get height => length;
  int? getValue(Point point) {
    final y = point.y;
    if (y >= 0 && y < this.length) {
      final row = this[y];
      final x = point.x;
      if (x >= 0 && x < row.length) {
        return row[x];
      }
    }
  }
}

List<int> asDigits(String number) {
  return number.split('').map((b) => int.parse(b)).toList();
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  bool operator ==(Object other) {
    return other is Point && other.x == x && other.y == y;
  }

  @override
  String toString() => '($x,$y)';

  @override
  int get hashCode => toString().hashCode;

  Point get left => Point(x - 1, y);
  Point get top => Point(x, y - 1);
  Point get right => Point(x + 1, y);
  Point get bottom => Point(x, y + 1);
}

final testValues = """2199943210
3987894921
9856789892
8767896789
9899965678""";
