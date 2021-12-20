import 'dart:math';

import 'package:aoc_day17/model.dart';

class TrickShot {
  final TargetArea target;
  int absoluteHighestY = 0;

  TrickShot(String input) : target = TargetArea.fromInput(input);

  // get highest Y value of valid velocity
  int call() {
    final validXVelocities = findValidXVelocities(target)..sort();
    // final validXVelocities = List.generate(200, (index) => 200 - index);

    final validYVelocities = List.generate(300, (index) => 200 - index);

    final highestPoints = <int>[];
    // outer:
    for (int y in validYVelocities) {
      for (int x in validXVelocities) {
        // print('trying ($x,$y)...');
        final result = isValidVelocity(target, y, x);
        if (result.hit) {
          print('$x,$y is a valid velocity');
          highestPoints.add(result.highestY);
        }
      }
    }
    // return highestPoints.reduce(max); // part one
    return highestPoints.length; // part two
  }

  Result isValidVelocity(TargetArea target, int velocityY, int velocityX) {
    int positionX = 0;
    int positionY = 0;
    int highestY = 0;
    while (true) {
      // update position
      positionX += velocityX;
      positionY += velocityY;

      // check overshot
      if (positionY < target.startY && positionY < 0) {
        break;
      }

      if (positionX > target.endX) {
        break;
      }

      // check undershot
      if (positionX < target.startX && velocityX <= 0) {
        break;
      }

      // update highest Y
      highestY = max(highestY, positionY);

      // check if in range
      if (target.withinX(positionX) && target.withinY(positionY)) {
        return Result(true, highestY);
      }

      // update velocity
      velocityX = velocityX > 0 ? velocityX - 1 : 0;
      --velocityY;
    }
    return Result(false, 0);
  }
}

class Result {
  final bool hit;
  final int highestY;

  Result(this.hit, this.highestY);
}

List<int> findValidXVelocities(TargetArea target) {
  final validX = <int>[];
  final minX = sqrt(target.startX * 2).floor();
  final minDistance = (minX * (minX + 1)) / 2;
  int velocity = minX;
  print('minX is $minX, because it goes to $minDistance');
  while (velocity <= target.endX) {
    int step = 1;
    int previousDistance = 0;
    int distance = 1;
    // bool overshot = false;
    print('testing distance: $distance');
    stepLoop:
    while (true) {
      distance = calculateDistanceX(velocity, step);
      if (distance == previousDistance) {
        break stepLoop;
      }
      previousDistance = distance;
      if (target.withinX(distance)) {
        print('$velocity is valid X after $step');
        validX.add(velocity);
        break stepLoop;
      }
      if (distance > target.endX) {
        // overshot = true;
        break stepLoop;
      }
      ++step;
    }
    ++velocity;
    previousDistance = 0;
  }

  return validX;
}

int calculateDistanceX(
  int velocity,
  int step, [
  int distance = 0,
  int stepsDone = 0,
]) {
  int stepsToDo = step - stepsDone;
  if (stepsToDo <= 0) {
    return distance;
  }
  distance += velocity;
  --velocity;
  return calculateDistanceX(velocity, step, distance, ++stepsDone);
}

List<int> findValidYVelocities(TargetArea target) {
  final validY = <int>[];
  int velocity = 0;

  while (velocity < target.startY.abs()) {
    int step = 1;
    bool overshot = false;
    // print('velocity: $velocity');
    stepLoop:
    while (!overshot) {
      final distance = (velocity * step) + (step - 1);
      // print('velocity: $velocity, step: $step, distance: $distance');
      if (distance > target.endX.abs()) {
        overshot = true;
        break stepLoop;
      }
      if (distance > target.startY.abs()) {
        validY.add(velocity);
        break stepLoop;
      }
      ++step;
    }
    ++velocity;
  }

  return validY;
}




// // List<int> findValidXVelocities(TargetArea target) {
// //   bool overshot = false;

// //   final minX = sqrt(target.startX * 2).floor();
// //   int velocity = minX;
// //   final validX = <int>[];
// //   while (velocity < target.startX) {
// //     int steps = 1;
// //     final distance = ((velocity * (velocity + 1)) / 2).floor();
// //     while (!overshot) {
// //       print('velocity $velocity, distance $distance');
// //       if (target.withinX(distance)) {
// //         validX.add(velocity);
// //       }
// //       if (distance > target.endX) {
// //         overshot = true;
// //       }
// //       ++steps;
// //     }

// //     ++velocity;
// //   }

//   return validX;
// }
