// find the input at adventofcode.com
import 'values.dart';

void main() {
  final position = values
      .map(mapToMove)
      .fold<Position>(Position(0, 0), (position, move) => position + move);
  final multiplied = position.horizontal * position.depth;
  print('Horizontal * depth = $multiplied');
}

Move mapToMove(String command) {
  final parts = command.split(' ');
  final direction = parts.first;
  final space = int.parse(parts.last);
  switch (direction) {
    case 'forward':
      return Move(space, 0);
    case 'down':
      return Move(0, space);
    case 'up':
      return Move(0, -space);
    default:
      return Move(0, 0);
  }
}

class Move {
  final int deltaHorizontal;
  final int deltaDepth;

  Move(this.deltaHorizontal, this.deltaDepth);
}

class Position {
  final int horizontal;
  final int depth;

  Position(this.horizontal, this.depth);

  Position operator +(Move move) {
    return Position(
      horizontal + move.deltaHorizontal,
      depth + move.deltaDepth,
    );
  }
}
