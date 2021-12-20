import 'model.dart';

List<List<Point>> getSides(Set<Point> points, Fold fold) {
  return points.fold(<List<Point>>[[], []],
      (List<List<Point>> parts, Point point) {
    if (fold.direction == FoldDirection.x) {
      if (point.x < fold.line) {
        parts.first.add(point);
      }
      if (point.x > fold.line) {
        parts.last.add(point);
      }
    } else {
      if (point.y < fold.line) {
        parts.first.add(point);
      }
      if (point.y > fold.line) {
        parts.last.add(point);
      }
    }
    return parts;
  });
}
