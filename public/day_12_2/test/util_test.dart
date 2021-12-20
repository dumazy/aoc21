import 'package:aoc_day12/passage_pathing.dart';
import 'package:test/test.dart';

void main() {
  group('Passage Pathing utils', () {
    test('get tunnels from input', () {
      final puzzle = PassagePathing(input);
      final tunnels = puzzle.tunnels;
      expect(tunnels.length, 7);
    });

    test('get start tunnels from input', () {
      final puzzle = PassagePathing(input);
      final startTunnels = puzzle.startTunnels;
      expect(startTunnels.length, 2);
    });

    test('get start paths from input', () {
      final puzzle = PassagePathing(input);
      final startPaths = puzzle.startPaths;
      expect(startPaths.length, 2);
      expect(startPaths.first, ['start', 'A']);
      expect(startPaths.last, ['start', 'b']);
    });

    test('get possible next caves', () {
      final puzzle = PassagePathing(input);
      final nextCaves = puzzle.getPossibleNextCaves('A');

      expect(nextCaves.contains('c'), true);
      expect(nextCaves.contains('b'), true);
      expect(nextCaves.contains('end'), true);
      expect(nextCaves.length, 3);
    });
  });
}

final input = """start-A
start-b
A-c
A-b
b-d
A-end
b-end""";
