abstract class SnailfishNumber {
  SnailfishNumber operator +(SnailfishNumber other) {
    return Pair(this, other)..reduce();
  }

  bool canExplode([level = 1]);

  int get magnitude;
}

class Pair extends SnailfishNumber {
  SnailfishNumber left;
  SnailfishNumber right;

  Pair(this.left, this.right);

  bool canExplode([level = 1]) {
    if (level == 5) {
      return true;
    }
    if (left.canExplode(level + 1)) {
      return true;
    }
    if (right.canExplode(level + 1)) {
      return true;
    }
    return false;
  }

  bool canSplit() {
    bool resultLeft = false;
    if (left is Pair) {
      resultLeft = (left as Pair).canSplit();
    } else {
      resultLeft = (left as Single).canSplit();
    }

    bool resultRight = false;
    if (right is Pair) {
      resultRight = (right as Pair).canSplit();
    } else {
      resultRight = (right as Single).canSplit();
    }
    return resultLeft || resultRight;
  }

  bool split() {
    if (left is Pair) {
      final leftSplit = (left as Pair).split();
      if (leftSplit) return true;
    } else {
      final leftSingle = left as Single;
      if (leftSingle.canSplit()) {
        print('split left pair at $this');
        left = Pair(
          Single((leftSingle.value / 2).floor()),
          Single((leftSingle.value / 2).ceil()),
        );
        return true;
      }
    }
    if (right is Pair) {
      final rightSplit = (right as Pair).split();
      if (rightSplit) return true;
    } else {
      final rightSplit = right as Single;
      if (rightSplit.canSplit()) {
        print('split right pair at $this');
        right = Pair(
          Single((rightSplit.value / 2).floor()),
          Single((rightSplit.value / 2).ceil()),
        );
        return true;
      }
    }
    return false;
  }

  void reduce() {
    while (true) {
      if (canExplode()) {
        explode();
        continue;
      }
      if (canSplit()) {
        split();
        continue;
      }
      break;
    }
  }

  bool get ofSingles => left is Single && right is Single;

  ExplodeResult? explode([level = 1]) {
    // print('exploding at level $level, ${toString()}');
    ExplodeResult? result;
    if (left is Pair) {
      final leftPair = left as Pair;
      if (leftPair.ofSingles && level >= 4) {
        final leftPairLeft = leftPair.left as Single;
        final leftPairRight = leftPair.right as Single;
        print('exploding left at $this');
        left = Single(0);
        result = ExplodeResult(
          left: leftPairLeft.value,
          right: leftPairRight.value,
        );
      } else {
        result = leftPair.explode(level + 1);
        // print('left exploded, $result to apply at $this');
      }
      if (result != null) {
        if (result.carriesRight) {
          applyRight(result.right, true);
          return ExplodeResult(left: result.left);
        }
        return ExplodeResult(left: result.left, right: result.right);
      }
    }

    if (right is Pair) {
      final rightPair = right as Pair;
      if (rightPair.ofSingles && level >= 4) {
        final rightPairLeft = rightPair.left as Single;
        final rightPairRight = rightPair.right as Single;
        print('exploding right at $this');
        right = Single(0);
        result = ExplodeResult(
          left: rightPairLeft.value,
          right: rightPairRight.value,
        );
      } else {
        result = rightPair.explode(level + 1);
        // print('right exploded, $result to apply at $this');
      }
      if (result != null) {
        if (result.carriesLeft) {
          applyLeft(result.left);
          return ExplodeResult(right: result.right);
        }
        return ExplodeResult(left: result.left, right: result.right);
      }
    }
    print('no explosion result at $this (level $level)');
  }

  bool applyLeft(
    int value, [
    bool originLeft = false,
  ]) {
    if (left is Pair) {
      if (originLeft) {
        return (left as Pair).applyLeft(value, originLeft);
      } else {
        return (left as Pair).applyRight(value, originLeft);
      }
    }
    print('applying left at $this with value $value');
    final currentLeft = left as Single;
    left = Single(value + currentLeft.value);
    print('resulting in $this');
    return true;
  }

  bool applyRight(
    int value, [
    bool originLeft = false,
  ]) {
    if (right is Pair) {
      if (originLeft) {
        return (right as Pair).applyLeft(value, originLeft);
      } else {
        return (right as Pair).applyRight(value, originLeft);
      }
    }
    print('applying right at $this with value $value');
    final currentRight = right as Single;
    right = Single(value + currentRight.value);
    print('resulting in $this');
    return true;
  }

  int get magnitude => 3 * left.magnitude + 2 * right.magnitude;

  @override
  String toString() {
    return '[$left,$right]';
  }

  bool operator ==(Object other) =>
      other is Pair && other.left == left && other.right == right;
}

class Single extends SnailfishNumber {
  final int value;

  Single(this.value);

  bool canExplode([level = 1]) => false;
  bool canSplit() => value > 9;

  @override
  String toString() {
    return '$value';
  }

  int get magnitude => value;

  bool operator ==(Object other) => other is Single && other.value == value;
}

class ExplodeResult {
  final int left;
  final int right;

  ExplodeResult({
    this.left = -1,
    this.right = -1,
  });

  bool get carriesLeft => left >= 0;
  bool get carriesRight => right >= 0;

  @override
  String toString() {
    return 'result[$left, $right]';
  }
}
