import 'package:aoc_day12/passage_pathing.dart';
import 'package:test/test.dart';

void main() {
  group('Path', () {
    test('path is valid', () {
      final path = <String>[];
      path.addCave('start');
      path.addCave('A');
      path.addCave('c');
      path.addCave('A');
      path.addCave('end');

      expect(path.isValid, true);
    });

    test('path is not valid', () {
      final path = <String>[];
      path.addCave('start');
      path.addCave('A');
      path.addCave('c');
      path.addCave('c');
      path.addCave('A');
      path.addCave('end');

      expect(path.isValid, false);
    });
  });
}
