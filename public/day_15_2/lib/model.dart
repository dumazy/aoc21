import 'dart:math';

typedef Matrix = List<List<int>>;

extension MatrixExtensions on Matrix {
  List<int> getColumn(int index) => map((row) => row[index]).toList();
  int get width => map((row) => row.length).reduce(max);
  int get height => length;
  int getValue(Point point) => this[point.y][point.x];

  bool containsPoint(Point point) {
    return point.x >= 0 && point.x < width && point.y >= 0 && point.y < height;
  }

  String print() {
    String result = '';
    for (final row in this) {
      String line = '';
      for (final value in row) {
        line += value.toString();
      }
      line += '\n';
    }
    if (result.isNotEmpty) {
      return result.substring(0, result.length - 2);
    }
    return result;
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
  Point get top => Point(x, y - 1);
  Point get right => Point(x + 1, y);
  Point get bottom => Point(x, y + 1);

  Iterable<Point> getAdjacentPoints(int fieldSize) => {
        if (x > 0) left,
        // topLeft,
        if (y > 0) top,
        // topRight,
        if (x < fieldSize) right,
        // bottomRight,
        if (y < fieldSize) bottom,
        // bottomLeft,
      };
}
