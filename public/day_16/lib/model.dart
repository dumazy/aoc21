abstract class Packet {
  final String version;
  final String type;

  int get length;

  Packet(this.version, this.type);
}

class LiteralPacket extends Packet {
  final List<String> subs;
  final String tail;

  LiteralPacket(String version, String type, this.subs, this.tail)
      : super(version, type);

  int get subLength => subs.map((sub) => sub.length).reduce((v, e) => v + e);

  @override
  int get length => version.length + type.length + subLength + tail.length;
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
}
