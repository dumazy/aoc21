import 'dart:math';

import 'model.dart';

void printPoints(Set<Point> points) {
  final width = points.map((p) => p.x).reduce(max);
  final height = points.map((p) => p.y).reduce(max);

  print('points: $points');
  print('result:');

  for (int y = 0; y <= height; y++) {
    String line = '';
    for (int x = 0; x <= width; x++) {
      if (points.contains(Point(x, y))) {
        line += '#';
      } else {
        line += '.';
      }
    }
    print(line);
  }
}
