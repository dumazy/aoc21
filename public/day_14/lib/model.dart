class Instruction {
  final String values;
  final String intersperseValue;

  Instruction(this.values, this.intersperseValue);

  @override
  String toString() {
    return '$values -> $intersperseValue';
  }
}
