class Fold {
  final FoldDirection direction;
  final int line;

  Fold(this.direction, this.line);
}

enum FoldDirection {
  x,
  y,
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
}
