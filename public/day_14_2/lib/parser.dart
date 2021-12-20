import 'model.dart';

class ParseResult {
  final String start;
  final List<Instruction> instructions;

  ParseResult(this.start, this.instructions);
}

ParseResult parseInput(String input) {
  final parts = input.split('\n\n');

  final instructions = _parseInstructions(parts.last);

  return ParseResult(parts.first, instructions);
}

List<Instruction> _parseInstructions(String input) {
  return input.split('\n').map((instructionLine) {
    final parts = instructionLine.split(' -> ');
    return Instruction(parts.first, parts.last);
  }).toList();
}
