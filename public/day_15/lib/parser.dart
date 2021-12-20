List<List<int>> parseInput(String input) {
  return input
      .split('\n')
      .map((line) => line.split('').map((e) => int.parse(e)).toList())
      .toList();
}
