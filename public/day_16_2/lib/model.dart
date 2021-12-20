import 'dart:math';

abstract class Packet {
  final String version;
  final String type;

  int get length;

  Packet(this.version, this.type);

  int get value;
}

class LiteralPacket extends Packet {
  final List<String> subs;
  final String tail;

  LiteralPacket(String version, String type, this.subs, this.tail)
      : super(version, type);

  int get subLength => subs.map((sub) => sub.length).reduce((v, e) => v + e);

  @override
  int get length => version.length + type.length + subLength + tail.length;

  String get binaryValue => subs.map((s) => s.substring(1, s.length)).join('');

  int get value => int.parse(binaryValue, radix: 2);
}

class OperatorPacket extends Packet {
  final bool shortSubLengthIndicator;
  final String subLengthIndicator;
  final List<Packet> subs;
  OperatorPacket(
    String version,
    String type,
    this.shortSubLengthIndicator,
    this.subLengthIndicator,
    this.subs,
  ) : super(version, type);

  int get subLength => subs.map((sub) => sub.length).reduce((v, e) => v + e);

  @override
  int get length =>
      version.length + type.length + 1 + subLengthIndicator.length + subLength;

  int get value {
    switch (int.parse(type, radix: 2)) {
      case 0:
        return _sum();
      case 1:
        return _product();
      case 2:
        return _min();
      case 3:
        return _max();
      case 5:
        return _greater();
      case 6:
        return _less();
      case 7:
        return _equal();
      default:
        throw 'invalid type';
    }
  }

  int _sum() {
    return subs
        .map((sub) => sub.value)
        .reduce((value, element) => value + element);
  }

  int _product() {
    return subs
        .map((sub) => sub.value)
        .reduce((value, element) => value * element);
  }

  int _min() {
    return subs.map((sub) => sub.value).reduce(min);
  }

  int _max() {
    return subs.map((sub) => sub.value).reduce(max);
  }

  int _greater() {
    if (subs.first.value > subs.last.value) return 1;
    return 0;
  }

  int _less() {
    if (subs.first.value < subs.last.value) return 1;
    return 0;
  }

  int _equal() {
    if (subs.first.value == subs.last.value) return 1;
    return 0;
  }
}
