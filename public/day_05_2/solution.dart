// find the input at adventofcode.com
import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(List<String> values) {
  final lines = parseValues(values);
  final board = Board(lines);
  final crossingPoints = board.vents.entries.where((entry) => entry.value > 1);
  print('result: ${crossingPoints.length}');
}

List<Line> parseValues(List<String> values) {
  return values.map((line) => Line.fromString(line)).toList();
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  factory Point.fromString(String input) {
    final values = input.split(',').map((e) => int.parse(e));
    return Point(values.first, values.last);
  }

  @override
  bool operator ==(Object other) {
    return other is Point && other.x == x && other.y == y;
  }

  @override
  String toString() => '($x,$y)';

  @override
  int get hashCode => toString().hashCode;
}

class Line {
  final Point start;
  final Point end;

  Line(this.start, this.end);

  factory Line.fromString(String input) {
    final points = input.split(' -> ').map((e) => Point.fromString(e));
    return Line(points.first, points.last);
  }

  bool get isHorizontal => start.y == end.y;
  bool get isVertical => start.x == end.x;
  bool get isDiagonalTopLeftToBottomRight =>
      (end.x - start.x) == (end.y - start.y);
  bool get isDiagonalTopRightToBottomLeft =>
      (start.x - end.x) == (end.y - start.y);

  List<Point> get points {
    print('line: $start -> $end');
    if (isHorizontal) {
      final left = start.x < end.x ? start : end;
      final right = start.x > end.x ? start : end;
      return [
        ...List.generate(right.x - left.x, (i) => Point(left.x + i, left.y)),
        right,
      ];
    }
    if (isVertical) {
      final top = start.y < end.y ? start : end;
      final bottom = start.y > end.y ? start : end;
      return [
        ...List.generate(bottom.y - top.y, (i) => Point(top.x, top.y + i)),
        bottom,
      ];
    }
    if (isDiagonalTopLeftToBottomRight) {
      print('diagonal \\');
      final top = start.y < end.y ? start : end;
      final bottom = start.y > end.y ? start : end;
      final result = [
        ...List.generate(bottom.y - top.y, (i) => Point(top.x + i, top.y + i)),
        bottom,
      ];
      print('result: $result');
      return result;
    }
    if (isDiagonalTopRightToBottomLeft) {
      print('diagonal /');
      final top = start.y < end.y ? start : end;
      final bottom = start.y > end.y ? start : end;
      final result = [
        ...List.generate(bottom.y - top.y, (i) => Point(top.x - i, top.y + i)),
        bottom,
      ];
      print('result: $result');
      return result;
    }
    print('not horizontal or vertical');
    return [];
  }
}

class Board {
  final List<Line> lines;

  Board(this.lines);

  Map<Point, int> get vents {
    final points =
        lines.map((line) => line.points).expand((element) => element).toList();
    final result = Map<Point, int>();
    for (Point point in points) {
      result.update(point, (value) => value + 1, ifAbsent: () => 1);
    }
    print('vents: $result');
    return result;
  }
}

final testValues = [
  '0,9 -> 5,9',
  '8,0 -> 0,8',
  '9,4 -> 3,4',
  '2,2 -> 2,1',
  '7,0 -> 7,4',
  '6,4 -> 2,0',
  '0,9 -> 2,9',
  '3,4 -> 1,4',
  '0,0 -> 8,8',
  '5,5 -> 8,2',
];
