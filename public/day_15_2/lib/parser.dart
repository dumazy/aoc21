import 'model.dart';

List<List<int>> parseInput(String input) {
  return input
      .split('\n')
      .map((line) => line.split('').map((e) => int.parse(e)).toList())
      .toList();
}

List<List<int>> multiplyInput(Matrix input) {
  final result = List.generate(5, (y) {
    return input
        .map((row) =>
            List.generate(5, (x) => row.map((e) => e + x + y).toList())
                .expand((element) => element)
                .toList())
        .toList();
  }).expand((element) => element).toList();
  return result
      .map((row) => row.map((v) => ((v - 1) % 9) + 1).toList())
      .toList();
}
