import 'model.dart';
import 'parser.dart';

class Chiton {
  final Matrix matrix;

  Chiton(String input) : matrix = parseInput(input);

  int call() {
    Map<Point, int> grid = {};

    //     grid.putIfAbsent(point, () => matrix.getValue(point));
    //   }
    // }
    final start = Point(0, 0);
    final end = Point(matrix.width - 1, matrix.height - 1);
    // Dijkstra

    Map<Point, int> distanceFromStart = {
      start: 0,
    };
    Map<Point, Point> previousPoint = {};
    for (int y = 0; y < matrix.height; y++) {
      for (int x = 0; x < matrix.width; x++) {
        final visit = Point(x, y);
        // print('point: $visit');
        final neighbours =
            visit.adjacentPoints.where((point) => matrix.containsPoint(point));
        for (final neighbour in neighbours) {
          // print('point: $visit - neighbour: $neighbour');
          final distance =
              distanceFromStart[visit]! + matrix.getValue(neighbour);
          final knownDistance = distanceFromStart[neighbour] ?? double.infinity;
          if (distance < knownDistance) {
            previousPoint[neighbour] = visit;
            distanceFromStart[neighbour] = distance;
          }
        }
      }
    }
    print('distances: ${distanceFromStart.length}');
    return distanceFromStart[end]!;
  }
}
