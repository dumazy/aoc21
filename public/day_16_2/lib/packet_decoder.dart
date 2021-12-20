import 'dart:collection';

import 'package:aoc_day12/main.dart';

import 'model.dart';

class PacketDecoder {
  final String input;

  PacketDecoder(this.input);

  final List<Packet> allPackets = [];

  int call() {
    String binaryString = toBinaryString(input);

    final packet = parsePacket(binaryString);

    return packet.value;
  }

  Packet parsePacket(String input) {
    print('parse packet: $input');
    final header = input.substring(0, 6);
    final version = header.substring(0, 3);
    final type = header.substring(3);
    final rest = input.substring(6);
    print('type: $type');
    final packet = type == '100'
        ? parseLiteralPacket(version, type, rest)
        : parseOperatorPacket(version, type, rest);
    allPackets.add(packet);
    return packet;
  }

  LiteralPacket parseLiteralPacket(String version, String type, String rest) {
    print('parsing literal packet');
    bool keepReading = true;
    final subs = <String>[];
    int restOffset = 0;
    while (keepReading) {
      final sub = rest.substring(restOffset, restOffset + 5);
      final startsWith = sub.substring(0, 1);
      if (startsWith == '0') {
        keepReading = false;
      }
      subs.add(sub);
      restOffset += 5;
    }
    // final mod = (6 + restOffset) % 4;
    // print('mod: $mod');
    // final tailLength = mod > 0 ? 4 - mod : 0;
    String tail = rest.substring(restOffset);
    if (tail.contains('1')) {
      tail = '';
    }

    return LiteralPacket(version, type, subs, tail);
  }

  OperatorPacket parseOperatorPacket(String version, String type, String rest) {
    print('parsing operator packet');
    int restOffset = 0;
    final immediateSubsIndicator = rest.substring(restOffset, 1);
    restOffset += 1;
    print('immediate sub indicator: $immediateSubsIndicator');
    final immediateSubs = immediateSubsIndicator == '1';
    if (immediateSubs) {
      print('restoffset: $restOffset');
      print('rest: $rest');
      String subLengthIndicator = rest.substring(restOffset, restOffset + 11);
      print('immediate sub legnth indicator: $subLengthIndicator');
      restOffset += 11;

      final numberOfSubs = int.parse(subLengthIndicator, radix: 2);
      print('number of subs: $numberOfSubs');
      final subPackets = <Packet>[];
      for (int i = 0; i < numberOfSubs; i++) {
        final offset = restOffset + lengthOfPackets(subPackets);
        print('create subpacket at $offset');
        final subPacket = parsePacket(rest.substring(offset));
        subPackets.add(subPacket);
      }
      return OperatorPacket(
        version,
        type,
        immediateSubs,
        subLengthIndicator,
        subPackets,
      );
    } else {
      String subLengthIndicator = rest.substring(restOffset, restOffset + 15);
      restOffset += 15;

      final subPacketLength = int.parse(subLengthIndicator, radix: 2);
      print('subPacket length: $subPacketLength');
      final subPackets = <Packet>[];
      while (lengthOfPackets(subPackets) < subPacketLength) {
        final subPacket = parsePacket(
            rest.substring(restOffset + lengthOfPackets(subPackets)));
        subPackets.add(subPacket);
      }
      return OperatorPacket(
        version,
        type,
        immediateSubs,
        subLengthIndicator,
        subPackets,
      );
    }
  }
}

int lengthOfPackets(List<Packet> packets) =>
    packets.map((p) => p.length).fold(0, (v, e) => v + e);

String toBinaryString(String input) {
  return input
      .split('')
      .map(
          (char) => int.parse(char, radix: 16).toRadixString(2).padLeft(4, '0'))
      .join('');
}

List<int> toBinaryList(String input) {
  return int.parse(input, radix: 16)
      .toRadixString(2)
      .split('')
      .map((e) => int.parse(e))
      .toList();
}
