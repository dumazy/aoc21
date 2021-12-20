import 'dart:collection';

import 'model.dart';
import 'parser.dart';

class Chiton {
  final Matrix matrix;

  Chiton(String input) : matrix = multiplyInput(parseInput(input));

  int call() {
    final start = Point(0, 0);
    final end = Point(matrix.width - 1, matrix.height - 1);

    Map<Point, int> distanceFromStart = {
      start: 0,
    };
    int fieldSize = matrix.height - 1;
    Set<Point> unvisited = {};
    for (int y = 0; y < matrix.height; y++) {
      for (int x = 0; x < matrix.width; x++) {
        unvisited.add(Point(x, y));
      }
    }

    Map<Point, int> potentialNext = {
      start: 0,
    };

    while (unvisited.isNotEmpty) {
      printProgress(unvisited.length, matrix.width * matrix.height);

      final sorted = potentialNext.entries.toList()
        ..sort((a, b) => a.value - b.value);

      Point visit;
      if (sorted.isNotEmpty) {
        visit = sorted.first.key;
      } else {
        visit = unvisited.first;
      }

      final startDistance = distanceFromStart[visit]!;
      final neighbours = visit.getAdjacentPoints(fieldSize);
      for (final neighbour in neighbours) {
        final distance = startDistance + matrix.getValue(neighbour);
        final knownDistance = distanceFromStart[neighbour];
        if (knownDistance == null || distance < knownDistance) {
          distanceFromStart[neighbour] = distance;
          potentialNext[neighbour] = distance;
        }
      }

      potentialNext.remove(visit);
      unvisited.remove(visit);
    }

    print('distances: ${distanceFromStart.length}');
    return distanceFromStart[end]!;
  }

  void printProgress(int todo, int total) {
    final perPercent = total / 100;
    if (todo % perPercent == 0) {
      final done = total - todo;
      final percent = (done / total) * 100;
      print('${percent.toString().padLeft(3)} % done: $done / $total');
    }
  }
}
