// find the input at adventofcode.com
import 'dart:math';

import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(String values) {
  Map<Point, int> octopusGrid = {};
  final matrix = values.split('\n').map((e) => asDigits(e)).toList();
  for (int y = 0; y < matrix.height; y++) {
    for (int x = 0; x < matrix.width; x++) {
      final point = Point(x, y);
      octopusGrid.putIfAbsent(point, () => matrix.getValue(point));
    }
  }

  printGrid(octopusGrid);

  final steps = 100;
  final flashes = _calculateNumberOfFlashes(octopusGrid, steps);
  print('After $steps steps, there were $flashes flashes');
}

int _calculateNumberOfFlashes(
  Map<Point, int> initialGrid,
  int steps, [
  int flashes = 0,
]) {
  final grid = initialGrid.map((key, value) => MapEntry(key, value + 1));
  final flashPoints = Set<Point>();
  bool shouldRerun = false;
  do {
    shouldRerun = false;
    var updatedFlashPoints = grid.keys
        .where((point) => grid[point]! > 9)
        .where((element) => !flashPoints.contains(element));

    updatedFlashPoints.forEach((point) {
      flashPoints.add(point);
      point.adjacentPoints.forEach((adjacentPoint) {
        grid.update(adjacentPoint, (value) {
          if (value == 9) {
            shouldRerun = true;
          }
          return value + 1;
        });
      });
    });
  } while (shouldRerun);
  final newFlashes = flashPoints.length;
  flashPoints.forEach((point) => grid.update(point, (value) => 0));
  flashes += newFlashes;
  --steps;

  printGrid(grid);

  if (steps <= 0) {
    return flashes;
  } else {
    return _calculateNumberOfFlashes(grid, steps, flashes);
  }
}

const fieldSize = 10;

typedef Matrix = List<List<int>>;

extension MatrixExtensions on Matrix {
  List<int> getColumn(int index) => map((row) => row[index]).toList();
  int get width => map((row) => row.length).reduce(max);
  int get height => length;
  int getValue(Point point) {
    final y = point.y;
    if (y >= 0 && y < this.length) {
      final row = this[y];
      final x = point.x;
      if (x >= 0 && x < row.length) {
        return row[x];
      }
    }
    throw Exception('Matrix out of bounds: $point');
  }
}

List<int> asDigits(String number) {
  return number.split('').map((b) => int.parse(b)).toList();
}

void printGrid(Map<Point, int> grid) {
  print('\n');
  for (int y = 0; y < fieldSize; y++) {
    String line = '';
    for (int x = 0; x < fieldSize; x++) {
      final point = Point(x, y);
      line += grid[point].toString();
    }
    print(line);
  }
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
  Point get topLeft => Point(x - 1, y - 1);
  Point get top => Point(x, y - 1);
  Point get topRight => Point(x + 1, y - 1);
  Point get right => Point(x + 1, y);
  Point get bottomRight => Point(x + 1, y + 1);
  Point get bottom => Point(x, y + 1);
  Point get bottomLeft => Point(x - 1, y + 1);

  List<Point> get adjacentPoints => [
        left,
        topLeft,
        top,
        topRight,
        right,
        bottomRight,
        bottom,
        bottomLeft,
      ]
          .where((point) =>
              point.x >= 0 &&
              point.x < fieldSize &&
              point.y >= 0 &&
              point.y < fieldSize)
          .toList();
}

final testValues = """5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526""";
