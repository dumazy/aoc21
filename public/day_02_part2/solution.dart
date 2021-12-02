// values can be found on adventofcode.com
import 'values.dart';

void main() {
  final position = calculatePosition(values);
  final multiplied = position.horizontal * position.depth;
  print('Horizontal * depth = $multiplied');
}

Position calculatePosition(List<String> input) {
  return input
      .map(mapToMove)
      .fold<Position>(Position(0, 0, 0), (position, move) => position + move);
}

Move mapToMove(String command) {
  final parts = command.split(' ');
  final direction = parts.first;
  final space = int.parse(parts.last);
  switch (direction) {
    case 'forward':
      return Move(space, 0, space);
    case 'down':
      return Move(0, space, 0);
    case 'up':
      return Move(0, -space, 0);
    default:
      return Move(0, 0, 0);
  }
}

class Move {
  final int deltaHorizontal;
  final int deltaAim;
  final int depthMultiplier;

  Move(
    this.deltaHorizontal,
    this.deltaAim,
    this.depthMultiplier,
  );
}

class Position {
  final int horizontal;
  final int depth;
  final int aim;

  Position(this.horizontal, this.depth, this.aim);

  Position operator +(Move move) {
    final newHorizontal = horizontal + move.deltaHorizontal;
    final newDepth = depth + (aim * move.depthMultiplier);
    final newAim = aim + move.deltaAim;
    return Position(
      newHorizontal,
      newDepth,
      newAim,
    );
  }
}
