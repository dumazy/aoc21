class TargetArea {
  final int startX;
  final int endX;
  final int startY;
  final int endY;

  TargetArea(this.startX, this.endX, this.startY, this.endY);

  factory TargetArea.fromInput(String input) {
    final ranges =
        input.replaceAll('target area: ', '').split(', ').map((range) {
      final rangeString = range.substring(2, range.length);
      return rangeString.split('..').map((e) => int.parse(e)).toList();
    }).toList();

    return TargetArea(
      ranges.first.first,
      ranges.first.last,
      ranges.last.first,
      ranges.last.last,
    );
  }

  int get rangeX => endX - startX + 1;
  int get rangeY => endY - startY + 1;

  bool withinX(int distance) => distance >= startX && distance <= endX;
  bool withinY(int distance) => distance >= startY && distance <= endY;

  bool contains(int posX, int posY) {
    return withinX(posX) && withinY(posY);
  }
}
