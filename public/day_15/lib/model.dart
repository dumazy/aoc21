import 'dart:math';

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

  bool containsPoint(Point point) {
    return point.x >= 0 && point.x < width && point.y >= 0 && point.y < height;
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
        // topLeft,
        top,
        // topRight,
        right,
        // bottomRight,
        bottom,
        // bottomLeft,
      ].toList();
}
