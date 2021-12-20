import 'package:aoc_day12/parser.dart';

import 'fold_util.dart';
import 'model.dart';
import 'printer.dart';

class TransparentOrigami {
  final List<Point> _points;
  final List<Fold> _folds;

  TransparentOrigami(String input)
      : _points = parseInput(input).points,
        _folds = parseInput(input).folds;

  void call() {
    Set<Point> currentPoints = _points.toSet();
    _folds.forEach((fold) {
      final afterFold = foldSheet(currentPoints, fold);
      currentPoints = afterFold;
    });

    printPoints(currentPoints);
    // return currentPoints;
  }

  Set<Point> foldSheet(Set<Point> points, Fold fold) {
    final parts = getSides(points, fold);
    final foldedSide = parts.last
        .map((point) {
          if (fold.direction == FoldDirection.x) {
            if (point.x == fold.line) return null;
            final dx = point.x - fold.line;
            return Point(fold.line - dx, point.y);
          } else {
            if (point.y == fold.line) return null;
            final dy = point.y - fold.line;
            return Point(point.x, fold.line - dy);
          }
        })
        .whereType<Point>()
        .toList();
    return [...parts.first, ...foldedSide].toSet();
  }
}
