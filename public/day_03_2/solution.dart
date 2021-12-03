// find the input at adventofcode.com
import 'dart:math';

import 'values.dart';

void main() {
  _calculate(values);
}

void _calculate(List<String> values) {
  final matrix = values.map(asDigits).toList();
  final oxygen = calculateAir(matrix).first.asInt;
  final co2 = calculateAir(matrix, false).first.asInt;
  print('Result: ${co2 * oxygen}');
}

Matrix calculateAir(
  Matrix matrix, [
  bool useMostCommonValue = true,
  int columnIndex = 0,
]) {
  final column = matrix.getColumn(columnIndex);
  final majorityOne = column.sum >= matrix.height / 2;
  final bit = majorityOne ^ useMostCommonValue ? 1 : 0;
  final reducedMatrix = matrix.where((row) => row[columnIndex] == bit).toList();
  if (reducedMatrix.height == 1) {
    return reducedMatrix;
  } else {
    return calculateAir(reducedMatrix, useMostCommonValue, ++columnIndex);
  }
}

typedef Matrix = List<List<int>>;

extension MatrixExtensions on Matrix {
  List<int> getColumn(int index) => map((row) => row[index]).toList();
  int get width => map((row) => row.length).reduce(max);
  int get height => length;
}

extension BitArrayExtensions on List<int> {
  int get asInt => int.parse(this.map((i) => i.toString()).join(), radix: 2);
  int get sum => reduce((a, b) => a + b);
}

List<int> asDigits(String number) {
  return number.split('').map((b) => int.parse(b)).toList();
}

final testValues = [
  '00100',
  '11110',
  '10110',
  '10111',
  '10101',
  '01111',
  '00111',
  '11100',
  '10000',
  '11001',
  '00010',
  '01010',
];
