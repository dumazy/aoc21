import 'package:aoc_day12/packet_decoder.dart';
import 'package:test/test.dart';

void main() {
  test(
    'parse literal packet',
    () {
      final input = '110100101111111000101000';
      final rest = '101111111000101000';
      final packet = PacketDecoder('').parseLiteralPacket('110', '100', rest);
      expect(packet.version, '110');
      expect(packet.type, '100');
      expect(packet.subs.length, 3);
      expect(packet.subs[0], '10111');
      expect(packet.subs[1], '11110');
      expect(packet.subs[2], '00101');
      expect(packet.value, 2021);
    },
  );

  test(
    'parse simple literal packet 1',
    () {
      final input = '01010000001';
      final rest = '00001';
      final packet = PacketDecoder('').parseLiteralPacket('010', '100', rest);
      expect(packet.version, '010');
      expect(packet.type, '100');
      expect(packet.subs.length, 1);
      expect(packet.subs[0], '00001');
    },
  );

  test(
    'parse operator packet with fixed length of payload',
    () {
      final input = '00111000000000000110111101000101001010010001001000000000';
      final rest = '00000000000110111101000101001010010001001000000000';
      final packet = PacketDecoder('').parseOperatorPacket('001', '110', rest);
      expect(packet.version, '001');
      expect(packet.type, '110');
      expect(packet.shortSubLengthIndicator, false);
      expect(packet.subLengthIndicator, '000000000011011');
      expect(packet.subs.length, 2);
    },
  );

  test(
    'parse operator packet with immediate number of subpackets',
    () {
      final input = '11101110000000001101010000001100100000100011000001100000';
      final rest = '10000000001101010000001100100000100011000001100000';
      final packet = PacketDecoder('').parseOperatorPacket('111', '011', rest);
      expect(packet.version, '111');
      expect(packet.type, '011');
      expect(packet.shortSubLengthIndicator, true);
      expect(packet.subLengthIndicator, '00000000011');
      expect(packet.subs.length, 3);
    },
  );
}
