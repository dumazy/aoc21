import 'model.dart';

class ParseResult {
  final List<Point> points;
  final List<Fold> folds;

  ParseResult(this.points, this.folds);
}

ParseResult parseInput(String input) {
  final parts = input.split('\n\n');

  final points = _parsePoints(parts.first);
  final folds = _parseFolds(parts.last);

  return ParseResult(points, folds);
}

List<Point> _parsePoints(String input) {
  return input.split('\n').map((pointInput) {
    final parts = pointInput.split(',');
    return Point(int.parse(parts.first), int.parse(parts.last));
  }).toList();
}

List<Fold> _parseFolds(String input) {
  return input.split('\n').map((foldInput) {
    final withoutPrefix = foldInput.replaceAll('fold along ', '');
    final parts = withoutPrefix.split('=');
    final line = int.parse(parts.last);
    if (parts.first == 'x') {
      return Fold(FoldDirection.x, line);
    } else {
      return Fold(FoldDirection.y, line);
    }
  }).toList();
}
